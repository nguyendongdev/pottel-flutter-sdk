import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:skyfi_sdk/screens/esim_travel_skyfi/models/region_model.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_cart.dart';
import 'compatible_devices_screen.dart';
import 'provider/region_provider.dart';
import 'widgets/region_list.dart';
import 'widgets/search_field.dart';

class EsimTravelSkyfiScreen extends HookConsumerWidget {
  const EsimTravelSkyfiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    String subTitle = '';
    if (selectedTab == 0) {
      subTitle = 'Các quốc gia';
    } else if (selectedTab == 1) {
      subTitle = 'Các khu vực';
    } else if (selectedTab == 2) {
      subTitle = 'Gói dữ liệu toàn cầu';
    }

    void onShowDeviceList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (context) => const CompatibleDevicesScreen(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Mua eSIM du lịch',
          style: AppTextStyles.title.copyWith(
            color: AppColors.text,
          ),
        ),
        actions: const [
          AppCart(),
        ],
      ),
      body: Column(
        children: [
          const SearchField(),
          const SizedBox(height: AppSpacing.md),
          Container(
            color: AppColors.background,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.border,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildTabItem(
                        context,
                        index: 0,
                        title: 'eSIM quốc gia',
                        isSelected: selectedTab == 0,
                        onTap: () =>
                            ref.read(selectedTabProvider.notifier).state = 0,
                      ),
                      _buildTabItem(
                        context,
                        index: 1,
                        title: 'eSIM khu vực',
                        isSelected: selectedTab == 1,
                        onTap: () =>
                            ref.read(selectedTabProvider.notifier).state = 1,
                      ),
                      _buildTabItem(context,
                          index: 2,
                          title: 'eSIM toàn cầu',
                          isSelected: selectedTab == 2,
                          onTap: () => context.pushNamed(
                              AppRouter.detailEsimTravelSkyfi,
                              extra: RegionModel(
                                  id: 1,
                                  code: '',
                                  name: 'Toàn cầu',
                                  type: ''))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Lưu ý: eSIM là SIM điện tử, được gửi qua email khách hàng. eSIM chỉ sử dụng được trên các thiết bị di động có hỗ trợ.',
                                style: AppTextStyles.label.copyWith(
                                  color: AppColors.text,
                                ),
                              ),
                              TextSpan(
                                text: ' Xem danh sách thiết bị',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    onShowDeviceList();
                                  },
                                style: AppTextStyles.label.copyWith(
                                  color: AppColors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(selectedTab),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required int index,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
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
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              color: isSelected ? AppColors.red : AppColors.textLight,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int selectedTab) {
    final type = switch (selectedTab) {
      0 => 'COUNTRY',
      1 => 'REGIONAL',
      2 => 'GLOBAL',
      _ => 'COUNTRY',
    };

    return Consumer(
      builder: (context, ref, child) {
        final regionsAsync = ref.watch(regionsProvider(type));
        final filteredRegions = ref.watch(filteredRegionsProvider(type));

        return regionsAsync.when(
          data: (_) => RegionList(regions: filteredRegions),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: SelectableText.rich(
              TextSpan(
                text: 'Đã có lỗi xảy ra\n',
                style: AppTextStyles.heading.copyWith(color: AppColors.red),
                children: [
                  TextSpan(
                    text: error.toString(),
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
