// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckUserPasswordResponseImpl _$$CheckUserPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckUserPasswordResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result: json['result'] == null
          ? null
          : CheckUserPasswordResult.fromJson(
              json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$CheckUserPasswordResponseImplToJson(
        _$CheckUserPasswordResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$CheckUserPasswordResultImpl _$$CheckUserPasswordResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckUserPasswordResultImpl(
      isSetPassword: json['is_set_password'] as bool,
    );

Map<String, dynamic> _$$CheckUserPasswordResultImplToJson(
        _$CheckUserPasswordResultImpl instance) =>
    <String, dynamic>{
      'is_set_password': instance.isSetPassword,
    };

_$CheckUserPasswordRequestImpl _$$CheckUserPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckUserPasswordRequestImpl(
      msisdn: json['msisdn'] as String,
    );

Map<String, dynamic> _$$CheckUserPasswordRequestImplToJson(
        _$CheckUserPasswordRequestImpl instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
    };
