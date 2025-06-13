import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_password_response.freezed.dart';
part 'login_with_password_response.g.dart';

@freezed
class LoginWithPasswordResponse with _$LoginWithPasswordResponse {
  const factory LoginWithPasswordResponse({
    @JsonKey(name: 'requestId', nullable: true) String? requestId,
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'totalRecords') required int totalRecords,
    @JsonKey(name: 'result', nullable: true) LoginWithPasswordResult? result,
    @JsonKey(name: 'extra', nullable: true) dynamic extra,
  }) = _LoginWithPasswordResponse;

  factory LoginWithPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginWithPasswordResponseFromJson(json);
}

@freezed
class LoginWithPasswordResult with _$LoginWithPasswordResult {
  const factory LoginWithPasswordResult({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'refresh_expires_at') required String refreshExpiresAt,
  }) = _LoginWithPasswordResult;

  factory LoginWithPasswordResult.fromJson(Map<String, dynamic> json) =>
      _$LoginWithPasswordResultFromJson(json);
}

@freezed
class LoginWithPasswordRequest with _$LoginWithPasswordRequest {
  const factory LoginWithPasswordRequest({
    @JsonKey(name: 'msisdn') required String msisdn,
    @JsonKey(name: 'password') required String password,
  }) = _LoginWithPasswordRequest;

  factory LoginWithPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginWithPasswordRequestFromJson(json);
}
