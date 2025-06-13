import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyfi_sdk/screens/home_skyfi/models/outstanding_pakage.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/gradient_button.dart';

class PackageCard extends StatelessWidget {
  const PackageCard(
      {super.key,
      required this.package,
      this.onTapRegister,
      this.onTapDetail,
      this.margin = const EdgeInsets.all(0.0)});
  final PackageModel package;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapDetail;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return AppCard(
        width: 320,
        padding: EdgeInsets.zero,
        margin: margin,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.xs,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.border,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.local_fire_department,
                                    color: AppColors.red,
                                    size: 24,
                                  ),
                                  const SizedBox(width: AppSpacing.xs),
                                  Text(
                                    package.code,
                                    style: AppTextStyles.button.copyWith(
                                      color: AppColors.text,
                                    ),
                                  ),
                                  Text(
                                    ' - ${package.validityDay} ngày',
                                    style: AppTextStyles.button.copyWith(
                                      color: AppColors.text,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Chi tiết
                                  GestureDetector(
                                    onTap: onTapDetail?.call,
                                    child: Text(
                                      'Chi tiết',
                                      style: AppTextStyles.label.copyWith(
                                        color: AppColors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius:
                                        BorderRadius.circular(AppSpacing.xs),
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
                                  'Data: ${package.dataPerDay.toInt()}GB/ngày',
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
                                      borderRadius:
                                          BorderRadius.circular(AppSpacing.xs),
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
                                  const SizedBox(width: AppSpacing.sm),
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
                                      borderRadius:
                                          BorderRadius.circular(AppSpacing.xs),
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
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.border,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${Common.formatCurrency(package.salePrice.toString())} VND',
                                style: AppTextStyles.title.copyWith(
                                  color: package.salePrice != package.price
                                      ? AppColors.red
                                      : AppColors.text,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                '/ ${package.validityDay} ngày',
                                style: AppTextStyles.small.copyWith(
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                          // if salePrice == price then not show
                          if (package.salePrice != package.price)
                            Text(
                              '${Common.formatCurrency(package.price.toString())} VND',
                              style: AppTextStyles.small.copyWith(
                                color: AppColors.text,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.text,
                              ),
                            ),
                        ],
                      ),
                      GradientButton(
                        onPressed: () {
                          onTapRegister?.call();
                        },
                        textStyle: AppTextStyles.button.copyWith(
                          color: AppColors.white,
                        ),
                        text: 'Đăng ký',
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // if salePrice != price then show
            if (package.salePrice != package.price)
              Positioned(
                  top: -10,
                  right: -10,
                  width: 35,
                  height: 35,
                  child: Stack(
                    // center the text
                    children: [
                      SvgPicture.asset(
                        'assets/icons/tag_sale.svg',
                        width: 33,
                        height: 33,
                        package: 'skyfi_sdk',
                      ),
                      // center the text
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(0.15),
                        child: Center(
                          child: Text(
                            '${package.discountPercent?.toInt()}%',
                            style: AppTextStyles.smallBold.copyWith(
                              color: AppColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
          ],
        ));
  }
}
