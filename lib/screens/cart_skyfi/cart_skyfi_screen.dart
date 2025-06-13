import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/utilities/common.dart';

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
        title: const Text('Giỏ hàng', style: AppTextStyles.heading),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      body: cartAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text(
            'Có lỗi xảy ra: $error',
            style: AppTextStyles.body.copyWith(color: AppColors.red),
          ),
        ),
        data: (cart) => cart.items.isEmpty
            ? EmptyCart(
                onContinueShopping: () {
                  // TODO: Navigate to shop
                  context.pop();
                },
              )
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.all(AppSpacing.screenPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '${cart.items.length} sản phẩm | ${Common.formatCurrency(ref.watch(cartProvider.notifier).totalAmount.toInt().toString())} VND',
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
                                const Padding(
                                  padding: EdgeInsets.only(
                                    right: AppSpacing.xl * 4,
                                    bottom: AppSpacing.md,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Sản Phẩm',
                                          style: AppTextStyles.title,
                                        ),
                                      ),
                                      Text(
                                        'Giá',
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
                            padding:
                                const EdgeInsets.all(AppSpacing.screenPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Tóm tắt đơn hàng',
                                  style: AppTextStyles.heading,
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${cart.items.length} sản phẩm',
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
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Thuế & Phí dịch vụ',
                                      style: AppTextStyles.body,
                                    ),
                                    Text(
                                      'Đã bao gồm',
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
                                    const Text(
                                      'Tổng cộng',
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
                      bottom:
                          MediaQuery.of(context).padding.bottom + AppSpacing.lg,
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
                      text: 'Thanh toán',
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
    );
  }
}
