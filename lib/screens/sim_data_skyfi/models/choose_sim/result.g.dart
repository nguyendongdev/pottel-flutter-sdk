// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      msisdnId: (json['msisdn_id'] as num?)?.toInt(),
      msisdn: json['msisdn'] as String?,
      name: json['name'] as String?,
      basePrice: (json['base_price'] as num?)?.toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      variantId: (json['variant_id'] as num?)?.toInt(),
      usimPrice: (json['usim_price'] as num?)?.toInt(),
      esimPrice: (json['esim_price'] as num?)?.toInt(),
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'msisdn_id': instance.msisdnId,
      'msisdn': instance.msisdn,
      'name': instance.name,
      'base_price': instance.basePrice,
      'sale_price': instance.salePrice,
      'product_id': instance.productId,
      'variant_id': instance.variantId,
      'usim_price': instance.usimPrice,
      'esim_price': instance.esimPrice,
      'packages': instance.packages,
    };
