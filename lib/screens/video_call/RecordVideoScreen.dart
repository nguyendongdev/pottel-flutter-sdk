import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/network/api.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/utilities/common.dart';
import 'package:pottel_sdk/utilities/security.dart';
import 'package:video_player/video_player.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';

enum EnumStatusRecord { open, progress, finish }

enum EnumServiceSim { activity, update }

enum EnumCardType { font, back, face, info }

enum DisplayMode { normalUpdate, busyUpdate, normalRegister, busyRegister }

int DurationCountDown = 20;

class VerticalButtons extends StatelessWidget {
  final void Function() onRecord;
  final void Function() onGoHome;
  const VerticalButtons(
      {super.key, required this.onRecord, required this.onGoHome});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // button start recoding
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: onRecord,
            child: Text(
              context.l10n.translate('start_recording'),
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        // button comeback home
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(color: AppColors.primary),
              ),
            ),
            onPressed: onGoHome,
            child: Text(
              context.l10n.translate('go_home'),
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HorizontalButtons extends StatelessWidget {
  const HorizontalButtons(
      {super.key, required this.onRetry, required this.onSendVideo});
  final void Function() onSendVideo;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 160,
            height: 48,
            child: ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(color: AppColors.primary),
                ),
              ),
              child: Text(
                context.l10n.translate('retry'),
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            )),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 160,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: onSendVideo,
              child: Text(context.l10n.translate('send_video')),
            ))
      ],
    );
  }
}

class RecordingControls extends StatelessWidget {
  const RecordingControls({super.key, required this.onStop});
  final void Function() onStop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Stop button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: onStop,
            child: Text(
              context.l10n.translate('stop_recording'),
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CountDownTimer extends StatefulWidget {
  final Duration duration;
  final void Function() onFinish;
  const CountDownTimer(
      {super.key, required this.duration, required this.onFinish});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer? timer;
  late Duration duration;
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void initState() {
    duration = widget.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    super.initState();
  }

  setCountDown() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      if (seconds < 0) {
        timer!.cancel();
        widget.onFinish();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.circle,
                color: AppColors.red,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  textAlign: TextAlign.right,
                  context.l10n.translate('recording').replaceFirst('{0}', twoDigits(duration.inSeconds)),
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}

class RecordDescription extends StatelessWidget {
  const RecordDescription({
    super.key,
    this.phoneNumber = '',
  });
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        context.l10n.translate('video_instructions_title'),
        style: AppTextStyles.title.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: context.l10n.translate('video_step_1'),
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_1_desc'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_1_button'),
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            )),
      ])),
      const SizedBox(
        height: 4,
      ),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: context.l10n.translate('video_step_2'),
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_2_desc'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
      ])),
      const SizedBox(
        height: 4,
      ),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: context.l10n.translate('video_step_3'),
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_3_desc'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
      ])),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: context.l10n.translate('your_phone_number'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
        TextSpan(
            text: phoneNumber.replaceFirst('84', '0'),
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
      ])),
      const SizedBox(
        height: 4,
      ),
      // Container(
      //     margin: const EdgeInsets.symmetric(vertical: 10),
      //     padding: const EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //         border: Border.all(color: AppColors.primary, width: 2),
      //         borderRadius: BorderRadius.circular(10)),
      //     child: Text.rich(TextSpan(children: [
      //       const TextSpan(
      //           text: 'Bước 3:',
      //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      //       TextSpan(
      //           text: ' Đọc số thuê bao cần Đăng ký/ cập nhật \nSố thuê bao: ',
      //           style: AppTextStyles.label.copyWith(
      //             color: AppColors.black,
      //           )),
      //       // start with 84 change to 0
      //       TextSpan(
      //           text: phoneNumber.replaceFirst('84', '0'),
      //           style: const TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //               color: AppColors.primary)),
      //     ]))),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: context.l10n.translate('video_step_4'),
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_4_desc'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
        TextSpan(
            text: context.l10n.translate('video_step_4_button'),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        TextSpan(
            text: context.l10n.translate('video_step_4_complete'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.black,
            )),
      ]))
    ]);
  }
}

class RecordVideoScreen extends StatefulWidget {
  final String idCall;
  final String phoneNumber;
  final EnumServiceSim type;

  const RecordVideoScreen(
      {Key? key,
      required this.idCall,
      required this.phoneNumber,
      required this.type})
      : super(key: key);

  @override
  _RecordVideoScreenState createState() => _RecordVideoScreenState();
}

class _RecordVideoScreenState extends State<RecordVideoScreen> {
  // Kyc service
  final API kycService = API();
  bool _isLoading = true;
  bool _isBack = false;
  String _filePath = '';
  late String idCall;
  late String phoneNumber;
  late EnumServiceSim type;
  Enum _statusRecordVideo = EnumStatusRecord.open;
  late CameraController _cameraController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    idCall = widget.idCall;
    phoneNumber = widget.phoneNumber;
    type = widget.type;
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(
      front,
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    await _cameraController.setExposureMode(ExposureMode.auto);
    await _cameraController.setFlashMode(FlashMode.off);
    // print data pass from previous screen
    print(
        'data pass from previous screen: ${widget.phoneNumber} ${widget.idCall}- ${widget.type}');
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    await _cameraController.prepareForVideoRecording();
    await _cameraController.startVideoRecording();
  }

