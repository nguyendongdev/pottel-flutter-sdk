import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../models/package_model.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.package,
    required this.onConfirm,
    required this.onCancel,
    required this.msisdn,
    this.leftDay,
  });

  final PackageModel package;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String msisdn;
  final String? leftDay;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Đổi gói cước',
              style: AppTextStyles.heading,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Bạn đang có gói cước ${package.name} (HSD:  $leftDay). Bằng việc bấm "Tiếp tục", bạn đồng ý gia hạn gói cước hiện tại để đăng ký gói cước mới.',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onCancel,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius:
                            BorderRadius.circular(AppSpacing.buttonRadius),
                      ),
                      child: Center(
                        child: Text(
                          'Bỏ qua',
                          style: AppTextStyles.heading.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: GradientButton(
                    onPressed: onConfirm,
                    text: 'Tiếp tục',
                    height: 48,
                    textStyle: AppTextStyles.heading.copyWith(
                      color: AppColors.white,
                    ),
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
