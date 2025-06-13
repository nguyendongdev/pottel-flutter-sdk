import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class PopupNotice extends StatelessWidget {
  const PopupNotice({
    super.key,
    this.title = 'Thông báo',
    this.description = 'Có lỗi vui lòng thử lại sau',
    this.buttonText = 'Đóng',
    required this.onButtonTap,
    this.buttonColor,
    this.width = 327,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.buttonTextStyle,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonTap;
  final Color? buttonColor;
  final double width;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? buttonTextStyle;

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
            SizedBox(
              width: double.infinity,
              child: _FilledButton(
                text: buttonText,
                onTap: onButtonTap,
                color: buttonColor ?? AppColors.primary,
                textStyle: buttonTextStyle,
              ),
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

/// Common function to show PopupNotice
Future<void> showPopupNotice(
  BuildContext context, {
  String title = 'Thông báo',
  String description = 'Có lỗi vui lòng thử lại sau',
  String buttonText = 'Đóng',
  VoidCallback? onButtonTap,
  Color? buttonColor,
  double width = 327,
  TextStyle? titleTextStyle,
  TextStyle? descriptionTextStyle,
  TextStyle? buttonTextStyle,
  bool barrierDismissible = true,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return PopupNotice(
        title: title,
        description: description,
        buttonText: buttonText,
        onButtonTap: onButtonTap ?? () => Navigator.of(context).pop(),
        buttonColor: buttonColor,
        width: width,
        titleTextStyle: titleTextStyle,
        descriptionTextStyle: descriptionTextStyle,
        buttonTextStyle: buttonTextStyle,
      );
    },
  );
}
