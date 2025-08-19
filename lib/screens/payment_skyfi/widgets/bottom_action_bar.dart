import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/modals/modalWebview.dart';
import 'package:skyfi_sdk/screens/esim_travel_skyfi/compatible_devices_screen.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_checkbox_with_link.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../l10n/localization_extension.dart';
import '../../../network/api.dart';
import '../../../routers/routers.dart';
import '../../../utilities/common.dart';
import '../../payment_method_skyfi/models/create_order/create_order.dart';
import '../../payment_method_skyfi/models/payment_respone/payment_respone.dart';
import '../provider/payment_order_provider.dart';

class BottomActionBar extends HookConsumerWidget {
  const BottomActionBar({super.key, required this.modeUI});

  final String modeUI;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();
    final state = ref.watch(paymentOrderProvider);
    final termsAccepted = useState<bool>(false);
    final termsAcceptedESIM = useState<bool>(false);
    final isLoading = useState<bool>(false);

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

    Future<String?> getLinkPayment(String orderID) async {
      try {
        final response = await api
            .post('/bss/payment/gateways/GALAXYPAY/redirect', data: {
          'orderNumber': orderID,
          'locale': context.l10n.locale.languageCode
        });
        // isLoading.value = false;
        final data = PaymentRespone.fromJson(response.data);
        if (response.statusCode != 200 && data.code != 200) return null;
        final link = data.result?.redirectUrl;
        if (link == null) return null;
        return link;
      } catch (e) {
        return null;
      }
    }

    void checkOutOrderGALAXYPAY() async {
      try {
        isLoading.value = true;
        final order = ref.read(paymentOrderProvider);
        final items = order.items;
        final itemsJson = items?.map((item) => item.toJson()).toList();
        final orderJson = order.toJson();
        orderJson['items'] = itemsJson;
        orderJson['source'] = 'SDK';
        final response =
            await api.post('/bss/app/create-order', data: orderJson);
        final data = CreateOrder.fromJson(response.data);
        if (response.statusCode == 200 && data.code == 400) {
          Common.showToast(
              data.message ?? context.l10n.translate('error_message'), context);
          return;
        }
        if (response.statusCode == 200 && data.code == 200) {
          final orderID = data.result?.orderNumber;
          if (orderID == null) return;
          final link = await getLinkPayment(orderID);
          if (link == null) {
            showToast(context.l10n.translate('payment_link_error'));
            return;
          }
          context.pushNamed(AppRouter.webviewPaymentSkyfi, extra: link);
        }
      } finally {
        isLoading.value = false;
      }
    }

    // Helper method to set payment method and proceed with checkout
    void setPaymentMethodAndCheckout() {
      // Set payment method
      ref.read(paymentOrderProvider.notifier).changePaymentMethod("GALAXYPAY");

      // Use Future.microtask to ensure the state update is processed
      // before calling checkOutOrderGALAXYPAY
      Future.microtask(() => checkOutOrderGALAXYPAY());
    }

    void onValidate(modeUI) async {
      if (modeUI == "USIM") {
        //  email -> required and format
        if (state.email == null || state.email!.isEmpty) {
          showToast(context.l10n.translate('email_required'));
          return;
        }
        //  check format email
        if (!Common.isValidEmail(state.email!)) {
          showToast(context.l10n.translate('email_invalid'));
          return;
        }
        // phone -> required and format
        if (state.contactPhone == null || state.contactPhone!.isEmpty) {
          showToast(context.l10n.translate('phone_required'));
          return;
        }
        // check format phone
        if (!Common.isValidPhone(state.contactPhone!)) {
          showToast(context.l10n.translate('phone_invalid'));
          return;
        }
        // name -> required
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast(context.l10n.translate('name_required'));
          return;
        }
        // customerName -> max 70 characters
        if (state.customerName!.length > 70) {
          showToast(context.l10n.translate('name_max_length'));
          return;
        }

        // address -> required
        if (state.cityId == null || state.cityId == 0) {
          showToast(context.l10n.translate('please_select_city'));
          return;
        }
        if (state.districtId == null || state.districtId == 0) {
          showToast(context.l10n.translate('please_select_district'));
          return;
        }
        if (state.wardId == null || state.districtId == null) {
          showToast(context.l10n.translate('please_select_ward'));
          return;
        }
        if (state.deliveryAddress == null || state.deliveryAddress!.isEmpty) {
          showToast(context.l10n.translate('delivery_address_required'));
          return;
        }
        // termsAccepted -> required
        if (!termsAccepted.value) {
          showToast(context.l10n.translate('must_agree_terms_conditions'));
          return;
        }
        context.pushNamed(AppRouter.paymentMethodSkyFi, extra: modeUI);
        return;
      }

