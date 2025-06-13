import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class CircularProgressGradient extends StatelessWidget {
  const CircularProgressGradient(
      {super.key,
      required this.progress,
      required this.total,
      required this.used,
      this.size = 120,
      this.textTitle = 'Còn lại',
      this.textColor = AppColors.textGrey,
      this.textProgressColor = AppColors.red,
      this.progressColors = const [
        Color(0xffFF787A),
        Color(0xffFFD76D),
      ],
      this.backStrokeWidth = 14,
      this.progressStrokeWidth = 14});
  final double progress;
  final double total;
  final double used;
  final double size;
  final String textTitle;
  final Color textColor;
  final Color textProgressColor;
  final List<Color> progressColors;
  final double backStrokeWidth;
  final double progressStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      progressColors: progressColors,
      valueNotifier: ValueNotifier(progress),
      size: size,
      animationDuration: 2,
      mergeMode: true,
      backStrokeWidth: backStrokeWidth,
      progressStrokeWidth: progressStrokeWidth,
      backColor: const Color(0xffeeeeee),
      onGetText: (value) {
        return Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: textTitle,
                style: AppTextStyles.body.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: size == 180 ? 16 : 14,
                ),
              ),
              const TextSpan(text: '\n'),
              TextSpan(
                text: '${(used / 1024).toStringAsFixed(1)}GB',
                style: AppTextStyles.title.copyWith(
                  color: textProgressColor,
                  fontSize: size == 180 ? 26 : 14,
                ),
              ),
              TextSpan(
                text: '/${(total / 1024).toStringAsFixed(0)}GB',
                style: AppTextStyles.body.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: size == 180 ? 16 : 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
