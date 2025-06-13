import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/icon_card.dart';
import '../../../core/widgets/progress_gradient_line.dart';

class CardUsedSquare extends StatelessWidget {
  const CardUsedSquare(
      {super.key,
      this.title,
      this.date,
      this.description,
      this.used,
      this.total,
      this.dateUsed,
      this.dateTotal,
      this.icon = 'assets/icons/feat_data.svg'});
  final String? title;
  final String? date;
  final String? description;
  final int? used;
  final int? total;
  final String? dateUsed;
  final String? dateTotal;
  final String icon;

  double get progress =>
      total == null || total == 0 ? 0.0 : (used ?? 0) / total!;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Row(
                  children: [
                    IconCard(icon: icon),
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                    Column(
                      children: [
                        Text(
                          title ?? '',
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          date ?? '',
                          style: AppTextStyles.small.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      description ?? '',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.sm,
                ),
                ProgressGradientLine(progress: progress),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: used?.toString() ?? '',
                            style: AppTextStyles.smallStrong.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          TextSpan(
                            text: '/${total?.toString() ?? ''}',
                            style: AppTextStyles.small.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // 1/1 ngày
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: dateUsed ?? '',
                            style: AppTextStyles.smallBold.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          TextSpan(
                            text: '${dateTotal != null ? '/$dateTotal' : ''}',
                            style: AppTextStyles.small.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
