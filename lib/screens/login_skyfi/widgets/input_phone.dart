import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class InputPhone extends StatelessWidget {
  const InputPhone({
    super.key,
    required this.phoneNumber,
    required this.label,
    this.onChanged,
    this.controller,
  });

  final String phoneNumber;
  final String label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: AppColors.black),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                label,
                style: AppTextStyles.small.copyWith(
                  color: AppColors.textLight,
                ),
              ),
              Text(
                " *",
                style: AppTextStyles.small.copyWith(
                  color: AppColors.red,
                ),
              ),
            ],
          ),
          TextField(
            controller: controller,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.phone,
            onChanged: onChanged,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textLight,
            ),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Nhập số điện thoại',
              hintStyle: TextStyle(
                color: AppColors.textLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
