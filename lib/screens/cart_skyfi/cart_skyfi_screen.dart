import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/utilities/common.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../routers/routers.dart';
import '../payment_skyfi/provider/payment_order_provider.dart';
import '../sim_data_skyfi/models/create_order/item.dart';
import 'provider/cart_provider.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/empty_cart.dart';

class CartSkyfiScreen extends ConsumerWidget {
  const CartSkyfiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title:
            Text(context.l10n.translate('cart'), style: AppTextStyles.heading),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: cartAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              context.l10n
                  .translate('error_occurred_cart')
                  .replaceAll('{0}', error.toString()),
              style: AppTextStyles.body.copyWith(color: AppColors.red),
            ),
          ),
          data: (cart) => cart.items.isEmpty
              ? EmptyCart(
                  onContinueShopping: () {
                    // TODO: Navigate to shop
                    Navigator.of(context).pop();
                  },
                  title: context.l10n.translate('empty_cart_title'),
                  description: context.l10n.translate('empty_cart_description'),
                  titleButton: context.l10n.translate('continue_shopping'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  AppSpacing.screenPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    '${context.l10n.translate('products_count').replaceAll('{0}', ref.watch(cartProvider.notifier).itemCount.toString())} | ${Common.formatCurrency(ref.watch(cartProvider.notifier).totalAmount.toInt().toString())} VND',
                                    style: AppTextStyles.title,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.screenPadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: AppSpacing.xl * 4,
                                      bottom: AppSpacing.md,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            context.l10n
                                                .translate('product_label'),
                                            style: AppTextStyles.title,
                                          ),
                                        ),
                                        Text(
                                          context.l10n
                                              .translate('price_column'),
                                          style: AppTextStyles.title,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ...cart.items.map((item) => CartItemWidget(
                                        item: item,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Container(
                              padding: const EdgeInsets.all(
                                  AppSpacing.screenPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    context.l10n.translate('order_summary'),
                                    style: AppTextStyles.heading,
                                  ),
                                  const SizedBox(height: AppSpacing.lg),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n
                                            .translate('products_count')
                                            .replaceAll(
                                                '{0}',
                                                ref
                                                    .watch(
                                                        cartProvider.notifier)
                                                    .itemCount
                                                    .toString()),
                                        style: AppTextStyles.body,
                                      ),
                                      Text(
                                        '${Common.formatCurrency(ref.watch(cartProvider.notifier).totalAmount.toInt().toString())} VND',
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n
                                            .translate('tax_service_fee'),
                                        style: AppTextStyles.body,
                                      ),
                                      Text(
                                        context.l10n.translate('included'),
                                        style: AppTextStyles.body,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.md,
                                    ),
                                    child: Divider(
                                      color: AppColors.border,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.translate('total_amount'),
                                        style: AppTextStyles.heading,
                                      ),
                                      Text(
                                        '${Common.formatCurrency(ref.watch(cartProvider.notifier).totalAmount.toInt().toString())} VND',
                                        style: AppTextStyles.heading,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: AppSpacing.screenPadding,
                        right: AppSpacing.screenPadding,
                        top: AppSpacing.lg,
                        bottom: MediaQuery.of(context).padding.bottom +
                            AppSpacing.lg,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1A000000),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: GradientButton(
                        onPressed: () {
                          // Map cart items to payment items
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

                          // Navigate to payment screen
                          context.pushNamed(AppRouter.paymentSkyFi,
                              extra: paymentItems);
                        },
                        text: context.l10n.translate('payment_button'),
                        height: 48,
                        textStyle: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
