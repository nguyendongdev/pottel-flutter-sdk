// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esim_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EsimPackageModelImpl _$$EsimPackageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EsimPackageModelImpl(
      name: json['name'] as String,
      regionId: (json['region_id'] as num).toInt(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
      currency: json['currency'] as String,
      dataAmount: (json['data_amount'] as num).toDouble(),
      dataUnit: json['data_unit'] as String,
      validityDays: (json['validity_days'] as num).toInt(),
      variantId: (json['variant_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EsimPackageModelImplToJson(
        _$EsimPackageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region_id': instance.regionId,
      'selling_price': instance.sellingPrice,
      'currency': instance.currency,
      'data_amount': instance.dataAmount,
      'data_unit': instance.dataUnit,
      'validity_days': instance.validityDays,
      'variant_id': instance.variantId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };

_$EsimPackageResponseImpl _$$EsimPackageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EsimPackageResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => EsimPackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$EsimPackageResponseImplToJson(
        _$EsimPackageResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
