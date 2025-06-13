// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      msisdn: json['msisdn'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'],
      extra: json['extra'],
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$VerifyOtpRequestImpl _$$VerifyOtpRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpRequestImpl(
      msisdn: json['msisdn'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$VerifyOtpRequestImplToJson(
        _$VerifyOtpRequestImpl instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
      'otp': instance.otp,
    };

_$VerifyOtpResponseImpl _$$VerifyOtpResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : VerifyOtpResult.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$VerifyOtpResponseImplToJson(
        _$VerifyOtpResponseImpl instance) =>
    <String, dynamic>{
      if (instance.requestId case final value?) 'requestId': value,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      if (instance.result case final value?) 'result': value,
      if (instance.extra case final value?) 'extra': value,
    };

_$VerifyOtpResultImpl _$$VerifyOtpResultImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpResultImpl(
      token: json['token'] as String,
      phone: json['phone'] as String,
      isSetPassword: json['is_set_password'] as bool?,
    );

Map<String, dynamic> _$$VerifyOtpResultImplToJson(
        _$VerifyOtpResultImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
      'is_set_password': instance.isSetPassword,
    };
