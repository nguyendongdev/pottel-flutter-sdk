import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class PopupCenterCard extends StatelessWidget {
  const PopupCenterCard({
    super.key,
    this.title = 'Thông báo',
    this.description = 'Có lỗi vui lòng thử lại sau',
    this.primaryButtonText = 'Đóng',
    this.secondaryButtonText = 'Tiếp tục',
    required this.onPrimaryButtonTap,
    required this.onSecondaryButtonTap,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.width = 327,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.primaryButtonTextStyle,
    this.secondaryButtonTextStyle,
  });

  final String title;
  final String description;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;
  final double width;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? primaryButtonTextStyle;
  final TextStyle? secondaryButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: titleTextStyle ??
                  AppTextStyles.title.copyWith(color: AppColors.text),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              description,
              style: descriptionTextStyle ??
                  AppTextStyles.body.copyWith(color: AppColors.textGrey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: _OutlinedButton(
                    text: secondaryButtonText,
                    onTap: onSecondaryButtonTap,
                    color: secondaryButtonColor ?? AppColors.primary,
                    textStyle: secondaryButtonTextStyle,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _FilledButton(
                    text: primaryButtonText,
                    onTap: onPrimaryButtonTap,
                    color: primaryButtonColor ?? AppColors.primary,
                    textStyle: primaryButtonTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilledButton extends StatelessWidget {
  const _FilledButton({
    required this.text,
    required this.onTap,
    required this.color,
    this.textStyle,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.lg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.button,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    required this.text,
    required this.onTap,
    required this.color,
    this.textStyle,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.lg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            AppTextStyles.button.copyWith(
              color: color,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
