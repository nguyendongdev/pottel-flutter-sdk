import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/routers/routers.dart';

import 'widgets/scan_overlay.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({super.key});

  @override
  State<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  late final MobileScannerController controller;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture barcodes) {
    if (!mounted) return;
    print("barcodes ${barcodes.barcodes.firstOrNull?.rawValue}");
    // lấy 11 số cuối của barcode
    // need trim barcode
    final barcode = barcodes.barcodes.firstOrNull?.rawValue;
    if (barcode != null) {
      // final last11Digits = barcode.substring(barcode.length - 11);
      // context.pop(barcode.trim());
      context.goNamed(AppRouter.infoRegis, extra: barcode.trim());
    }
    controller.stop();
  }

  void _onManualInput() {
    // context.pop();
    context.pushNamed(AppRouter.infoRegis);
  }

  Future<void> _onUpload() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final result = await controller.analyzeImage(image.path);

        if (result != null && result.barcodes.isNotEmpty) {
          final barcode = result.barcodes.first.rawValue;
          if (barcode != null && mounted) {
            // context.pop(barcode.trim());
            context.goNamed(AppRouter.infoRegis, extra: barcode.trim());
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.translate('barcode_not_found')),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context
                .translate('image_read_error')
                .replaceAll('{0}', e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
            scanWindowUpdateThreshold: 1000,
          ),
          ScanOverlay(
            onManualInput: _onManualInput,
            onUpload: _onUpload,
          ),
        ],
      ),
    );
  }
}
