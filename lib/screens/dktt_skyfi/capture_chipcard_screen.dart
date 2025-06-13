import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../routers/routers.dart';
import '../../utilities/ekyc_helper.dart';
import 'widgets/capture_overlay.dart';
import 'provider/ekyc_provider.dart';

class CaptureChipCardScreen extends StatefulWidget {
  const CaptureChipCardScreen({super.key, required this.type});
  final EkycType type;

  @override
  State<CaptureChipCardScreen> createState() => _CaptureChipCardScreenState();
}

class _CaptureChipCardScreenState extends State<CaptureChipCardScreen>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  bool _isReady = false;
  bool _isMounted = false;
  EkycType? _currentType;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _currentType = widget.type;
    WidgetsBinding.instance.addObserver(this);
    initCamera();
  }

  @override
  void didUpdateWidget(CaptureChipCardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Nếu type thay đổi, cập nhật camera
    if (oldWidget.type != widget.type) {
      _currentType = widget.type;
      _reinitializeCamera();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_cameraController != null) {
        initCamera();
      }
    }
  }

  @override
  void dispose() {
    _isMounted = false;
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _reinitializeCamera() async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
      _cameraController = null;
      setState(() {
        _isReady = false;
      });
    }
    await initCamera();
  }

  Future<void> setupCamera(CameraDescription cameraDescription) async {
    final resolutionPreset =
        Platform.isAndroid ? ResolutionPreset.high : ResolutionPreset.high;

    try {
      final controller = CameraController(
        cameraDescription,
        resolutionPreset,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.yuv420
            : ImageFormatGroup.bgra8888,
      );

      _cameraController = controller;

      await controller.initialize();
      await controller.setExposureMode(ExposureMode.auto);
      await controller.setFlashMode(FlashMode.off);
      await controller.setZoomLevel(1.0);

      if (Platform.isAndroid) {
        try {
          await controller.setFocusMode(FocusMode.auto);
          await controller.lockCaptureOrientation();
        } catch (e) {
          debugPrint('Android optimization failed: $e');
        }
      }

      if (_isMounted) {
        setState(() {
          _isReady = true;
        });
      }
    } on CameraException catch (e) {
      debugPrint('Error setting up camera: ${e.description}');
      if (_isMounted) {
        setState(() {
          _isReady = false;
        });
      }
    }
  }

  Future<void> initCamera() async {
    final statusCamera = await Permission.camera.status;
    final statusMicrophone = await Permission.microphone.status;

    if (statusCamera.isDenied) {
      await Permission.camera.request();
    }
    if (statusMicrophone.isDenied) {
      await Permission.microphone.request();
    }
    if (await Permission.camera.status.isPermanentlyDenied ||
        await Permission.microphone.status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }

    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      if (widget.type == EkycType.selfie) {
        await setupCamera(frontCamera);
      } else {
        await setupCamera(backCamera);
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
      if (_isMounted) {
        setState(() {
          _isReady = false;
        });
      }
    }
  }

  Future<void> captureImage() async {
    if (_cameraController == null) return;

    try {
      final file = await _cameraController!.takePicture();
      final originalBytes = await File(file.path).readAsBytes();

      // Validate image before processing
      if (!EkycHelper.validateImageForEkyc(originalBytes)) {
        debugPrint('Image validation failed');
        // You can show an error message to user here
        return;
      }

      // Set loading state TRƯỚC khi dispose camera
      if (_isMounted) {
        setState(() {
          _isReady = false;
        });
      }

      final base64Image = base64Encode(originalBytes);

      // Compress and encode image based on type
      // final base64Image = await EkycHelper.compressAndEncodeImage(
      //   originalBytes,
      //   isSelfie: widget.type == EkycType.selfie,
      // );

      // Dispose camera trước khi navigate
      if (_cameraController != null) {
        await _cameraController?.dispose();
        _cameraController = null;
      }
      // setTimeout 1s
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _isReady = false;
      });

      if (mounted) {
        final result = await context.pushNamed(
          AppRouter.previewCaptureChipCard,
          extra: {
            'image': base64Image,
            'type': widget.type,
          },
        );
        // Reinitialize camera khi quay lại
        if (result == null && mounted) {
          await initCamera();
        }
        if (result != null) {
          print('result: $result');
        }
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
      // You can show an error message to user here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isReady && _cameraController != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Platform.isAndroid
                  ? ClipRect(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width:
                              (_cameraController!.value.previewSize?.height ??
                                      1) *
                                  0.6,
                          height:
                              (_cameraController!.value.previewSize?.width ??
                                      1) *
                                  0.6,
                          child: CameraPreview(
                            _cameraController!,
                            child: Consumer(
                              builder: (context, ref, child) {
                                final ekycType = ref.watch(typesScreenProvider);
                                return CaptureOverlay(
                                  type: widget.type,
                                  onCapture: captureImage,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  : CameraPreview(
                      _cameraController!,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final ekycType = ref.watch(typesScreenProvider);
                          return CaptureOverlay(
                            type: widget.type,
                            onCapture: captureImage,
                          );
                        },
                      ),
                    ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
