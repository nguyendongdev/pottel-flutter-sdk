import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user.freezed.dart';
part 'login_user.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String msisdn,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'requestId') String? requestId,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    @JsonKey(name: 'result') dynamic result,
    @JsonKey(name: 'extra') dynamic extra,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String msisdn,
    required String otp,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);
}

@freezed
class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    @JsonKey(name: 'requestId', includeIfNull: false) String? requestId,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    @JsonKey(name: 'result', includeIfNull: false) VerifyOtpResult? result,
    @JsonKey(name: 'extra', includeIfNull: false) dynamic extra,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
}

@freezed
class VerifyOtpResult with _$VerifyOtpResult {
  const factory VerifyOtpResult({
    required String token,
    required String phone,
    @JsonKey(name: 'is_set_password') bool? isSetPassword,
  }) = _VerifyOtpResult;

  factory VerifyOtpResult.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResultFromJson(json);
}
