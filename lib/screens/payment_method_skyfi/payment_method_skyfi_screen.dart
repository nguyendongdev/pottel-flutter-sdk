import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/widgets/snack_bar_app.dart';
import 'package:skyfi_sdk/screens/payment_method_skyfi/models/payment_respone/payment_respone.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import '../../l10n/localization_extension.dart';
import '../../network/api.dart';
import '../../routers/routers.dart';
import '../../utilities/common.dart';
import '../payment_skyfi/provider/payment_order_provider.dart';
import 'models/create_order/create_order.dart';
import 'models/payment_method/payment_method.dart';

class PaymentMethodSkyFiScreen extends HookConsumerWidget {
  const PaymentMethodSkyFiScreen({super.key, required this.modeUI});

  final String modeUI;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.read(paymentOrderProvider);
    final api = API();
    final isLoading = useState<bool>(false);
    print('modeUI: ${modeUI}');
    final isSelected = useState<String>('international');
    final paymentMethods = useState<List<dynamic>>([]);

    void fetchPaymentMethods() async {
      final response = await api.get('/bss/payment/gateways/SDK/methods');
      final data = PaymentMethod.fromJson(response.data);
      if (response.statusCode == 200 && data.code == 200) {
        paymentMethods.value = data.result?.methods ?? [];
      }
    }

    void getLinkPayment(String orderID) async {
      print('paymentMethod: ${isSelected.value}');
      isLoading.value = true;
      final response = await api
          .post('/bss/payment/gateways/GALAXYPAY/redirect', data: {
        'orderNumber': orderID,
        'locale': context.l10n.locale.languageCode,
        'paymentMethod': isSelected.value
      });

      isLoading.value = false;
      final data = PaymentRespone.fromJson(response.data);
      if (response.statusCode == 200 && data.code == 200) {
        final link = data.result?.redirectUrl;
        if (link != null) {
          context.pushNamed(AppRouter.webviewPaymentSkyfi, extra: link);
        }
      }
    }

    void checkOutOrderGALAXYPAY() async {
      isLoading.value = true;

      final order = ref.read(paymentOrderProvider);
      final items = order.items;
      final itemsJson = items?.map((item) => item.toJson()).toList();
      final orderJson = order.toJson();
      orderJson['items'] = itemsJson;
      orderJson['source'] = 'SDK';
      print('orderJson: $orderJson');
      isLoading.value = false;
      final response = await api.post('/bss/app/create-order', data: orderJson);
      isLoading.value = false;
      final data = CreateOrder.fromJson(response.data);
      if (response.statusCode == 200 && data.code == 200) {
        final orderID = data.result?.orderNumber;
        if (orderID != null) {
          //  reset order
          // ref.read(paymentOrderProvider.notifier).resetOrder();
          getLinkPayment(orderID);
        }
      }
      if (response.statusCode == 200 && data.code == 400) {
        Common.showToast(
            data.message ?? context.l10n.translate('error_general'), context);
        return;
      }
    }

    void onMoveDetailOrder(String orderId) {
      context.pushNamed(AppRouter.orderDetailSkyfi, extra: orderId);
    }

    void onBackSimData() {
      // ref.read(paymentOrderProvider.notifier).resetOrder();
      Navigator.of(context).pop();
      context.pushNamed(AppRouter.simDataSkyFi);
    }

    void checkOutOrderCOD() async {
      final order = ref.read(paymentOrderProvider);
      final items = order.items;
      final itemsJson = items?.map((item) => item.toJson()).toList();
      final orderJson = order.toJson();
      orderJson['items'] = itemsJson;
      final response = await api.post('/bss/app/create-order', data: orderJson);
      print('response: ${response.data}');
      if (response.statusCode == 200 && response.data['code'] == 200) {
        final orderId = response.data['result']['order_number'];
        // show popup
        Common.showDialogConfirm(
          context,
          context.l10n.translate('success_title'),
          context.l10n.translate('order_created_successfully'),
          () => onMoveDetailOrder(orderId),
          onBackSimData,
          primaryButtonText: context.l10n.translate('view_details_button'),
          secondaryButtonText: context.l10n.translate('buy_more_button'),
        );
      }
    }

    void handlePayment(String paymentMethod) async {
      if (paymentMethod.isEmpty) {
        SnackBarApp.showWarning(context,
            message: context.l10n.translate('please_choose_payment_method'));
        return;
      }

      // if (isSelected.value == 'COD') {
      //   checkOutOrderCOD();
      // }
      // if (isSelected.value == 'GALAXYPAY') {
        checkOutOrderGALAXYPAY();
      // }
      return;
    }

    useEffect(() {
      fetchPaymentMethods();
      return null;
    }, []);

    showToast(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        // show in top of screen
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: AppTextStyles.body.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(context.l10n.translate('payment_method_title'),
            style: AppTextStyles.title),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.sm),
                Text(
                  context.l10n.translate('choose_payment_method'),
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Expanded(
                  child: paymentMethods.value.isNotEmpty
                      ? ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: AppSpacing.sm),
                          shrinkWrap: true,
                          itemCount: paymentMethods.value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isSelected.value ==
                                        paymentMethods
                                            .value[index].paymentMethod,
                                    activeColor: AppColors.primary,
                                    checkColor: AppColors.white,
                                    onChanged: (value) {
                                      ref
                                          .read(paymentOrderProvider.notifier)
                                          .changePaymentMethod(paymentMethods
                                                  .value[index].paymentMethod ??
                                              '');
                                      isSelected.value = paymentMethods
                                              .value[index].paymentMethod ??
                                          '';
                                    },
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (modeUI == 'ESIM' &&
                                            paymentMethods.value[index]
                                                    .paymentMethod ==
                                                'COD') {
                                          showToast(context.l10n.translate(
                                              'esim_not_support_cod'));
                                          return;
                                        }
                                        ref
                                            .read(paymentOrderProvider.notifier)
                                            .changePaymentMethod(paymentMethods
                                                    .value[index]
                                                    .paymentMethod ??
                                                '');
                                        isSelected.value = paymentMethods
                                                .value[index].paymentMethod ??
                                            '';
                                      },
                                      child: Text(
                                          paymentMethods.value[index].name ??
                                              '',
                                          style: AppTextStyles.body.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.text,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(context.l10n
                              .translate('no_payment_methods_available')),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
          vertical: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
        ),
        child: isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : BottomButton(
                onPressed: () {
                  handlePayment(isSelected.value);
                },
                text: context.l10n.translate('confirm_button'),
                textStyle:
                    AppTextStyles.button.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
