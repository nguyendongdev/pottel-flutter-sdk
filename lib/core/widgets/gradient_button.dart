import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.gradient = AppColors.primaryGradient,
    this.height = 36,
    this.width,
    this.borderRadius,
    this.textStyle,
    this.disabled = false,
  });

  final VoidCallback onPressed;
  final String text;
  final LinearGradient gradient;
  final double height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: disabled == true ? AppColors.disabledGradient : gradient,
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppSpacing.buttonRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled == true ? null : onPressed,
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppSpacing.buttonRadius),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.buttonPadding,
              ),
              child: Text(
                text,
                style: textStyle ?? AppTextStyles.button,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
