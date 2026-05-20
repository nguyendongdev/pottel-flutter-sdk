import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/routers/routers.dart';
import '../../../l10n/localization_extension.dart';

import '../models/response_manager_esim/item_my_esim.dart';

class SimNotActive extends ConsumerWidget {
  final List<ItemMyEsim>? notActiveEsims;

  const SimNotActive({super.key, this.notActiveEsims});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (notActiveEsims?.isNotEmpty == true)
            ...notActiveEsims!
                .map((esim) => _renderItemSimNotActive(esim, context))
          else
            Center(
              child: Text(
                context.l10n.translate('no_uninstalled_esim'),
                style: AppTextStyles.body.copyWith(color: AppColors.textLight),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderItemSimNotActive(ItemMyEsim esim, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and status badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.translate('esim_basic_title'),
                style: AppTextStyles.title,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  context.l10n.translate('esim_not_installed_status'),
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Info section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoItem(context, context.l10n.translate('coverage_area_sim'), esim.regionName ?? 'N/A'),
              _buildInfoItem(context, context.l10n.translate('data_capacity_sim'), _getDataCapacityText(esim)),
              _buildInfoItem(context, context.l10n.translate('validity_remaining'), '${esim.validityDays ?? 0} ${context.l10n.translate('days_unit_sim')}'),
            ],
          ),
          const SizedBox(height: 8),

          // Install button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  AppRouter.managerSimDetail,
                  extra: {'esim': esim},
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
              ),
              child: Text(
                context.l10n.translate('install_now'),
                style: AppTextStyles.button.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.small.copyWith(
              color: AppColors.textLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.label.copyWith(
              color: AppColors.text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getDataCapacityText(ItemMyEsim esim) {
    if (esim.dataAmount != null && esim.dataUnit != null) {
      final amount = esim.dataAmount!;
      final unit = esim.dataUnit!;

      // Convert from MB to GB if needed
      if (unit == 'GB' && amount > 1000) {
        final gbAmount = amount / 1000;
        return '${gbAmount.toStringAsFixed(0)} $unit';
      }

      return '$amount $unit';
    }
    return '3 GB'; // Default fallback
  }

  void _handleInstallEsim(ItemMyEsim esim) {
    // TODO: Implement eSIM installation logic
    // This could navigate to installation screen or show QR code
    print('Installing eSIM: ${esim.iccid}');
  }
}
