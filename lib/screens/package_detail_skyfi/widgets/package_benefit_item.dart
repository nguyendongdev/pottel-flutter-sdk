import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';

class PackageBenefitItem extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const PackageBenefitItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon container
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(AppSpacing.xs),
          ),
          child: SvgPicture.asset(
            icon,
            width: 32,
            height: 32,
            package: 'skyfi_sdk',
          ),
        ),

        const SizedBox(height: 12),

        // Description
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF666666),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181818),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
