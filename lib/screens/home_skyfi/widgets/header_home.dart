import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/widgets/app_cart.dart';

class HeaderHome extends HookConsumerWidget {
  const HeaderHome({
    super.key,
    required this.onTabSelected,
    required this.tabSelected,
  });

  final ValueChanged<int> onTabSelected;
  final int tabSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildHeader(
      context,
      onTabSelected: (value) {
        onTabSelected(value);
      },
      tabSelected: tabSelected,
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required ValueChanged<int> onTabSelected,
    required int tabSelected,
  }) {
    return Container(
      color: AppColors.red,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //  Navigator.of(context).pop();
            },
            child: Image.asset(
              'assets/images/logo_skyfi_yellow.png',
              height: 24,
              package: 'skyfi_sdk',
            ),
          ),
          const Spacer(),
          const AppCart(color: AppColors.white),
        ],
      ),
    );
  }
}
