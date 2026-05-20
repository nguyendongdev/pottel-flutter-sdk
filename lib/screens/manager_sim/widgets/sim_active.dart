import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/core/widgets/circular_progress_gradient.dart';
import 'package:pottel_sdk/routers/routers.dart';
import '../../../l10n/localization_extension.dart';

import '../models/response_manager_esim/item_my_esim.dart';

class SimActive extends ConsumerWidget {
  final List<ItemMyEsim>? activeEsims;

  const SimActive({super.key, this.activeEsims});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          if (activeEsims?.isNotEmpty == true)
            ...activeEsims!.map((esim) => _renderItemSimActive(esim, context))
          else
            Center(
              child: Text(
                context.l10n.translate('no_active_esim'),
                style: AppTextStyles.body,
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderItemSimActive(ItemMyEsim esim, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFE6F7EC),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  context.l10n.translate('in_use_status'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00B141),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Info and Data section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoItem(
                        context, context.l10n.translate('coverage_area_sim'), esim.regionName ?? 'N/A'),
                    _buildInfoItem(
                        context, context.l10n.translate('validity_remaining'), '${esim.validityDays ?? 0} ${context.l10n.translate('days_unit_sim')}'),
                    _buildInfoItem(context, context.l10n.translate('iccid_detail'), esim.iccid ?? 'N/A'),
                  ],
                ),
              ),
              SizedBox(width: 24),

              SizedBox(
                  width: 120,
                  child: CircularProgressGradient(
                    progress: _calculateDataUsagePercentage(esim),
                    total: esim.data?.total?.toDouble() ?? 0,
                    used: esim.data?.remaining?.toDouble() ?? 0,
                    size: 120,
                    textTitle: context.l10n.translate('remaining_data'),
                  )),
            ],
          ),
          SizedBox(height: 8),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.pushNamed(
                      AppRouter.managerSimDetail,
                      extra: {'esim': esim},
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFFAA61A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    context.l10n.translate('view_details_sim'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFAA61A),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(
                      AppRouter.managerSimDetail,
                      extra: {'esim': esim, 'isBuying': true},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAA61A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    context.l10n.translate('buy_more_data_sim'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }

  double _calculateDataUsagePercentage(ItemMyEsim esim) {
    if (esim.data?.remaining != null && esim.data?.total != null) {
      final remaining = esim.data!.remaining!;
      final total = esim.data!.total!;
      if (total > 0) {
        return remaining / total;
      }
    }
    return 0.25; // Default 25% remaining
  }
}
