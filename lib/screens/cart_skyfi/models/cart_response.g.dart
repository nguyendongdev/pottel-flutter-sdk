// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartResponseImpl _$$CartResponseImplFromJson(Map<String, dynamic> json) =>
    _$CartResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result: CartResult.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$CartResponseImplToJson(_$CartResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$CartResultImpl _$$CartResultImplFromJson(Map<String, dynamic> json) =>
    _$CartResultImpl(
      cartId: (json['cart_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartResultImplToJson(_$CartResultImpl instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'items': instance.items,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      cartId: (json['cart_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      productName: json['product_name'] as String,
      productId: (json['product_id'] as num).toInt(),
      simType: json['sim_type'] as String,
      regionId: (json['region_id'] as num).toInt(),
      packCode: json['pack_code'] as String,
      salePrice: (json['sale_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      packPrice: (json['pack_price'] as num).toDouble(),
      simPrice: (json['sim_price'] as num).toDouble(),
      msisdnId: (json['msisdn_id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num).toDouble(),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'id': instance.id,
      'product_name': instance.productName,
      'product_id': instance.productId,
      'sim_type': instance.simType,
      'region_id': instance.regionId,
      'pack_code': instance.packCode,
      'sale_price': instance.salePrice,
      'quantity': instance.quantity,
      'pack_price': instance.packPrice,
      'sim_price': instance.simPrice,
      'msisdn_id': instance.msisdnId,
      'total_price': instance.totalPrice,
      'icon': instance.icon,
    };
