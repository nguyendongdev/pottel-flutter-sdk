import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../l10n/localization_extension.dart';
import '../../../routers/routers.dart';
import '../../../utilities/common.dart';
import '../../cart_skyfi/provider/cart_provider.dart';
import '../../payment_skyfi/provider/payment_order_provider.dart';
import '../models/create_order/item.dart';
import 'preview_cart_item.dart';

class PreviewCart extends HookConsumerWidget {
  const PreviewCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Column(
        children: [
          // Header - cố định
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/feat_success_check.svg',
                width: 22,
                height: 22,
                package: 'pottel_sdk',
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                context.l10n.translate('cart_success_title'),
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.green,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),

          // Content - có thể scroll
          Expanded(
            child: cartAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text(
                  '${context.l10n.translate('error_occurred')}$error',
                  style: AppTextStyles.body.copyWith(color: AppColors.red),
                ),
              ),
              data: (cart) => Column(
                children: [
                  // Danh sách items - có thể scroll
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return PreviewCartItem(
                          item: cart.items[index],
                        );
                      },
                    ),
                  ),

                  // Footer - cố định (total price và buttons)
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Text(
                        context.l10n.translate('total'),
                        style: AppTextStyles.title,
                      ),
                      const Spacer(),
                      Text(
                        '${Common.formatCurrency(ref.watch(cartProvider.notifier).totalAmount.toInt().toString())} VND',
                        style: AppTextStyles.heading,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.pushNamed(AppRouter.cartSkyFi);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.strongSecondary,
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.md),
                            side: const BorderSide(
                                color: AppColors.strongSecondary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSpacing.buttonRadius),
                            ),
                          ),
                          child: Text(context.l10n
                              .translate('view_cart')
                              .replaceAll(
                                  '{0}',
                                  ref
                                      .watch(cartProvider.notifier)
                                      .itemCount
                                      .toString())),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      Expanded(
                        child: GradientButton(
                          onPressed: () {
                            //  mapping data
                            final paymentItems = cart.items
                                .map((cartItem) => Item(
                                      productId: cartItem.productId,
                                      variantId: cartItem.id,
                                      msisdnId: cartItem.msisdnId,
                                      packPrice: cartItem.packPrice.toInt(),
                                      simPrice: cartItem.simPrice.toInt(),
                                      salePrice: cartItem.salePrice.toInt(),
                                      quantity: cartItem.quantity,
                                      simType: cartItem.simType,
                                      packCode: cartItem.packCode,
                                    ))
                                .toList();
                            // Initialize payment order with empty values
                            // ref.read(paymentOrderProvider.notifier).resetOrder();

                            // Set items and total amount in payment provider
                            ref
                                .read(paymentOrderProvider.notifier)
                                .changeItems(paymentItems);
                            ref
                                .read(paymentOrderProvider.notifier)
                                .changeTotalAmount(ref
                                    .read(cartProvider.notifier)
                                    .totalAmount
                                    .toInt());
                            ref
                                .read(paymentOrderProvider.notifier)
                                .changeCreateFromCartId(cart.cartId);

                            context.pushNamed(AppRouter.paymentSkyFi,
                                extra: paymentItems);
                          },
                          text: context.l10n.translate('payment'),
                          height: 48,
                          textStyle: AppTextStyles.button.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
