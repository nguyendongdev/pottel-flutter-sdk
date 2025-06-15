import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'provider/history_provider.dart';
import 'widgets/date_header_widget.dart';
import 'widgets/history_item_widget.dart';

class HistoryMobileSkyFiScreen extends HookConsumerWidget {
  const HistoryMobileSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedHistoryTabProvider);
    final topupHistory = ref.watch(topupHistoryProvider);
    final serviceHistory = ref.watch(serviceHistoryProvider);
    final callHistory = ref.watch(callHistoryProvider);

    useEffect(() {
      if (selectedTab == HistoryTab.topup) {
        ref.read(topupHistoryProvider.notifier).getTopupHistory();
      } else if (selectedTab == HistoryTab.service) {
        ref.read(serviceHistoryProvider.notifier).getServiceHistory();
      }

      return null;
    }, [selectedTab]);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text(
          'Lịch sử di động',
          style: AppTextStyles.heading,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
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
                  context: context,
                  title: 'Nạp thẻ',
                  isSelected: selectedTab == HistoryTab.topup,
                  onTap: () => ref
                      .read(selectedHistoryTabProvider.notifier)
                      .state = HistoryTab.topup,
                ),
                _buildTab(
                  context: context,
                  title: 'Dịch vụ',
                  isSelected: selectedTab == HistoryTab.service,
                  onTap: () => ref
                      .read(selectedHistoryTabProvider.notifier)
                      .state = HistoryTab.service,
                ),
                // _buildTab(
                //   context: context,
                //   title: 'Cuộc gọi',
                //   isSelected: selectedTab == HistoryTab.call,
                //   onTap: () => ref
                //       .read(selectedHistoryTabProvider.notifier)
                //       .state = HistoryTab.call,
                // ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const DateHeaderWidget(date: 'Lịch sử'),
                  const SizedBox(height: 16),
                  if (selectedTab == HistoryTab.topup)
                    ...topupHistory.map(
                      (item) => HistoryItemWidget(
                        item: item,
                        icon: SvgPicture.asset(
                          'assets/icons/arrow-circle-down.svg',
                          width: 21,
                          height: 21,
                          package: 'skyfi_sdk',
                        ),
                      ),
                    )
                  else if (selectedTab == HistoryTab.service)
                    ...serviceHistory.map(
                      (item) => HistoryItemWidget(
                        item: item,
                        icon: SvgPicture.asset(
                          'assets/icons/arrow-circle-up.svg',
                          width: 21,
                          height: 21,
                          package: 'skyfi_sdk',
                        ),
                      ),
                    )
                  else
                    ...callHistory.map(
                      (item) => HistoryItemWidget(
                        item: item,
                        icon: SvgPicture.asset(
                          'assets/icons/phone-outgoing-01.svg',
                          width: 21,
                          height: 21,
                          package: 'skyfi_sdk',
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  // const DateHeaderWidget(date: 'Thứ 3, 15 Thg 4,2024'),
                  // const SizedBox(height: 16),
                  // if (selectedTab == HistoryTab.topup)
                  //   ...topupHistory.map(
                  //     (item) => HistoryItemWidget(
                  //       item: item,
                  //       icon: SvgPicture.asset(
                  //         'assets/icons/arrow-circle-down.svg',
                  //         width: 21,
                  //         height: 21,
                  //       ),
                  //     ),
                  //   )
                  // else if (selectedTab == HistoryTab.service)
                  //   ...serviceHistory.map(
                  //     (item) => HistoryItemWidget(
                  //       item: item,
                  //       icon: SvgPicture.asset(
                  //         'assets/icons/arrow-circle-down.svg',
                  //         width: 21,
                  //         height: 21,
                  //       ),
                  //     ),
                  //   )
                  // else
                  //   ...callHistory.map(
                  //     (item) => HistoryItemWidget(
                  //       item: item,
                  //       icon: SvgPicture.asset(
                  //         'assets/icons/phone-outgoing-01.svg',
                  //         width: 21,
                  //         height: 21,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required BuildContext context,
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
                color:
                    isSelected ? AppColors.strongSecondary : Colors.transparent,
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
              color: isSelected ? AppColors.primary : AppColors.textLight,
            ),
          ),
        ),
      ),
    );
  }
}
