import 'package:flutter/material.dart';

class BaseTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final BorderRadius? borderRadius;
  final double? verticalOffset;
  final TooltipTriggerMode? triggerMode;
  final bool? showOnTap;
  final bool? showOnLongPress;
  final Duration? waitDuration;
  final Duration? showDuration;

  const BaseTooltip({
    super.key,
    required this.message,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.borderRadius,
    this.verticalOffset,
    this.triggerMode,
    this.showOnTap,
    this.showOnLongPress,
    this.waitDuration,
    this.showDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      padding: padding ?? const EdgeInsets.all(8.0),
      margin: margin ?? const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF040415),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textStyle: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? 'DM SansVN',
      ),
      verticalOffset: verticalOffset ?? 20,
      triggerMode: triggerMode ?? TooltipTriggerMode.longPress,
      waitDuration: waitDuration ?? const Duration(milliseconds: 500),
      showDuration: showDuration ?? const Duration(seconds: 2),
      child: child,
    );
  }
}
