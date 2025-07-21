import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
import '../../../l10n/localization_extension.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../models/order_detail_model.dart';
import 'info_row.dart';

class OrderSummaryCard extends StatelessWidget {
  final OrderDetailModel order;

  const OrderSummaryCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###', 'vi_VN');

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        boxShadow: [
          BoxShadow(
            color: AppColors.text.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.translate('order_overview'),
            style: AppTextStyles.heading.copyWith(
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (order.totalUsim > 0)
            InfoRow(label: context.l10n.translate('physical_sim_quantity'), value: '${order.totalUsim}'),
          if (order.totalEsim > 0) ...[
            if (order.totalUsim > 0) const SizedBox(height: AppSpacing.sm),
            InfoRow(label: context.l10n.translate('esim_quantity'), value: '${order.totalEsim}'),
          ],
          if (order.totalEsimTravel > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            InfoRow(
              label: context.l10n.translate('esim_travel_quantity'),
              value: '${order.totalEsimTravel}',
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          const Divider(),
          const SizedBox(height: AppSpacing.md),
          InfoRow(
            label: context.l10n.translate('total_amount_order'),
            value: '${numberFormat.format(order.totalAmount)} VND',
            valueStyle: AppTextStyles.heading.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
