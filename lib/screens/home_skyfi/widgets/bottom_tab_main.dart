import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';

import '../../../core/constants/text_styles.dart';
import '../../../utilities/common.dart';

class BottomTabMain extends StatelessWidget {
  const BottomTabMain(
      {super.key,
      required this.onNavIndexChanged,
      required this.context,
      required this.navIndex});
  final ValueChanged<int> onNavIndexChanged;
  final int navIndex;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigationBar(
      ValueNotifier<int>(navIndex),
      (value) {
        onNavIndexChanged(value);
      },
    );
  }

  Widget _buildBottomNavigationBar(
    ValueNotifier<int> navIndex,
    void Function(int) onNavIndexChanged,
  ) {
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
              NavItem(
                onPressed: () => onNavIndexChanged(0),
                icon: 'assets/icons/nav_home.svg',
                label: 'Trang chủ',
                isSelected: navIndex.value == 0,
              ),
              NavItem(
                onPressed: () => {
                  // context.pushNamed(AppRouter.simDataSkyFi),
                  Common.popupMaintaining(context)
                },
                icon: 'assets/icons/feat_support.svg',
                label: 'Hỗ trợ',
                isSelected: navIndex.value == 1,
              ),
              NavItem(
                onPressed: () => {Common.popupMaintaining(context)},
                icon: 'assets/icons/bell.svg',
                label: 'Thông báo',
                isSelected: navIndex.value == 2,
              ),
              NavItem(
                onPressed: () => onNavIndexChanged(3),
                icon: 'assets/icons/nav_user.svg',
                label: 'Cá nhân',
                isSelected: navIndex.value == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return _buildNavItem(
      icon: icon,
      label: label,
      isSelected: isSelected,
      onPressed: onPressed,
    );
  }
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
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.navHomeTextSelected : AppColors.text,
              BlendMode.srcIn,
            ),
            package: 'skyfi_sdk',
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTextStyles.small.copyWith(
            color: isSelected ? AppColors.navHomeTextSelected : AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
