import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';

class ItemSendOtp extends StatelessWidget {
  const ItemSendOtp({super.key, required this.phone, required this.onPressed});

  final String phone;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
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
                    phone.startsWith('0') ? phone : '0$phone',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
            GradientButton(
              width: 100,
              onPressed: () {
                onPressed();
              },
              text: 'Gửi OTP',
              textStyle: AppTextStyles.button.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
