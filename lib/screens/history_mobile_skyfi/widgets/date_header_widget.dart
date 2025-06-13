import 'package:flutter/material.dart';

class DateHeaderWidget extends StatelessWidget {
  const DateHeaderWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            date,
            style: textTheme.bodySmall?.copyWith(
              fontFamily: 'KoHo',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xFFA1A1A1),
            ),
          ),
        ],
      ),
    );
  }
}
