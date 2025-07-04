import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/payment_skyfi/provider/address_provider.dart';
import 'package:skyfi_sdk/screens/payment_skyfi/provider/payment_order_provider.dart';
import 'package:skyfi_sdk/screens/payment_skyfi/widgets/coupon_code_input.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../sim_data_skyfi/models/create_order/item.dart';
import 'widgets/address_form.dart';
import 'widgets/bottom_action_bar.dart';
import 'widgets/contact_form.dart';
import 'widgets/transaction_summary.dart';

class PaymentSkyfiScreen extends HookConsumerWidget {
  const PaymentSkyfiScreen({super.key, required this.items});

  final List<Item> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeUI = useState<String>('ALL');
    final totalAmountCart = ref.watch(paymentOrderProvider).totalAmount;
    final totalFee = useState<int>(0);
    final discountAmount = useState<int>(0);

    useEffect(() {
      if (items.isNotEmpty) {
        // if all sim_type of items is ESIM, modeUI is esim
        // if all sim_type of items is USIM, modeUI is usim
        // if sim_type of items is ESIM and USIM, modeUI is esim + usim
        if (items.every((item) =>
            item.simType == 'ESIM' || item.simType == 'ESIM_TRAVEL')) {
          modeUI.value = 'ESIM';
        } else if (items.every((item) =>
            item.simType == 'USIM' || item.simType == 'PHYSICAL_SIM')) {
          modeUI.value = 'USIM';
        } else {
          modeUI.value = 'ALL';
        }
      }

      return null;
    }, [items]);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Thanh toán',
          style: AppTextStyles.heading,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            ref.read(paymentOrderProvider.notifier).resetOrder();
            ref.read(addressSelectionProvider.notifier).reset();
            // reset shipping amount
            ref.read(paymentOrderProvider.notifier).changeShippingAmount(0);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              top: AppSpacing.lg,
              bottom: 220,
            ),
            child: Column(
              children: [
                ContactForm(
                  modeUI: modeUI.value,
                ),
                // mode UI: ALL, USIM
                if (modeUI.value == 'USIM' || modeUI.value == 'ALL')
                  const AddressForm(),

                const SizedBox(height: AppSpacing.lg),
                // const DiscountCodeInput(),
                // const SizedBox(height: AppSpacing.lg),
                TransactionSummary(
                  totalAmountCart: totalAmountCart ?? 0,
                  fee: totalFee.value,
                  countItem: items.length,
                  discountAmount: discountAmount.value,
                  shippingAmount:
                      ref.watch(paymentOrderProvider).shippingAmount ?? 0,
                ),
                const SizedBox(height: AppSpacing.lg),
                const CouponCodeInput(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomActionBar(modeUI: modeUI.value),
          ),
        ],
      ),
    );
  }
}