      if (modeUI == "ESIM") {
        // email -> required and format
        if (state.email == null || state.email!.isEmpty) {
          showToast(context.l10n.translate('email_required'));
          return;
        }
        // phone -> required and format
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast(context.l10n.translate('name_required'));
          return;
        }
        // // check format phone
        // if (!Common.isValidPhone(state.contactPhone!)) {
        //   showToast('Số điện thoại không hợp lệ');
        //   return;
        // }
        // termsAcceptedESIM -> required
        if (!termsAcceptedESIM.value) {
          showToast(context.l10n.translate('terms_required_esim'));
          return;
        }

        // Set payment method and proceed with checkout
        // setPaymentMethodAndCheckout();
        context.pushNamed(AppRouter.paymentMethodSkyFi, extra: modeUI);
        return;
      }

      if (modeUI == "ALL") {
        if (state.email == null || state.email!.isEmpty) {
          showToast(context.l10n.translate('email_required'));
          return;
        }
        //  check format email
        if (!Common.isValidEmail(state.email!)) {
          showToast(context.l10n.translate('email_invalid'));
          return;
        }
        // phone -> required and format
        if (state.contactPhone == null || state.contactPhone!.isEmpty) {
          showToast(context.l10n.translate('phone_required'));
          return;
        }
        // check format phone
        if (!Common.isValidPhone(state.contactPhone!)) {
          showToast(context.l10n.translate('phone_invalid'));
          return;
        }
        // name -> required
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast(context.l10n.translate('name_required'));
          return;
        }
        // customerName -> max 70 characters
        if (state.customerName!.length > 70) {
          showToast(context.l10n.translate('name_max_length'));
          return;
        }
        // address -> required
        if (state.cityId == null ||
            state.cityId == 0 ||
            state.districtId == null ||
            state.districtId == 0 ||
            state.wardId == null ||
            state.wardId == 0) {
          showToast(context.l10n.translate('address_required'));
          return;
        }
        if (state.deliveryAddress == null || state.deliveryAddress!.isEmpty) {
          showToast(context.l10n.translate('delivery_address_required'));
          return;
        }
        // termsAccepted -> required
        if (!termsAccepted.value) {
          showToast(context.l10n.translate('terms_required_skyfi'));
          return;
        }
        // termsAcceptedESIM -> required
        if (!termsAcceptedESIM.value) {
          showToast(context.l10n.translate('terms_required_general'));
          return;
        }

        // Set payment method and proceed with checkout
        // setPaymentMethodAndCheckout();
        context.pushNamed(AppRouter.paymentMethodSkyFi, extra: modeUI);
        return;
      }
    }

    void onShowDeviceList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (context) => const CompatibleDevicesScreen(),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        top: AppSpacing.lg,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 16,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSpacing.sm),
          AppCheckboxWithLink(
            value: termsAcceptedESIM.value,
            onChanged: (value) {
              termsAcceptedESIM.value = value ?? false;
              termsAccepted.value = value ?? false;
            },
            text: modeUI == 'ESIM' || modeUI == 'ALL'
                ? context.l10n.translate('device_compatible_esim')
                : context.l10n.translate('terms_required_esim_travel'),
            links: [
              modeUI == 'ESIM' || modeUI == 'ALL'
                  ? LinkData(
                      text: context.l10n.translate('compatible_with_esim'),
                      onTap: () {
                        onShowDeviceList();
                      },
                    )
                  : LinkData(
                      text: context.l10n
                          .translate('terms_conditions_transaction'),
                      onTap: () {
                        WebViewModal.showWebContent(
                          context: context,
                          url:
                              'https://skyfi.pro/vi/terms-and-conditions?src=app',
                          title: context.l10n
                              .translate('terms_conditions_transaction'),
                        );
                      },
                    ),
              if (modeUI == 'ESIM' || modeUI == 'ALL')
                LinkData(
                  text: context.l10n.translate('terms_conditions'),
                  onTap: () {
                    WebViewModal.showWebContent(
                      context: context,
                      url: 'https://skyfi.pro/vi/terms-and-conditions?src=app',
                      title: context.l10n.translate('terms_conditions'),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          GradientButton(
            onPressed: () {
              onValidate(modeUI);
              // context.pushNamed(AppRouter.paymentMethodSkyFi);
            },
            // text: isLoading.value
            //     ? context.l10n.translate('loading_text')
            //     : (modeUI == 'USIM'
            //         ? context.l10n.translate('choose_payment_method_button')
            //         : context.l10n.translate('payment')),

            text: isLoading.value
                ? context.l10n.translate('loading_text')
                : context.l10n.translate('choose_payment_method_button'),
            height: 48,
            disabled: isLoading.value,
            textStyle: AppTextStyles.button.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
