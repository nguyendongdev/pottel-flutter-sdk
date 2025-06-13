import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
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
            'Tổng quan đơn hàng',
            style: AppTextStyles.heading.copyWith(
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (order.totalUsim > 0)
            InfoRow(label: 'Số lượng sim vật lý:', value: '${order.totalUsim}'),
          if (order.totalEsim > 0) ...[
            if (order.totalUsim > 0) const SizedBox(height: AppSpacing.sm),
            InfoRow(label: 'Số lượng eSIM:', value: '${order.totalEsim}'),
          ],
          if (order.totalEsimTravel > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            InfoRow(
              label: 'Số lượng eSIM du lịch:',
              value: '${order.totalEsimTravel}',
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          const Divider(),
          const SizedBox(height: AppSpacing.md),
          InfoRow(
            label: 'Tổng tiền:',
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
