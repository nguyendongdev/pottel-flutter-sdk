import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/circular_progress_gradient.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../l10n/localization_extension.dart';

class TabESimTravel extends StatefulWidget {
  const TabESimTravel({super.key});
  @override
  State<TabESimTravel> createState() => _TabESimTravelState();
}

class _TabESimTravelState extends State<TabESimTravel>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Prevent switching to second tab
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        _tabController.animateTo(0);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          // border top
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSpacing.md),
              topRight: Radius.circular(AppSpacing.md),
            ),
            border: Border(
              top: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: context.l10n.translate('esim_in_use')),
              Tab(text: context.l10n.translate('esim_not_installed')),
            ],
          ),
        ),
        Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.screenPadding,
          ),
          height: 500,
          width: double.infinity,
          // Fixed height for content
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(), // Disable swipe
            children: [
              Container(
                color: AppColors.background,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: const Column(
                  children: [
                    TabESimTravelDetail(),
                  ],
                ),
              ),
              const SizedBox(), // Empty disabled tab
            ],
          ),
        ),
      ],
    );
  }
}

class TabESimTravelDetail extends StatelessWidget {
  const TabESimTravelDetail({super.key});
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Các quốc gia
                        Text(
                          context.l10n.translate('countries'),
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          context.l10n.translate('coverage_area'),
                          style: AppTextStyles.label,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          context.l10n.translate('singapore'),
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          context.l10n.translate('time_remaining'),
                          style: AppTextStyles.label,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Text(
                              '5 ${context.l10n.translate('days')}',
                              style: AppTextStyles.title,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/top_calendar.svg',
                                    width: 16,
                                    height: 16,
                                    package: 'skyfi_sdk',
                                  ),
                                  const SizedBox(width: AppSpacing.xs),
                                  Text(
                                    '12/05/2024',
                                    style: AppTextStyles.smallBold.copyWith(
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        // ICCID
                        Text(
                          context.l10n.translate('iccid'),
                          style: AppTextStyles.label,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          '89840480003232863650',
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                      ],
                    ),
                    const CircularProgressGradient(
                      progress: 50,
                      total: 3,
                      used: 0.7,
                    ),
                  ],
                ),
                Row(
                  children: [
                    // button 'Xem chi tiết' outline
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.xs,
                        ),
                        // border radius

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.md),
                        ),
                      ),
                      child: Text(context.l10n.translate('view_details')),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // button 'Mua thêm dung lượng' gradient
                    GradientButton(
                      height: 40,
                      onPressed: () {},
                      text: context.l10n.translate('buy_more_data'),
                      textStyle: AppTextStyles.button.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
