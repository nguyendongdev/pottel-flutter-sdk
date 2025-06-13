import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../models/order_detail_model.dart';
import 'info_row.dart';

class OrderInfoCard extends StatelessWidget {
  final OrderDetailModel order;

  const OrderInfoCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
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
            'Thông tin đơn hàng',
            style: AppTextStyles.heading.copyWith(
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          InfoRow(label: 'Mã đơn hàng:', value: order.orderCode),
          const SizedBox(height: AppSpacing.sm),
          InfoRow(
            label: 'Ngày đặt hàng:',
            value: order.createdAt,
          ),
        ],
      ),
    );
  }
}
