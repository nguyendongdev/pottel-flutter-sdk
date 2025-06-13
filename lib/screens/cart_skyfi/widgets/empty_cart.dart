import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
    required this.onContinueShopping,
    this.title = 'Chưa có sản phầm nào trong giỏ',
    this.description = 'Bạn có thể ghé thăm cửa hàng của chúng tôi và mua sắm.',
    this.titleButton = 'Tiếp tục mua SIM',
  });
  final String title;
  final String description;
  final VoidCallback onContinueShopping;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_cart.png',
            width: 200,
            height: 200,
            package: 'skyfi_sdk',
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            title,
            style: AppTextStyles.heading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          GradientButton(
            onPressed: onContinueShopping,
            text: titleButton,
            height: 48,
          ),
        ],
      ),
    );
  }
}
