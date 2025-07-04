import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'create_order.freezed.dart';
part 'create_order.g.dart';

@freezed
class CreateOrder with _$CreateOrder {
  factory CreateOrder({
    @JsonKey(name: 'delivery_address') String? deliveryAddress,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'discount_amount') int? discountAmount,
    @JsonKey(name: 'shipping_amount') int? shippingAmount,
    @JsonKey(name: 'contact_phone') String? contactPhone,
    String? email,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'district_id') int? districtId,
    @JsonKey(name: 'ward_id') int? wardId,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'total_amount') int? totalAmount,
    @JsonKey(name: 'create_from_cart_id') int? createFromCartId,
    List<Item>? items,
    @JsonKey(name: 'coupon_code') String? couponCode,
  }) = _CreateOrder;

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderFromJson(json);
}
