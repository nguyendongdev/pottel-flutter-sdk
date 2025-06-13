import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.navHomeTextSelected,
            borderRadius: BorderRadius.circular(AppSpacing.iconRadius),
          ),
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            package: 'skyfi_sdk',
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: AppColors.neutral0,
          ),
        ),
      ],
    );
  }
}
