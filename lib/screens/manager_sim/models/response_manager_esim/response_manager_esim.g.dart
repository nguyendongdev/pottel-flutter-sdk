// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_manager_esim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseManagerEsim _$ResponseManagerEsimFromJson(Map<String, dynamic> json) =>
    ResponseManagerEsim(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : ResultMyEsim.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$ResponseManagerEsimToJson(
        ResponseManagerEsim instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
