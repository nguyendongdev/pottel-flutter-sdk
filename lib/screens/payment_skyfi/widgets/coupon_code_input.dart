import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/core/widgets/Popup_notice.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/network/api.dart';
import 'package:skyfi_sdk/screens/payment_skyfi/provider/payment_order_provider.dart';
import 'package:skyfi_sdk/themes/colors.dart';
import 'package:skyfi_sdk/utilities/common.dart';

class CouponCodeInput extends HookConsumerWidget {
  const CouponCodeInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = useState<String>("");
    final isApplied = useState<bool>(false);
    final couponCode = useState<String>("");
    final couponDescription = useState<String>("");
    final amountBeforeDiscount = useState<int>(0);
    var couponCodeController = TextEditingController();
    //  listen shipping amount change

    final api = API();

    final isLoading = useState<bool>(false);

    void requestApplyCouponCode() async {
      try {
        errorText.value = "";
        final params = ref.read(paymentOrderProvider);
        final items = params.items;
        final itemsJson = items?.map((item) => item.toJson()).toList();
        final orderJson = params.toJson();
        orderJson['items'] = itemsJson;
        print(orderJson);
        final response =
            await api.post('/bss/app/validate-coupon', data: orderJson);
        print(response.data);
        if (response.statusCode == 200 && response.data['code'] == 400) {
          errorText.value = response.data['message'];
          ref.read(paymentOrderProvider.notifier).changeCouponCode('');
          return;
        }
        if (response.statusCode == 200 &&
            response.data['result']['is_valid'] == false) {
          errorText.value = response.data['result']['message'];
          ref.read(paymentOrderProvider.notifier).changeCouponCode('');
          return;
        }

        if (response.statusCode == 200 &&
            response.data['result']['is_valid'] == true) {
          errorText.value = "";
          var discount_amount = response.data['result']['discount_amount'];
          var total_order_amount =
              response.data['result']['final_total_amount'];

          amountBeforeDiscount.value =
              response.data['result']['total_order_amount'].toInt() ?? 0;
          ref
              .read(paymentOrderProvider.notifier)
              .changeDiscountAmount(discount_amount?.toInt() ?? 0);
          ref
              .read(paymentOrderProvider.notifier)
              .changeTotalAmount(total_order_amount?.toInt() ?? 0);
          couponCode.value = couponCodeController.text;
          isApplied.value = true;
          couponCode.value =
              response.data['result']['coupon_details']['code'] ?? '';
          couponDescription.value =
              response.data['result']['description'] ?? '';

          showPopupNotice(context,
              title: 'Thông báo',
              description:
                  'Áp dụng mã giảm giá thành công! Bạn được giảm: ${Common.formatCurrency(discount_amount.toString())} VNĐ');
          return;
        }
      } catch (e) {
        errorText.value = "Mã giảm giá không hợp lệ";
      }
    }

    useEffect(() {
      ref.listen(paymentOrderProvider, (previous, next) {
        if (next.shippingAmount != previous?.shippingAmount) {
          // next.shippingAmount is not null, and is not 0, apply coupon code
          if (next.shippingAmount != null && next.shippingAmount != 0) {
            // if coupon code is not empty, apply coupon code
            print('next.couponCode: ${next.couponCode}');
            if (next.couponCode != null && next.couponCode!.isNotEmpty) {
              requestApplyCouponCode();
            }
          }
        }
      });
    }, [ref.watch(paymentOrderProvider)]);

    Future<void> applyCouponCode() async {
      isLoading.value = true;
      requestApplyCouponCode();
      isLoading.value = false;
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: isApplied.value ? AppColors.green.withOpacity(0.1) : white,
        border: Border.all(
            color: isApplied.value ? AppColors.green : AppColors.border),
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
      ),
      child: !isApplied.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mã giảm giá',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: AppSpacing.sm),
                // show error text
                if (errorText.value.isNotEmpty)
                  Text(
                    errorText.value,
                    style: AppTextStyles.small.copyWith(color: AppColors.red),
                  ),

                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: couponCodeController,
                  style: AppTextStyles.label,
                  decoration: InputDecoration(
                    hintText: 'Nhập mã giảm giá',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.buttonRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.buttonRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.buttonRadius),
                    ),
                    prefixIcon: const Icon(
                      Icons.confirmation_num_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                GradientButton(
                  onPressed: () {
                    if (couponCodeController.text.isEmpty) {
                      errorText.value = "Mã giảm giá không hợp lệ";
                    } else {
                      errorText.value = "";
                      Future.microtask(() {
                        ref
                            .read(paymentOrderProvider.notifier)
                            .changeCouponCode(
                                couponCodeController.text.trim().toUpperCase());
                      }).then((value) {
                        applyCouponCode();
                      });
                    }
                  },
                  height: 46,
                  text: isLoading.value
                      ? "Đang áp dụng..."
                      : "Áp dụng mã giảm giá",
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // icon
                Icon(
                  Icons.check_circle,
                  size: 32,
                  color: AppColors.green,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.66,
                      child: Text(
                        couponDescription.value,
                        style: AppTextStyles.label.copyWith(
                            color: AppColors.green,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      couponCode.value +
                          " - Giảm giá " +
                          Common.formatCurrency(ref
                              .watch(paymentOrderProvider)
                              .discountAmount
                              .toString()) +
                          " VNĐ",
                      style:
                          AppTextStyles.small.copyWith(color: AppColors.green),
                    ),
                  ],
                ),
                // button icon close
                IconButton(
                  padding: const EdgeInsets.all(0),
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    isApplied.value = false;
                    ref
                        .read(paymentOrderProvider.notifier)
                        .changeDiscountAmount(0);

                    ref
                        .read(paymentOrderProvider.notifier)
                        .changeCouponCode('');
                    // if has shipping amount, add it to total amount
                    ref.read(paymentOrderProvider.notifier).changeTotalAmount(
                        amountBeforeDiscount.value +
                            (ref.watch(paymentOrderProvider).shippingAmount ??
                                0));

                    couponCodeController.clear();
                  },
                  icon:
                      const Icon(Icons.close, color: AppColors.green, size: 22),
                ),
              ],
            ),
    );
  }
}
