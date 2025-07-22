import 'package:flutter/material.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/core/widgets/outline_button.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

class ModalMessage extends StatelessWidget {
  const ModalMessage({
    required this.title,
    required this.message,
    this.confirmText,
    this.closeText,
    this.onConfirm,
    this.onClose,
    this.showBothButtons = true,
    this.icon,
    this.titleColor,
    this.messageColor,
  });

  final String title;
  final String message;
  final String? confirmText;
  final String? closeText;
  final VoidCallback? onConfirm;
  final VoidCallback? onClose;
  final bool showBothButtons;
  final Widget? icon;
  final Color? titleColor;
  final Color? messageColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon (if provided)
              if (icon != null) ...[
                icon!,
                const SizedBox(height: AppSpacing.lg),
              ],

              // Title
              Text(
                title,
                style: AppTextStyles.heading.copyWith(
                  color: titleColor ?? AppColors.text,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.md),

              // Message
              Text(
                message,
                style: AppTextStyles.body.copyWith(
                  color: messageColor ?? AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.xl),

              // Buttons
              if (showBothButtons)
                Row(
                  children: [
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          onClose?.call();
                        },
                        text: closeText ?? context.l10n.translate('close_button'),
                        height: 48,
                        textStyle: AppTextStyles.button.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: GradientButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          onConfirm?.call();
                        },
                        text: confirmText ?? context.l10n.translate('confirm'),
                        height: 48,
                        textStyle: AppTextStyles.button.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                    text: confirmText ?? context.l10n.translate('ok_button'),
                    height: 48,
                    textStyle: AppTextStyles.button.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
