import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/screens/home_skyfi/models/outstanding_pakage.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/gradient_button.dart';
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
                        color: AppColors.red,
                        size: 24,
                      ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(package.name ?? '',
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.text,
                        )),
                    SizedBox(width: AppSpacing.xs),
                    package.discountPercent != null &&
                            package.discountPercent! > 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xs,
                              vertical: AppSpacing.xs / 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.xs),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.discount_outlined,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                SizedBox(width: AppSpacing.xs / 2),
                                Text(
                                  '${package.discountPercent!.toInt()}% ',
                                  style: AppTextStyles.label.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),

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
                        'Xem chi tiết',
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
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(AppSpacing.xs),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/dashboard-speed.svg',
                        width: 18,
                        height: 18,
                        package: 'skyfi_sdk',
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Data: ${package.dataPerDay.toInt().toString()}GB/ngày',
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
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(AppSpacing.xs),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/phone-home.svg',
                          width: 18,
                          height: 18,
                          package: 'skyfi_sdk',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Phút gọi: ${package.freeCallMinute} phút gọi liên mạng',
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
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(AppSpacing.xs),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/message-home.svg',
                          width: 18,
                          height: 18,
                          package: 'skyfi_sdk',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'SMS: ${package.freeSms} tin nhắn nội mạng',
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
                '/ ${package.validityDay} ngày',
                style: AppTextStyles.label.copyWith(color: AppColors.textGrey),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Spacer(),
              // selected package

              // button register
              GradientButton(
                text: 'Mua ngay',
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
