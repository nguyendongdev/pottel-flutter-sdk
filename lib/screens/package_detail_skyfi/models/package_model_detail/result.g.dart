// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      cycle: json['cycle'] as String?,
      isMain: (json['is_main'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      brief: json['brief'] as String?,
      dataPerDay: (json['data_per_day'] as num?)?.toInt(),
      dataPerMonth: (json['data_per_month'] as num?)?.toInt(),
      isOutstanding: (json['is_outstanding'] as num?)?.toInt(),
      index: (json['index'] as num?)?.toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      arrRegCode: json['arr_reg_code'] as String?,
      onBuySim: (json['on_buy_sim'] as num?)?.toInt(),
      regCodeTkc: json['reg_code_tkc'] as String?,
      regCode0d: json['reg_code_0d'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isInternalPackage: (json['is_internal_package'] as num?)?.toInt(),
      freeCallMinute: (json['free_call_minute'] as num?)?.toInt(),
      freeSms: (json['free_sms'] as num?)?.toInt(),
      validityDay: (json['validity_day'] as num?)?.toInt(),
      discountPercent: (json['discount_percent'] as num?)?.toInt(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionDetail: (json['description_detail'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'cycle': instance.cycle,
      'is_main': instance.isMain,
      'price': instance.price,
      'brief': instance.brief,
      'data_per_day': instance.dataPerDay,
      'data_per_month': instance.dataPerMonth,
      'is_outstanding': instance.isOutstanding,
      'index': instance.index,
      'sale_price': instance.salePrice,
      'status': instance.status,
      'arr_reg_code': instance.arrRegCode,
      'on_buy_sim': instance.onBuySim,
      'reg_code_tkc': instance.regCodeTkc,
      'reg_code_0d': instance.regCode0d,
      'id': instance.id,
      'is_internal_package': instance.isInternalPackage,
      'free_call_minute': instance.freeCallMinute,
      'free_sms': instance.freeSms,
      'validity_day': instance.validityDay,
      'discount_percent': instance.discountPercent,
      'description': instance.description,
      'description_detail': instance.descriptionDetail,
    };
