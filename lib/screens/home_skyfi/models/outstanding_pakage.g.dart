// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_pakage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageResponseImpl _$$PackageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$PackageResponseImplToJson(
        _$PackageResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cycle: json['cycle'] as String,
      isMain: (json['is_main'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      brief: json['brief'] as String,
      validityDay: (json['validity_day'] as num?)?.toInt() ?? 0,
      dataPerDay: (json['data_per_day'] as num).toDouble(),
      dataPerMonth: (json['data_per_month'] as num).toDouble(),
      isOutstanding: (json['is_outstanding'] as num).toInt(),
      freeCallMinute: (json['free_call_minute'] as num?)?.toInt() ?? 0,
      freeSms: (json['free_sms'] as num?)?.toInt() ?? 0,
      discountPercent: (json['discount_percent'] as num?)?.toDouble() ?? 0,
      index: (json['index'] as num).toInt(),
      salePrice: (json['sale_price'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'cycle': instance.cycle,
      'is_main': instance.isMain,
      'price': instance.price,
      'brief': instance.brief,
      'validity_day': instance.validityDay,
      'data_per_day': instance.dataPerDay,
      'data_per_month': instance.dataPerMonth,
      'is_outstanding': instance.isOutstanding,
      'free_call_minute': instance.freeCallMinute,
      'free_sms': instance.freeSms,
      'discount_percent': instance.discountPercent,
      'index': instance.index,
      'sale_price': instance.salePrice,
      'id': instance.id,
    };
