import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_response.freezed.dart';
part 'update_password_response.g.dart';

@freezed
class UpdatePasswordResponse with _$UpdatePasswordResponse {
  const factory UpdatePasswordResponse({
    String? requestId,
    required int code,
    required String message,
    required int totalRecords,
    dynamic result,
    dynamic extra,
  }) = _UpdatePasswordResponse;

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);
}

@freezed
class UpdatePasswordRequest with _$UpdatePasswordRequest {
  const factory UpdatePasswordRequest({
    required String password,
  }) = _UpdatePasswordRequest;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);
}
