import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';
import '../provider/address_provider.dart';

class StepViewVertical extends HookConsumerWidget {
  const StepViewVertical(
      {super.key,
      required this.currentStep,
      required this.totalSteps,
      required this.onStepTapped});

  final int currentStep;
  final int totalSteps;
  final Function(int) onStepTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(addressSelectionProvider);
    final step = ref.watch(addressStepProvider);
    String getTitle(BuildContext context) {
      switch (currentStep) {
        case 0:
          return context.l10n.translate('select_province_city');
        case 1:
          return context.l10n.translate('select_district');
        case 2:
          return context.l10n.translate('select_ward');
        default:
          return context.l10n.translate('select_sim_address');
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Step $currentStep of $totalSteps'),
          if (data.province != null)
            Row(
              children: [
                const Icon(Icons.circle, size: 16, color: Color(0xFFC0C0C0)),
                const SizedBox(width: 8),
                Text(
                  data.province?.name ?? '',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          if (data.district != null)
            Container(
              color: const Color(0xFFC0C0C0),
              height: 12,
              width: 2,
              margin: const EdgeInsets.symmetric(horizontal: 7.0),
            ),

          if (data.district != null)
            Row(
              children: [
                const Icon(Icons.circle, size: 16, color: Color(0xFFC0C0C0)),
                const SizedBox(width: 8),
                Text(
                  data.district?.name ?? '',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          if (data.ward != null)
            Container(
              color: const Color(0xFFC0C0C0),
              height: 12,
              width: 2,
              margin: const EdgeInsets.symmetric(horizontal: 7.0),
            ),
          if (data.ward != null)
            Row(
              children: [
                const Icon(Icons.circle, size: 16, color: Color(0xFFC0C0C0)),
                const SizedBox(width: 8),
                Text(
                  data.ward?.name ?? '',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          if (data.ward == null && step > 0)
            Container(
              color: const Color(0xFFC0C0C0),
              height: 12,
              width: 2,
              margin: const EdgeInsets.symmetric(horizontal: 7.0),
            ),
          if (data.ward == null)
            Row(
              children: [
                const Icon(Icons.radio_button_checked,
                    size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                // Chọn Quận/Huyện
                Text(
                  getTitle(context),
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
