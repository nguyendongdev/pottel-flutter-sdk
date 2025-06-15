import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../provider/ekyc_provider.dart';

class CaptureOverlay extends StatelessWidget {
  const CaptureOverlay({
    super.key,
    required this.onCapture,
    required this.type,
  });

  final VoidCallback onCapture;
  final EkycType type;
  @override
  Widget build(BuildContext context) {
    String title;
    switch (type) {
      case EkycType.cartFront:
        title = 'Mặt trước';
        break;
      case EkycType.cartBack:
        title = 'Mặt sau';
        break;
      case EkycType.selfie:
        title = '';
        break;
    }

    return Stack(
      children: [
        // Background overlay with cutout
        CustomPaint(
          size: Size.infinite,
          painter: CaptureOverlayPainter(type: type),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Chụp ảnh CCCD',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.white,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 300),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: InkWell(
                  onTap: onCapture,
                  child: SvgPicture.asset(
                    'assets/icons/feat_take.svg',
                    width: 71,
                    height: 71,
                    package: 'skyfi_sdk',
                  ),
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

class CaptureOverlayPainter extends CustomPainter {
  final EkycType type;

  CaptureOverlayPainter({required this.type});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    if (type == EkycType.selfie) {
      // Calculate the oval scanning area dimensions
      final ovalWidth = 300.0;
      final ovalHeight = 350.0;
      final centerX = size.width / 2;
      final centerY = size.height / 2;

      // Create a path for the entire screen
      final backgroundPath = Path()
        ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

      // Create a path for the oval scanning area
      final ovalRect = Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: ovalWidth,
        height: ovalHeight,
      );
      final ovalPath = Path()..addOval(ovalRect);

      // Cut out the scanning area from the background
      final finalPath = Path.combine(
        PathOperation.difference,
        backgroundPath,
        ovalPath,
      );

      canvas.drawPath(finalPath, paint);

      // Draw oval border
      final borderPaint = Paint()
        ..color = AppColors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      canvas.drawOval(ovalRect, borderPaint);

      // Draw guide text
      const guideText = 'Đặt khuôn mặt vào trong khung hình';
      final textPainter = TextPainter(
        text: TextSpan(
          text: guideText,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (size.width - textPainter.width) / 2,
          centerY + (ovalHeight / 2) + 24,
        ),
      );
    } else {
      // Original rectangular overlay for ID card capture
      // Calculate the scanning area dimensions
      const scanAreaWidth = 300.0;
      const scanAreaHeight = 200.0;
      final left = (size.width - scanAreaWidth) / 2;
      final top = (size.height - scanAreaHeight) / 2;
      final scanArea = RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, scanAreaWidth, scanAreaHeight),
        const Radius.circular(12),
      );

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
        ..color = AppColors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      canvas.drawRRect(scanArea, borderPaint);

      // Draw corner borders
      final cornerPaint = Paint()
        ..color = AppColors.white
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;

      const cornerLength = 22.0;
      const cornerOffset = -12.0;

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// CaptureOverlayWithPace
