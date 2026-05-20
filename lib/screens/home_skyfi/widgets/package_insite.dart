import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pottel_sdk/screens/home_skyfi/models/outstanding_pakage.dart';
import 'package:pottel_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../l10n/localization_extension.dart';
import '../../../routers/routers.dart';

class PackageInsite extends StatelessWidget {
  const PackageInsite({
    super.key,
    required this.package,
    this.onTapRegister,
  });
  final PackageModel package;
  final VoidCallback? onTapRegister;

  @override
  Widget build(BuildContext context) {
    final discountPercent = package.discountPercent ?? 0;

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      border: Border.all(
        color: AppColors.border,
        width: 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppSpacing.sm),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (package.isOutstanding == 1)
                      const Icon(
                        Icons.local_fire_department,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(package.name,
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.text,
                        )),
                    const SizedBox(width: AppSpacing.xs),
                    discountPercent > 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xs,
                              vertical: AppSpacing.xs / 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.xs),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.discount_outlined,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: AppSpacing.xs / 2),
                                Text(
                                  '${discountPercent.toInt()}% ',
                                  style: AppTextStyles.label.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),

                    const Spacer(),
                    // Chi tiết
                    GestureDetector(
                      onTap: () => context.pushNamed(
                        AppRouter.packageDetailSkyfi,
                        extra: {
                          'packageId': package.id,
                          'isRegister': true,
                        },
                      ),
                      child: Text(
                        context.l10n.translate('view_detail'),
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: AppSpacing.xl),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSpacing.xs),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/dashboard-speed.svg',
                        width: 18,
                        height: 18,
                        package: 'pottel_sdk',
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Data: ${package.dataPerDay.toInt().toString()}GB/${context.l10n.translate('day')}',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                if (package.freeCallMinute != 0)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(AppSpacing.xs),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/phone-home.svg',
                          width: 18,
                          height: 18,
                          package: 'pottel_sdk',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        context.l10n.translate('call_minutes').replaceAll(
                            '{0}', package.freeCallMinute.toString()),
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: AppSpacing.sm),
                if (package.freeSms != 0)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(AppSpacing.xs),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/message-home.svg',
                          width: 18,
                          height: 18,
                          package: 'pottel_sdk',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        context.l10n
                            .translate('sms_messages')
                            .replaceAll('{0}', package.freeSms.toString()),
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${Common.formatCurrency(package.price.toString())} VND',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.text,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '/ ${package.validityDay} ${context.l10n.translate('days')}',
                style: AppTextStyles.label.copyWith(color: AppColors.textGrey),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Spacer(),
              // selected package

              // button register
              GradientButton(
                text: context.l10n.translate('buy_now'),
                onPressed: onTapRegister ?? () {},
              ),
            ],
          ),
          if (package.salePrice != package.price) ...[
            Text(
              '${Common.formatCurrency(package.salePrice.toString())} VND',
              style: AppTextStyles.label.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.textGrey,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
