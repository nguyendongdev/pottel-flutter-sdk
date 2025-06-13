import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_user_password_response.freezed.dart';
part 'check_user_password_response.g.dart';

@freezed
class CheckUserPasswordResponse with _$CheckUserPasswordResponse {
  const factory CheckUserPasswordResponse({
    @JsonKey(name: 'requestId') String? requestId,
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'totalRecords') required int totalRecords,
    @JsonKey(name: 'result') required CheckUserPasswordResult? result,
    @JsonKey(name: 'extra') dynamic extra,
  }) = _CheckUserPasswordResponse;

  factory CheckUserPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckUserPasswordResponseFromJson(json);
}

@freezed
class CheckUserPasswordResult with _$CheckUserPasswordResult {
  const factory CheckUserPasswordResult({
    @JsonKey(name: 'is_set_password') required bool isSetPassword,
  }) = _CheckUserPasswordResult;

  factory CheckUserPasswordResult.fromJson(Map<String, dynamic> json) =>
      _$CheckUserPasswordResultFromJson(json);
}

@freezed
class CheckUserPasswordRequest with _$CheckUserPasswordRequest {
  const factory CheckUserPasswordRequest({
    @JsonKey(name: 'msisdn') required String msisdn,
  }) = _CheckUserPasswordRequest;

  factory CheckUserPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckUserPasswordRequestFromJson(json);
}
