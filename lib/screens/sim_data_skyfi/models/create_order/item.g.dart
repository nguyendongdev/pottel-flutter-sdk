// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      productId: (json['product_id'] as num?)?.toInt(),
      variantId: (json['variant_id'] as num?)?.toInt(),
      msisdnId: (json['msisdn_id'] as num?)?.toInt(),
      packPrice: (json['pack_price'] as num?)?.toInt(),
      simPrice: (json['sim_price'] as num?)?.toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      simType: json['sim_type'] as String?,
      packCode: json['pack_code'] as String?,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'variant_id': instance.variantId,
      'msisdn_id': instance.msisdnId,
      'pack_price': instance.packPrice,
      'sim_price': instance.simPrice,
      'sale_price': instance.salePrice,
      'quantity': instance.quantity,
      'sim_type': instance.simType,
      'pack_code': instance.packCode,
    };
