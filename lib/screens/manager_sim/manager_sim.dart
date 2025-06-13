import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/manager_sim/providers/provider_manager_esim.dart';
import 'package:skyfi_sdk/screens/manager_sim/widgets/sim_active.dart';
import 'package:skyfi_sdk/screens/manager_sim/widgets/sim_not_active.dart';

class ManagerSimScreen extends HookConsumerWidget {
  const ManagerSimScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(tabManagerESimNotifierProvider);
    final data = ref.watch(managerESimNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Quản lý eSIM du lịch đã mua',
          style: AppTextStyles.title,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.border,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildTab(
                  title: 'eSIM đang sử dụng',
                  isSelected: selectedTab == TabManagerESim.active,
                  onTap: () => ref
                      .read(tabManagerESimNotifierProvider.notifier)
                      .changeTab(TabManagerESim.active),
                ),
                _buildTab(
                  title: 'eSIM chưa cài',
                  isSelected: selectedTab == TabManagerESim.notActive,
                  onTap: () => ref
                      .read(tabManagerESimNotifierProvider.notifier)
                      .changeTab(TabManagerESim.notActive),
                ),
              ],
            ),
          ),
          data.when(
            data: (data) {
              return Expanded(
                  child: selectedTab == TabManagerESim.active
                      ? SimActive(activeEsims: data?.result?.esimActive?.list)
                      : SimNotActive(
                          notActiveEsims: data?.result?.esimNotActive?.list));
            },
            error: (error, stackTrace) => Center(
              child: Text('Lỗi: $error'),
            ),
            loading: () => Expanded(
                child: const Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.red : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'KoHo',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: isSelected ? AppColors.red : AppColors.textLight,
            ),
          ),
        ),
      ),
    );
  }
}
