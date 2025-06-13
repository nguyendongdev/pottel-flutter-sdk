// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_error_handle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CodeErrorHandleImpl _$$CodeErrorHandleImplFromJson(
        Map<String, dynamic> json) =>
    _$CodeErrorHandleImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'],
      extra: json['extra'],
    );

Map<String, dynamic> _$$CodeErrorHandleImplToJson(
        _$CodeErrorHandleImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
