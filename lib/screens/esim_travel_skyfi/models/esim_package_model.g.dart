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
      providerName: (json['countries_size'] as num).toInt(),
      countriesArray: (json['countries_array'] as List<dynamic>?)
          ?.map((e) => EsimRegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'countries_size': instance.providerName,
      'countries_array': instance.countriesArray,
      'quantity': instance.quantity,
    };

_$ImageEsimImpl _$$ImageEsimImplFromJson(Map<String, dynamic> json) =>
    _$ImageEsimImpl(
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageEsimImplToJson(_$ImageEsimImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$EsimRegionModelImpl _$$EsimRegionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EsimRegionModelImpl(
      countryCode: json['country_code'] as String,
      title: json['title'] as String,
      image: json['image'] == null
          ? null
          : ImageEsim.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EsimRegionModelImplToJson(
        _$EsimRegionModelImpl instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'title': instance.title,
      'image': instance.image,
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
