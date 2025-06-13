import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';

class IconGradientButton extends StatelessWidget {
  const IconGradientButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.gradient = AppColors.primaryGradient,
    this.height = 36,
    this.width,
    this.borderRadius,
    this.padding,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final LinearGradient gradient;
  final double height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppSpacing.buttonRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppSpacing.buttonRadius),
          child: Center(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(AppSpacing.sm),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
