// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderImpl _$$CreateOrderImplFromJson(Map<String, dynamic> json) =>
    _$CreateOrderImpl(
      deliveryAddress: json['delivery_address'] as String?,
      paymentMethod: json['payment_method'] as String?,
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      shippingAmount: (json['shipping_amount'] as num?)?.toInt(),
      contactPhone: json['contact_phone'] as String?,
      email: json['email'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      wardId: (json['ward_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      customerName: json['customer_name'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      createFromCartId: (json['create_from_cart_id'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateOrderImplToJson(_$CreateOrderImpl instance) =>
    <String, dynamic>{
      'delivery_address': instance.deliveryAddress,
      'payment_method': instance.paymentMethod,
      'discount_amount': instance.discountAmount,
      'shipping_amount': instance.shippingAmount,
      'contact_phone': instance.contactPhone,
      'email': instance.email,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'ward_id': instance.wardId,
      'created_by': instance.createdBy,
      'customer_name': instance.customerName,
      'total_amount': instance.totalAmount,
      'create_from_cart_id': instance.createFromCartId,
      'items': instance.items,
    };
