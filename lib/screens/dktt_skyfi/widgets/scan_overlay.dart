import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../l10n/localization_extension.dart';

class ScanOverlay extends StatelessWidget {
  const ScanOverlay({
    super.key,
    required this.onManualInput,
    required this.onUpload,
  });

  final VoidCallback onManualInput;
  final VoidCallback onUpload;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background overlay with cutout
        CustomPaint(
          size: Size.infinite,
          painter: ScanOverlayPainter(context: context),
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
              // const Spacer(),
              Text(
                context.l10n.translate('scan_qr_on_card_widget'),
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                child: Text(
                  context.l10n.translate('sim_qr_scanning_instructions'),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              // Button up
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onUpload,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload,
                          color: AppColors.white,
                          size: 24,
                        ),
                        Text(
                          context.l10n.translate('upload_qr_code'),
                          style: AppTextStyles.heading.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const Spacer(),
              // Button down
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: GradientButton(
                  width: 200,
                  height: 56,
                  textStyle: AppTextStyles.heading.copyWith(
                    color: AppColors.white,
                  ),
                  onPressed: onManualInput,
                  text: context.l10n.translate('enter_serial_number_action'),
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
  final BuildContext context;
  ScanOverlayPainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    // Calculate the scanning area dimensions
    final scanAreaWidth = MediaQuery.of(context).size.width * 0.9;
    final scanAreaHeight = MediaQuery.of(context).size.height * 0.25;
    final left = (size.width - scanAreaWidth) / 2;
    final top = (size.height - scanAreaHeight) / 2.5;
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
