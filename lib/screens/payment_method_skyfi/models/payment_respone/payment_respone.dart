import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'payment_respone.freezed.dart';
part 'payment_respone.g.dart';

@freezed
class PaymentRespone with _$PaymentRespone {
  factory PaymentRespone({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _PaymentRespone;

  factory PaymentRespone.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponeFromJson(json);
}
