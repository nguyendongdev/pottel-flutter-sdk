import 'package:flutter/material.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/icon_card.dart';
import '../../../core/widgets/progress_gradient_line.dart';

class DataAddonCard extends StatelessWidget {
  const DataAddonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const IconCard(icon: 'assets/icons/feat_data.svg'),
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                    Column(
                      children: [
                        Text(
                          context.l10n.translate('data'),
                          style: AppTextStyles.heading.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          context.l10n.translate('day'),
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      context.l10n.translate('daily_package'),
                      style: AppTextStyles.heading.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '3GB',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      context.l10n.translate('per_day'),
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.sm,
                ),
                const ProgressGradientLine(progress: 0.2),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    //100MB/3072MB
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '100MB',
                            style: AppTextStyles.smallStrong.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          TextSpan(
                            text: '/3072MB',
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
                            text: '1',
                            style: AppTextStyles.smallStrong.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          TextSpan(
                            text: '/1 ${context.l10n.translate('day')}',
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
