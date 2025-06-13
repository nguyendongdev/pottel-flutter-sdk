import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'order_topup_response.freezed.dart';
part 'order_topup_response.g.dart';

@freezed
class OrderTopupResponse with _$OrderTopupResponse {
  factory OrderTopupResponse({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _OrderTopupResponse;

  factory OrderTopupResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderTopupResponseFromJson(json);
}
