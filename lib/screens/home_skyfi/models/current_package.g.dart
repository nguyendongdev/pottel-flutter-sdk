// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentPackageResponseImpl _$$CurrentPackageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentPackageResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => CurrentPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$CurrentPackageResponseImplToJson(
        _$CurrentPackageResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$CurrentPackageImpl _$$CurrentPackageImplFromJson(Map<String, dynamic> json) =>
    _$CurrentPackageImpl(
      packageName: json['packageName'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      remainData: json['remainData'] as String?,
      totalData: json['totalData'] as String?,
      remainVoice: json['remainVoice'] as String?,
      totalVoice: json['totalVoice'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      cycle: json['cycle'] as String?,
      remainSms: json['remainSms'] as String?,
      totalSms: json['totalSms'] as String?,
      isMain: (json['is_main'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      brief: json['brief'] as String?,
      dataPerDay: (json['data_per_day'] as num?)?.toInt(),
      dataPerMonth: (json['data_per_month'] as num?)?.toInt(),
      index: (json['index'] as num?)?.toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      arrRegCode: json['arr_reg_code'] as String?,
      onBuySim: (json['on_buy_sim'] as num?)?.toInt(),
      regCodeTkc: json['reg_code_tkc'] as String?,
      regCode0D: json['reg_code_0d'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isInternalPackage: (json['is_internal_package'] as num?)?.toInt(),
      freeCallMinute: (json['free_call_minute'] as num?)?.toInt(),
      freeSms: (json['free_sms'] as num?)?.toInt(),
      validityDay: (json['validity_day'] as num?)?.toInt(),
      isOutstanding: (json['is_outstanding'] as num?)?.toInt(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionDetail: (json['description_detail'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CurrentPackageImplToJson(
        _$CurrentPackageImpl instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'remainData': instance.remainData,
      'totalData': instance.totalData,
      'remainVoice': instance.remainVoice,
      'totalVoice': instance.totalVoice,
      'code': instance.code,
      'name': instance.name,
      'cycle': instance.cycle,
      'remainSms': instance.remainSms,
      'totalSms': instance.totalSms,
      'is_main': instance.isMain,
      'price': instance.price,
      'brief': instance.brief,
      'data_per_day': instance.dataPerDay,
      'data_per_month': instance.dataPerMonth,
      'index': instance.index,
      'sale_price': instance.salePrice,
      'status': instance.status,
      'arr_reg_code': instance.arrRegCode,
      'on_buy_sim': instance.onBuySim,
      'reg_code_tkc': instance.regCodeTkc,
      'reg_code_0d': instance.regCode0D,
      'id': instance.id,
      'is_internal_package': instance.isInternalPackage,
      'free_call_minute': instance.freeCallMinute,
      'free_sms': instance.freeSms,
      'validity_day': instance.validityDay,
      'is_outstanding': instance.isOutstanding,
      'description': instance.description,
      'description_detail': instance.descriptionDetail,
    };
