import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import 'provider/compatible_device_provider.dart';
import 'widgets/brand_section.dart';
import 'widgets/device_search_bar.dart';

class CompatibleDevicesScreen extends HookConsumerWidget {
  const CompatibleDevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredDevices = ref.watch(filteredDevicesProvider);
    ref.watch(compatibleDevicesProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              'Thiết bị di động có hỗ trợ eSIM',
              style: AppTextStyles.title.copyWith(
                color: AppColors.text,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ]),
          Text(
            'Lưu ý: eSIM là một loại eSIM điện tử (sử dụng mã QR) và không phải là thẻ eSIM vật lý lắp vào điện thoại, eSIM không dùng cho các loại đồng hồ thông minh',
            style: AppTextStyles.label.copyWith(
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const DeviceSearchBar(),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: filteredDevices.length,
              itemBuilder: (context, index) {
                return BrandSection(
                  brandDevices: filteredDevices[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
