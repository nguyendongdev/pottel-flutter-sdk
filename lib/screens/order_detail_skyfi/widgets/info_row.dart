import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;
  final bool isHighlighted;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueStyle,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: AppColors.text.withOpacity(0.8),
          ),
        ),
        Text(
          value,
          style: valueStyle ??
              AppTextStyles.body.copyWith(
                color: isHighlighted ? AppColors.primary : AppColors.text,
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
