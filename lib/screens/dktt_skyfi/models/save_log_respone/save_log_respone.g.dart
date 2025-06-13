// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_log_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveLogResponeImpl _$$SaveLogResponeImplFromJson(Map<String, dynamic> json) =>
    _$SaveLogResponeImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$SaveLogResponeImplToJson(
        _$SaveLogResponeImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
