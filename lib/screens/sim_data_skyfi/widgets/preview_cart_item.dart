import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../utilities/common.dart';
import '../../cart_skyfi/models/cart_response.dart';
import '../../cart_skyfi/provider/cart_provider.dart';

class PreviewCartItem extends ConsumerWidget {
  const PreviewCartItem({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // image
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(20),
          //   child: Image.network(
          //     item.icon,
          //     width: 40,
          //     height: 40,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: item.simType == 'ESIM_TRAVEL'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        item.packCode,
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Row(
                        children: [
                          Text(
                            context.l10n.translate('quantity'),
                            style: AppTextStyles.label,
                          ),
                          Text(
                            item.quantity.toString(),
                            style: AppTextStyles.label,
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        Common.getSimTypeName(item.simType),
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        item.packCode,
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                    ],
                  ),
          ),
          const SizedBox(width: AppSpacing.xl),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    '${Common.formatCurrency(item.totalPrice.toInt().toString())} VND',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  // icon delete
                  IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeFromCart(item.id);
                    },
                    icon: const Icon(Icons.delete, color: AppColors.textLight),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
