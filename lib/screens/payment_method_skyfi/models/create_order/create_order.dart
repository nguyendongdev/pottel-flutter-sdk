import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'create_order.freezed.dart';
part 'create_order.g.dart';

@freezed
class CreateOrder with _$CreateOrder {
  factory CreateOrder({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _CreateOrder;

  factory CreateOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderFromJson(json);
}
