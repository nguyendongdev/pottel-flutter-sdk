import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';

class SerialInputField extends StatelessWidget {
  const SerialInputField({
    super.key,
    required this.controller,
    required this.onScanTap,
    this.onChanged,
  });

  final TextEditingController controller;
  final VoidCallback onScanTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        border: Border.all(color: AppColors.text),
      ),
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: 0,
        top: AppSpacing.xs,
        bottom: AppSpacing.xs,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.translate('serial_label_widget'),
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.textGrey,
                      ),
                    ),
                    Text(
                      '*',
                      style: AppTextStyles.smallBold.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textLight,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: context.l10n.translate('enter_serial_or_scan'),
                    hintStyle: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onScanTap,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            icon: SvgPicture.asset(
              'assets/icons/feat_scan.svg',
              width: 20,
              height: 20,
              package: 'pottel_sdk',
            ),
          ),
        ],
      ),
    );
  }
}