  _stopRecordVideo() async {
    final file = await _cameraController.stopVideoRecording();
    setState(() {
      _filePath = file.path;
    });
    print('filePath[${file.name}] => PATH: ${file.path}');
    // _initVideoPlayer(file.path);
    setState(() {
      _statusRecordVideo = EnumStatusRecord.finish;
    });
  }

  _onSendVideo(String idCall, String filePath) async {
    setState(() {
      _isLoading = true;
    });
    final code = await Security.hashSecureCode(idCall);
    final path = filePath;
    ;
    var formData = FormData.fromMap({
      'id': idCall,
      'code': code,
      'files': await MultipartFile.fromFile(path,
          filename: "$idCall.mp4", contentType: DioMediaType.parse('video/mp4'))
    });
    print('formData: ${formData.fields}');
    try {
      final response = await kycService.postWithFormData(
        '/bss/videocall/save-video-busy',
        data: formData,
      );
      setState(() {
        _isBack = true;
      });
      print(response);
      if (response.data['code'] == 200) {
        Common.showAlertDialog(context, context.l10n.translate('notification'),
            context.l10n.translate('registration_success'),
            () {
          context.goNamed(AppRouter.homeSkyFiNew);
        });
        return;
      } else {
        return Common.showAlertDialog(
            context, 'Thông báo', response.data['message'], () {
          context.pop();
        });
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.data['code'] == 400) {
          return Common.showAlertDialog(
              context, 'Thông báo', e.response!.data['message'], () {});
        }
        return Common.showAlertDialog(
            context, 'Thông báo', e.response!.data['message'], () {});
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future _initVideoPlayer(filePath) async {
    _videoPlayerController = VideoPlayerController.file(File(filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(false);
    await _videoPlayerController.play();
  }

  _goHome() {
    return context.goNamed(AppRouter.homeSkyFiNew);
  }

  _renderFooter() {
    switch (_statusRecordVideo) {
      case (EnumStatusRecord.open):
        return VerticalButtons(
          onGoHome: () {
            _goHome();
          },
          onRecord: () {
            _recordVideo();
            setState(() {
              _statusRecordVideo = EnumStatusRecord.progress;
            });
          },
        );
      case (EnumStatusRecord.finish):
        return HorizontalButtons(onRetry: () {
          setState(() {
            _statusRecordVideo = EnumStatusRecord.open;
          });
        }, onSendVideo: () {
          _onSendVideo(idCall, _filePath);
        });
      case (EnumStatusRecord.progress):
        return RecordingControls(
          onStop: () {
            _stopRecordVideo();
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            _isBack ? context.goNamed(AppRouter.homeSkyFiNew) : context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          context.l10n.translate('register_update_info'),
          style: AppTextStyles.title.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecordDescription(
              phoneNumber: widget.phoneNumber,
            ),
            const SizedBox(
              height: 20,
            ),
            // CameraView to record video
            Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: _statusRecordVideo == EnumStatusRecord.finish
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: FutureBuilder(
                                    future: _initVideoPlayer(_filePath),
                                    builder: (context, state) {
                                      if (state.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: size.width,
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: SizedBox(
                                                  width: _videoPlayerController
                                                      .value.size.width,
                                                  height: _videoPlayerController
                                                      .value.size.height,
                                                  child: AspectRatio(
                                                    aspectRatio:
                                                        _videoPlayerController
                                                            .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _videoPlayerController),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            _videoPlayerController
                                                    .value.isPlaying
                                                ? InkWell(
                                                    onTap: () {
                                                      // stop and play video
                                                      _videoPlayerController
                                                              .value.isPlaying
                                                          ? _videoPlayerController
                                                              .pause()
                                                          : _videoPlayerController
                                                              .play();
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .play_circle_outline_outlined,
                                                      color: AppColors.white,
                                                      size: 60,
                                                    ),
                                                  )
                                                : const SizedBox()
                                          ],
                                        );
                                      }
                                    }),
                              )
                            : Stack(
                                children: [
                                  SizedBox(
                                      width: size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: SizedBox(
                                            width: _cameraController
                                                .value.previewSize!.height,
                                            height: _cameraController
                                                .value.previewSize!.width,
                                            child: AspectRatio(
                                                aspectRatio: _cameraController
                                                    .value.aspectRatio,
                                                child: CameraPreview(
                                                  _cameraController,
                                                )),
                                          ),
                                        ),
                                      )),
                                  _statusRecordVideo ==
                                          EnumStatusRecord.progress
                                      ? CountDownTimer(
                                          duration: Duration(
                                              seconds: DurationCountDown),
                                          onFinish: () {
                                            _stopRecordVideo();
                                          })
                                      : const SizedBox(),
                                ],
                              ))),

            Padding(padding: const EdgeInsets.all(8), child: _renderFooter()),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
