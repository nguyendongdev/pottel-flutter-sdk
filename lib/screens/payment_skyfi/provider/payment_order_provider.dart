import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pottel_sdk/screens/sim_data_skyfi/models/create_order/create_order.dart';

import '../../../core/constants/payment_gateway.dart';
import '../../sim_data_skyfi/models/create_order/item.dart';

part 'payment_order_provider.g.dart';

@riverpod
class PaymentOrder extends _$PaymentOrder {
  static CreateOrder? _cachedOrder;

  @override
  CreateOrder build() {
    return _cachedOrder ??
        CreateOrder(
          email: '',
          contactPhone: '',
          deliveryAddress: '',
          customerName: '',
          cityId: null,
          districtId: null,
          wardId: null,
          totalAmount: 0,
          createFromCartId: null,
          discountAmount: 0,
          shippingAmount: 0,
          paymentMethod: PaymentGateway.gatewayName,
          items: [],
        );
  }

  // reset order
  void resetOrder() {
    _cachedOrder = CreateOrder();
    state = _cachedOrder!;
  }

  // email
  void changeEmail(String email) {
    _cachedOrder = state.copyWith(email: email);
    state = _cachedOrder!;
  }

  // phone
  void changePhone(String phone) {
    _cachedOrder = state.copyWith(contactPhone: phone);
    state = _cachedOrder!;
  }

  // city
  void changeCity(int cityId) {
    _cachedOrder = state.copyWith(cityId: cityId);
    state = _cachedOrder!;
  }

  // district
  void changeDistrict(int districtId) {
    _cachedOrder = state.copyWith(districtId: districtId);
    state = _cachedOrder!;
  }

  // ward
  void changeWard(int wardId) {
    _cachedOrder = state.copyWith(wardId: wardId);
    state = _cachedOrder!;
  }

  // address
  void changeAddress(String address) {
    _cachedOrder = state.copyWith(deliveryAddress: address);
    state = _cachedOrder!;
  }

  // total amount
  void changeTotalAmount(int totalAmount) {
    _cachedOrder = state.copyWith(totalAmount: totalAmount);
    state = _cachedOrder!;
  }

  // add create_from_cart_id
  void changeCreateFromCartId(int createFromCartId) {
    _cachedOrder = state.copyWith(createFromCartId: createFromCartId);
    state = _cachedOrder!;
  }

  // discount amount
  void changeDiscountAmount(int discountAmount) {
    _cachedOrder = state.copyWith(discountAmount: discountAmount);
    state = _cachedOrder!;
  }

  // shipping amount
  void changeShippingAmount(int shippingAmount) {
    _cachedOrder = state.copyWith(shippingAmount: shippingAmount);
    state = _cachedOrder!;
  }

  // keep total amount consistent when shipping amount is recalculated
  void updateShippingAmount(int shippingAmount) {
    final previousShipping = state.shippingAmount ?? 0;
    final currentTotal = state.totalAmount ?? 0;
    final nextTotal = currentTotal - previousShipping + shippingAmount;

    _cachedOrder = state.copyWith(
      shippingAmount: shippingAmount,
      totalAmount: nextTotal < 0 ? 0 : nextTotal,
    );
    state = _cachedOrder!;
  }

  // payment method
  void changePaymentMethod(String paymentMethod) {
    _cachedOrder = state.copyWith(paymentMethod: paymentMethod);
    state = _cachedOrder!;
  }

  // customer name
  void changeCustomerName(String customerName) {
    _cachedOrder = state.copyWith(customerName: customerName);
    state = _cachedOrder!;
  }

  // items
  void changeItems(List<Item> items) {
    _cachedOrder = state.copyWith(items: items);
    state = _cachedOrder!;
  }

  // coupon code
  void changeCouponCode(String couponCode) {
    _cachedOrder = state.copyWith(couponCode: couponCode);
    state = _cachedOrder!;
  }

  bool get isEmailValid {
    return state.email != null && state.email!.isNotEmpty;
  }

  bool get isPhoneValid {
    return state.contactPhone != null && state.contactPhone!.isNotEmpty;
  }

  bool get isNameValid {
    return state.customerName != null && state.customerName!.isNotEmpty;
  }

  bool get isAddressValid {
    return state.deliveryAddress != null && state.deliveryAddress!.isNotEmpty;
  }

  // is valid
  bool isValid() {
    return state.email != null &&
        state.contactPhone != null &&
        state.deliveryAddress != null &&
        state.customerName != null &&
        state.cityId != null &&
        state.districtId != null &&
        state.wardId != null;
  }
}
