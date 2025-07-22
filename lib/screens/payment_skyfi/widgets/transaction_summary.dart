import 'package:flutter/material.dart';
import 'package:skyfi_sdk/utilities/common.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';

class TransactionSummary extends StatelessWidget {
  const TransactionSummary(
      {super.key,
      required this.totalAmountCart,
      required this.fee,
      required this.countItem,
      required this.discountAmount,
      required this.shippingAmount});

  final int totalAmountCart;
  final int fee;
  final int countItem;
  final int discountAmount;
  final int shippingAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.description_outlined, color: AppColors.text),
              const SizedBox(width: AppSpacing.sm),
              Text(
                context.l10n.translate('transaction_info'),
                style: AppTextStyles.title,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _buildRow(
            label: context.l10n.translate('face_value'),
            value: Common.formatCurrency(
                (totalAmountCart - shippingAmount - discountAmount).toString()),
            isTotal: true,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildRow(
            label: context.l10n.translate('discount_label'),
            value: Common.formatCurrency(discountAmount.toString()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildRow(
            label: context.l10n.translate('shipping_fee'),
            value: Common.formatCurrency(shippingAmount.toString()),
            showVND: false,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildRow(
            label: context.l10n.translate('quantity_label'),
            value: countItem.toString(),
            showVND: false,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(color: AppColors.border),
          ),
          _buildTotalRow(
            label: context.l10n.translate('total_payment'),
            value: Common.formatCurrency(totalAmountCart.toString()),
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              context.l10n.translate('vat_included'),
              style: AppTextStyles.small.copyWith(
                color: AppColors.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required String value,
    bool showVND = true,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textGrey,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: isTotal
                  ? AppTextStyles.title
                  : AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
            ),
            if (showVND) ...[
              const SizedBox(width: AppSpacing.xs),
              Text(
                'VND',
                style: AppTextStyles.label,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildTotalRow({
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textGrey,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: AppTextStyles.heading.copyWith(
                fontSize: 22,
                color: AppColors.red,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'VND',
              style: AppTextStyles.label.copyWith(
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
