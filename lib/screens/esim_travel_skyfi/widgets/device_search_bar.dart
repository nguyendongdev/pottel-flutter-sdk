import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';
import '../provider/compatible_device_provider.dart';

class DeviceSearchBar extends HookConsumerWidget {
  const DeviceSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        onChanged: (value) =>
            ref.read(searchQueryProvider.notifier).update(value),
        decoration: InputDecoration(
          hintText: context.l10n.translate('device_search_hint'),
          hintStyle: AppTextStyles.body.copyWith(
            color: AppColors.placeholder,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.placeholder,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
