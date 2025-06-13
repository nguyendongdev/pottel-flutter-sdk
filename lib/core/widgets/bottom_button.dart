import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';
import 'gradient_button.dart';

class BottomButton extends StatelessWidget {
  final dynamic textStyle;
  final String text;
  final void Function() onPressed;
  final bool isLoading;

  const BottomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 16,
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: isLoading
          ? Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              ),
              child: const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          : GradientButton(
              onPressed: onPressed,
              text: text,
              textStyle: textStyle,
            ),
    );
  }
}
