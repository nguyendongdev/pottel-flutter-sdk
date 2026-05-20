import 'package:flutter/material.dart';
import 'package:pottel_sdk/core/widgets/gradient_button.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../l10n/localization_extension.dart';
import '../provider/ekyc_provider.dart';

class PreviewOverlay extends StatelessWidget {
  const PreviewOverlay(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.type,
      required this.loading,
      required this.canNext});

  final VoidCallback onNext;
  final VoidCallback onBack;
  final EkycType type;
  final bool loading;
  final bool canNext;
  String _getTitleWithContext(BuildContext context) {
    if (type == EkycType.cartFront) {
      return context.l10n.translate('front_side');
    }
    if (type == EkycType.cartBack) {
      return context.l10n.translate('back_side');
    }
    if (type == EkycType.selfie) {
      return '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background overlay with cutout
        CustomPaint(
          size: Size.infinite,
          painter: PreviewOverlayPainter(type: type),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  context.l10n.translate('take_cccd_photo'),
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.white,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                  onPressed: onBack,
                ),
              ),
              const Spacer(),
              Text(
                _getTitleWithContext(context),
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 400),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                child: Text(
                  context.l10n.translate('ensure_clear_id_image'),
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // outline button
                    OutlineButton(
                      width: 150,
                      height: 48,
                      disabled: loading,
                      onPressed: onBack,
                      text: context.l10n.translate('retake_photo_action'),
                      textStyle: AppTextStyles.button.copyWith(
                        color: loading ? AppColors.textGrey : AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    GradientButton(
                      width: 150,
                      height: 48,
                      disabled: !canNext,
                      onPressed: onNext,
                      text: context.l10n.translate('select_action_button'),
                      textStyle: AppTextStyles.button.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ],
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

class PreviewOverlayPainter extends CustomPainter {
  final EkycType type;

  PreviewOverlayPainter({required this.type});

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
    } else {
      // Calculate the scanning area dimensions for ID card
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
