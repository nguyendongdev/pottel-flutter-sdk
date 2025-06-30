import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
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
      context.pop(barcode.trim());
    }
    controller.stop();
  }

  void _onManualInput() {
     Navigator.of(context).pop();
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
          ),
        ],
      ),
    );
  }
}
