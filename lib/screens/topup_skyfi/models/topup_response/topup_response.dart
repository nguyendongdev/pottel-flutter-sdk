import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'topup_response.freezed.dart';
part 'topup_response.g.dart';

@freezed
class TopupResponse with _$TopupResponse {
  factory TopupResponse({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<Result>? result,
    dynamic extra,
  }) = _TopupResponse;

  factory TopupResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupResponseFromJson(json);
}
