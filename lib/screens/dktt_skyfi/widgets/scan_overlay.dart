import 'package:flutter/material.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class ScanOverlay extends StatelessWidget {
  const ScanOverlay({
    super.key,
    required this.onManualInput,
  });

  final VoidCallback onManualInput;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background overlay with cutout
        CustomPaint(
          size: Size.infinite,
          painter: ScanOverlayPainter(),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const Spacer(),
              Text(
                'Quét mã QR trên thân thẻ',
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                child: Text(
                  'Hướng camera về phía mã Barcode trên thân thẻ chứa Sim để quét mã vạch',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: GradientButton(
                  width: 160,
                  height: 56,
                  textStyle: AppTextStyles.heading.copyWith(
                    color: AppColors.text,
                  ),
                  onPressed: onManualInput,
                  text: 'Nhập số serial',
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ],
    );
  }
}

class ScanOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    // Calculate the scanning area dimensions
    const scanAreaWidth = 350.0;
    const scanAreaHeight = 150.0;
    final left = (size.width - scanAreaWidth) / 2;
    final top = (size.height - scanAreaHeight) / 2;
    final scanArea = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, scanAreaWidth, scanAreaHeight),
      const Radius.circular(12),
    );
    // border radios color

    // Create a path for the entire screen
    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create a path for the scanning area
    final scanPath = Path()..addRRect(scanArea);

    // Cut out the scanning area from the background
    final finalPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      scanPath,
    );

    canvas.drawPath(finalPath, paint);

    // Draw scan area border
    final borderPaint = Paint()
      ..color = AppColors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(scanArea, borderPaint);

    // Draw corner borders
    final cornerPaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const cornerLength = 32.0;
    const cornerOffset = 8.0;

    // Top-left
    canvas.drawLine(
      Offset(left - cornerOffset, top - cornerOffset),
      Offset(left - cornerOffset, top - cornerOffset + cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left - cornerOffset, top - cornerOffset),
      Offset(left - cornerOffset + cornerLength, top - cornerOffset),
      cornerPaint,
    );

    // Top-right
    canvas.drawLine(
      Offset(left + scanAreaWidth + cornerOffset, top - cornerOffset),
      Offset(left + scanAreaWidth + cornerOffset,
          top - cornerOffset + cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanAreaWidth + cornerOffset, top - cornerOffset),
      Offset(left + scanAreaWidth + cornerOffset - cornerLength,
          top - cornerOffset),
      cornerPaint,
    );

    // Bottom-left
    canvas.drawLine(
      Offset(left - cornerOffset, top + scanAreaHeight + cornerOffset),
      Offset(left - cornerOffset,
          top + scanAreaHeight + cornerOffset - cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left - cornerOffset, top + scanAreaHeight + cornerOffset),
      Offset(left - cornerOffset + cornerLength,
          top + scanAreaHeight + cornerOffset),
      cornerPaint,
    );

    // Bottom-right
    canvas.drawLine(
      Offset(left + scanAreaWidth + cornerOffset,
          top + scanAreaHeight + cornerOffset),
      Offset(left + scanAreaWidth + cornerOffset,
          top + scanAreaHeight + cornerOffset - cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(left + scanAreaWidth + cornerOffset,
          top + scanAreaHeight + cornerOffset),
      Offset(left + scanAreaWidth + cornerOffset - cornerLength,
          top + scanAreaHeight + cornerOffset),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
