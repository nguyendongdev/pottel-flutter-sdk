import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class AppCheckboxWithLink extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;
  final String linkText;
  final VoidCallback onLinkTap;

  const AppCheckboxWithLink({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.linkText,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            side: const BorderSide(
              color: AppColors.text,
              width: 1.5,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: _buildTextSpans(),
              style: AppTextStyles.label.copyWith(
                color: AppColors.text,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<TextSpan> _buildTextSpans() {
    final parts = text.split(linkText);
    final List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      // Add the regular text part
      if (parts[i].isNotEmpty) {
        spans.add(
          TextSpan(
            text: parts[i],
            style: AppTextStyles.label.copyWith(
              color: AppColors.text,
            ),
          ),
        );
      }

      // Add the link part (except for the last iteration)
      if (i < parts.length - 1) {
        spans.add(
          TextSpan(
            text: linkText,
            style: AppTextStyles.label.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onLinkTap,
          ),
        );
      }
    }

    return spans;
  }
}
