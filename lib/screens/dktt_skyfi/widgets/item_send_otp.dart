import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';

class ItemSendOtp extends StatelessWidget {
  const ItemSendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Số thuê bao',
                    style: AppTextStyles.small.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    '0772 123 456',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
            GradientButton(
              width: 100,
              onPressed: () {},
              text: 'Gửi OTP',
              textStyle: AppTextStyles.button.copyWith(
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
