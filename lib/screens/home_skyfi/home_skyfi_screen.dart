import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/background_gradient.dart';
import '../../core/widgets/gradient_button.dart';
import '../../routers/routers.dart';
import 'widgets/tab_esim_travel.dart';
import 'widgets/tab_sim_data.dart';

class HomeSkyFiScreen extends HookConsumerWidget {
  const HomeSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabSelected = useState(0);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          SafeArea(
            child: Column(
              children: [
                // _buildHeader(context),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GradientButton(
                                      height: 32,
                                      onPressed: () {
                                        tabSelected.value = 0;
                                      },
                                      gradient: tabSelected.value == 0
                                          ? AppColors.primaryGradient
                                          : AppColors.lightGradient,
                                      textStyle: AppTextStyles.button.copyWith(
                                        color: AppColors.text,
                                      ),
                                      text: 'SIM Data',
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    GradientButton(
                                      gradient: tabSelected.value == 1
                                          ? AppColors.primaryGradient
                                          : AppColors.lightGradient,
                                      height: 32,
                                      onPressed: () {
                                        tabSelected.value = 1;
                                      },
                                      text: 'eSIM du lịch',
                                      textStyle: AppTextStyles.button.copyWith(
                                        color: AppColors.text,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.all(4)),
                                        backgroundColor:
                                            MaterialStateProperty.all(AppColors
                                                .white
                                                .withOpacity(0.4)),
                                      ),
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/top_cart.svg',
                                        width: 20,
                                        height: 20,
                                        package: 'pottel_sdk',
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.xs),
                                    IconButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.all(4)),
                                        backgroundColor:
                                            MaterialStateProperty.all(AppColors
                                                .white
                                                .withOpacity(0.4)),
                                      ),
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/top_bell.svg',
                                        width: 20,
                                        height: 20,
                                        package: 'pottel_sdk',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text('0772 123 456',
                                          style: AppTextStyles.heading),
                                      const SizedBox(width: AppSpacing.xs),
                                      // rotate 90 degrees
                                      Transform.rotate(
                                        angle: 3.14 * 1.5,
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: AppColors.text,
                                          size: 16,
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: AppSpacing.sm),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Xin chào',
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Linh',
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Dưới đây là thông tin SIM data của bạn',
                                  style: AppTextStyles.body,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          if (tabSelected.value == 0) const TabSimData(),
                          if (tabSelected.value == 1) const TabESimTravel(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
               Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/logo.png',
            height: 24,
            package: 'pottel_sdk',
          ),
          const Spacer(),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                onPressed: () {},
                icon: 'assets/icons/nav_home.svg',
                label: 'Trang chủ',
                isSelected: true,
              ),
              _buildNavItem(
                onPressed: () {
                  context.pushNamed(AppRouter.simDataSkyFi);
                },
                icon: 'assets/icons/nav_sim_data.svg',
                label: 'SIM data',
              ),
              _buildNavItem(
                onPressed: () {},
                icon: 'assets/icons/nav_travel.svg',
                label: 'eSIM du lịch',
              ),
              _buildNavItem(
                onPressed: () {},
                icon: 'assets/icons/nav_user.svg',
                label: 'Cá nhân',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    bool isSelected = false,
    void Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              package: 'pottel_sdk',
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: AppTextStyles.small.copyWith(
              color: isSelected
                  ? AppColors.navHomeTextSelected
                  : AppColors.navHomeText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
