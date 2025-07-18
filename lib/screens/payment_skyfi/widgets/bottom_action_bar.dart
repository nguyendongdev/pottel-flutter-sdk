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
        final response = await api.post(
            '/bss/payment/gateways/GALAXYPAY/redirect',
            data: {'orderNumber': orderID});
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
        final response =
            await api.post('/bss/app/create-order', data: orderJson);
        final data = CreateOrder.fromJson(response.data);
        if (response.statusCode == 200 && data.code == 400) {
          Common.showToast(data.message ?? 'Lỗi', context);
          return;
        }
        if (response.statusCode == 200 && data.code == 200) {
          final orderID = data.result?.orderNumber;
          if (orderID == null) return;
          final link = await getLinkPayment(orderID);
          if (link == null) {
            showToast('Lỗi khi lấy link thanh toán');
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
          showToast('Email là bắt buộc');
          return;
        }
        //  check format email
        if (!Common.isValidEmail(state.email!)) {
          showToast('Email không hợp lệ');
          return;
        }
        // phone -> required and format
        if (state.contactPhone == null || state.contactPhone!.isEmpty) {
          showToast('Số điện thoại là bắt buộc');
          return;
        }
        // check format phone
        if (!Common.isValidPhone(state.contactPhone!)) {
          showToast('Số điện thoại không hợp lệ');
          return;
        }
        // name -> required
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast('Tên là bắt buộc');
          return;
        }
        // customerName -> max 70 characters
        if (state.customerName!.length > 70) {
          showToast('Tên không được vượt quá 70 ký tự');
          return;
        }

        // address -> required
        if (state.cityId == null || state.cityId == 0) {
          showToast('Vui lòng chọn thành phố');
          return;
        }
        if (state.districtId == null || state.districtId == 0) {
          showToast('Vui lòng chọn quận/huyện');
          return;
        }
        if (state.wardId == null || state.districtId == null) {
          showToast('Vui lòng chọn phường/xã');
          return;
        }
        if (state.deliveryAddress == null || state.deliveryAddress!.isEmpty) {
          showToast('Vui lòng nhập địa chỉ giao hàng');
          return;
        }
        // termsAccepted -> required
        if (!termsAccepted.value) {
          showToast(
              'Bạn phải đồng ý với Điều khoản & Điều kiện giao dịch chung của SkyFi');
          return;
        }
        context.pushNamed(AppRouter.paymentMethodSkyFi, extra: modeUI);
        return;
      }

      if (modeUI == "ESIM") {
        // email -> required and format
        if (state.email == null || state.email!.isEmpty) {
          showToast('Email là bắt buộc');
          return;
        }
        // phone -> required and format
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast('Tên là bắt buộc');
          return;
        }
        // // check format phone
        // if (!Common.isValidPhone(state.contactPhone!)) {
        //   showToast('Số điện thoại không hợp lệ');
        //   return;
        // }
        // termsAcceptedESIM -> required
        if (!termsAcceptedESIM.value) {
          showToast('Bạn phải đồng ý với Điều kiện & Điều khoản');
          return;
        }

        // Set payment method and proceed with checkout
        setPaymentMethodAndCheckout();
        return;
      }

      if (modeUI == "ALL") {
        if (state.email == null || state.email!.isEmpty) {
          showToast('Email là bắt buộc');
          return;
        }
        //  check format email
        if (!Common.isValidEmail(state.email!)) {
          showToast('Email không hợp lệ!!');
          return;
        }
        // phone -> required and format
        if (state.contactPhone == null || state.contactPhone!.isEmpty) {
          showToast('Số điện thoại là bắt buộc');
          return;
        }
        // check format phone
        if (!Common.isValidPhone(state.contactPhone!)) {
          showToast('Số điện thoại không hợp lệ!');
          return;
        }
        // name -> required
        if (state.customerName == null || state.customerName!.isEmpty) {
          showToast('Tên là bắt buộc');
          return;
        }
        // customerName -> max 70 characters
        if (state.customerName!.length > 70) {
          showToast('Tên không được vượt quá 70 ký tự');
          return;
        }
        // address -> required
        if (state.cityId == null ||
            state.cityId == 0 ||
            state.districtId == null ||
            state.districtId == 0 ||
            state.wardId == null ||
            state.wardId == 0) {
          showToast('Địa chỉ là bắt buộc');
          return;
        }
        if (state.deliveryAddress == null || state.deliveryAddress!.isEmpty) {
          showToast('Vui lòng nhập địa chỉ giao hàng');
          return;
        }
        // termsAccepted -> required
        if (!termsAccepted.value) {
          showToast(
              'Bạn phải đồng ý với Điều khoản & Điều kiện giao dịch chung của SkyFi');
          return;
        }
        // termsAcceptedESIM -> required
        if (!termsAcceptedESIM.value) {
          showToast('Bạn phải đồng ý với Điều kiền & Điều khoản');
          return;
        }

        // Set payment method and proceed with checkout
        setPaymentMethodAndCheckout();
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
                ? 'Thiết bị của tôi là tương thích với eSIM. Tôi đồng ý với Điều kiện & Điều khoản.'
                : 'Tôi đồng ý với Điều khoản & Điều kiện giao dịch chung của SkyFi',
            links: [
              modeUI == 'ESIM' || modeUI == 'ALL'
                  ? LinkData(
                      text: 'tương thích với eSIM',
                      onTap: () {
                        onShowDeviceList();
                      },
                    )
                  : LinkData(
                      text: 'Điều khoản & Điều kiện giao dịch',
                      onTap: () {
                        WebViewModal.showWebContent(
                          context: context,
                          url:
                              'https://skyfi.pro/vi/terms-and-conditions?src=app',
                          title: 'Điều khoản & Điều kiện ',
                        );
                      },
                    ),
              if (modeUI == 'ESIM' || modeUI == 'ALL')
                LinkData(
                  text: 'Điều kiện & Điều khoản.',
                  onTap: () {
                    WebViewModal.showWebContent(
                      context: context,
                      url: 'https://skyfi.pro/vi/terms-and-conditions?src=app',
                      title: 'Điều khoản & Điều kiện ',
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
            text: isLoading.value
                ? 'Loading...'
                : (modeUI == 'USIM'
                    ? 'Chọn phương thức thanh toán'
                    : 'Thanh toán'),
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
