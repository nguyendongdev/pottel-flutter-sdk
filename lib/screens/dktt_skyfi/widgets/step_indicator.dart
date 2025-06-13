import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.total,
    required this.current,
  });

  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        total,
        (index) => Container(
          width: 48,
          height: 3,
          margin: EdgeInsets.only(
            right: index < total - 1 ? AppSpacing.xs : 0,
          ),
          decoration: BoxDecoration(
            color: index < current ? AppColors.primary : AppColors.neutral100,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
