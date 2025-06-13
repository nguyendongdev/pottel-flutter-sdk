import 'package:flutter/material.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

class ProgressGradientLine extends StatelessWidget {
  const ProgressGradientLine({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return GradientProgressIndicator(
      const [
        Color(0x63EACD1A),
        Color(0x63EACD1A),
        Color(0x63FAA61A),
        Color(0x63FAA61A),
        Color(0x63F24D27),
        Color(0x63F24D27),
        Color(0x63ED1B2F),
        Color(0x63ED1B2F),
        Color(0x63ED1B2F),
        Color(0x63ED1B2F),
      ],
      progress,
    );
  }
}
