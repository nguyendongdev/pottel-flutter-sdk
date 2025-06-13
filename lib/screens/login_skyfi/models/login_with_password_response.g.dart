// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginWithPasswordResponseImpl _$$LoginWithPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginWithPasswordResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result: json['result'] == null
          ? null
          : LoginWithPasswordResult.fromJson(
              json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$LoginWithPasswordResponseImplToJson(
        _$LoginWithPasswordResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$LoginWithPasswordResultImpl _$$LoginWithPasswordResultImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginWithPasswordResultImpl(
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
      phone: json['phone'] as String,
      expiresAt: json['expires_at'] as String,
      refreshExpiresAt: json['refresh_expires_at'] as String,
    );

Map<String, dynamic> _$$LoginWithPasswordResultImplToJson(
        _$LoginWithPasswordResultImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'phone': instance.phone,
      'expires_at': instance.expiresAt,
      'refresh_expires_at': instance.refreshExpiresAt,
    };

_$LoginWithPasswordRequestImpl _$$LoginWithPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginWithPasswordRequestImpl(
      msisdn: json['msisdn'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginWithPasswordRequestImplToJson(
        _$LoginWithPasswordRequestImpl instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
      'password': instance.password,
    };
