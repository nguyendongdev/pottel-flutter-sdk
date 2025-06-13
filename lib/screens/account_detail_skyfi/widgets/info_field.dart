import 'package:flutter/material.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class InfoField extends StatelessWidget {
  final String label;
  final String value;
  final bool isFullWidth;

  const InfoField({
    super.key,
    required this.label,
    required this.value,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.label,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
