import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class DiscountCodeInput extends StatelessWidget {
  const DiscountCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF464B), Color(0xFF8CC832)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius - 1),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // TODO: Implement discount code input
            },
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius - 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Áp dụng mã giảm giá',
                    style: AppTextStyles.body,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
