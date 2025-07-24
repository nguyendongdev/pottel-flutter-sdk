import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:skyfi_sdk/screens/esim_travel_skyfi/models/region_model.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_cart.dart';
import '../../l10n/localization_extension.dart';
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
      subTitle = context.l10n.translate('countries_tab');
    } else if (selectedTab == 1) {
      subTitle = context.l10n.translate('regions');
    } else if (selectedTab == 2) {
      subTitle = context.l10n.translate('global_data_packages');
    }

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(searchQueryProvider.notifier).state = '';
      });
      return null;
    }, []);

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
          context.l10n.translate('buy_esim_travel'),
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
                        title: context.l10n.translate('esim_country'),
                        isSelected: selectedTab == 0,
                        onTap: () =>
                            ref.read(selectedTabProvider.notifier).state = 0,
                      ),
                      _buildTabItem(
                        context,
                        index: 1,
                        title: context.l10n.translate('esim_region'),
                        isSelected: selectedTab == 1,
                        onTap: () =>
                            ref.read(selectedTabProvider.notifier).state = 1,
                      ),
                      _buildTabItem(context,
                          index: 2,
                          title: context.l10n.translate('esim_global'),
                          isSelected: selectedTab == 2,
                          onTap: () => context.pushNamed(
                              AppRouter.detailEsimTravelSkyfi,
                              extra: RegionModel(
                                  id: 1,
                                  code: '',
                                  name: context.l10n.translate('global'),
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
                                text: context.l10n.translate('esim_note_long'),
                                style: AppTextStyles.label.copyWith(
                                  color: AppColors.text,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' ${context.l10n.translate('view_device_list')}',
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
                text: '${context.l10n.translate('error_occurred_generic')}\n',
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
