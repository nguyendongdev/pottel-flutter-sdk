import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class LinkData {
  final String text;
  final VoidCallback onTap;

  const LinkData({
    required this.text,
    required this.onTap,
  });
}

class AppCheckboxWithLink extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;
  final List<LinkData> links;

  const AppCheckboxWithLink({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.links,
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
    if (links.isEmpty) {
      return [
        TextSpan(
          text: text,
          style: AppTextStyles.label.copyWith(
            color: AppColors.text,
          ),
        ),
      ];
    }

    List<TextSpan> spans = [];
    String remainingText = text;
    int currentIndex = 0;

    // Create a list of all link positions in the text
    List<Map<String, dynamic>> linkPositions = [];
    for (LinkData link in links) {
      int index = remainingText.indexOf(link.text);
      while (index != -1) {
        linkPositions.add({
          'start': index + currentIndex,
          'end': index + currentIndex + link.text.length,
          'link': link,
        });
        index = remainingText.indexOf(link.text, index + 1);
      }
    }

    // Sort by start position
    linkPositions.sort((a, b) => a['start'].compareTo(b['start']));

    // Remove overlapping links (keep the first one)
    List<Map<String, dynamic>> filteredLinks = [];
    for (var linkPos in linkPositions) {
      bool overlaps = false;
      for (var existing in filteredLinks) {
        if ((linkPos['start'] < existing['end'] &&
            linkPos['end'] > existing['start'])) {
          overlaps = true;
          break;
        }
      }
      if (!overlaps) {
        filteredLinks.add(linkPos);
      }
    }

    int lastEnd = 0;
    for (var linkPos in filteredLinks) {
      int start = linkPos['start'];
      int end = linkPos['end'];
      LinkData link = linkPos['link'];

      // Add text before the link
      if (start > lastEnd) {
        spans.add(
          TextSpan(
            text: text.substring(lastEnd, start),
            style: AppTextStyles.label.copyWith(
              color: AppColors.text,
            ),
          ),
        );
      }

      // Add the link
      spans.add(
        TextSpan(
          text: link.text,
          style: AppTextStyles.label.copyWith(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = link.onTap,
        ),
      );

      lastEnd = end;
    }

    // Add remaining text after the last link
    if (lastEnd < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastEnd),
          style: AppTextStyles.label.copyWith(
            color: AppColors.text,
          ),
        ),
      );
    }

    return spans;
  }
}
