import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    String? code,
    String? name,
    String? cycle,
    @JsonKey(name: 'is_main') int? isMain,
    int? price,
    String? brief,
    @JsonKey(name: 'data_per_day') int? dataPerDay,
    @JsonKey(name: 'data_per_month') int? dataPerMonth,
    @JsonKey(name: 'is_outstanding') int? isOutstanding,
    int? index,
    @JsonKey(name: 'sale_price') int? salePrice,
    int? status,
    @JsonKey(name: 'arr_reg_code') String? arrRegCode,
    @JsonKey(name: 'on_buy_sim') int? onBuySim,
    @JsonKey(name: 'reg_code_tkc') String? regCodeTkc,
    @JsonKey(name: 'reg_code_0d') String? regCode0d,
    int? id,
    @JsonKey(name: 'is_internal_package') int? isInternalPackage,
    @JsonKey(name: 'free_call_minute') int? freeCallMinute,
    @JsonKey(name: 'free_sms') int? freeSms,
    @JsonKey(name: 'validity_day') int? validityDay,
    @JsonKey(name: 'discount_percent') int? discountPercent,
    List<String>? description,
    @JsonKey(name: 'description_detail') List<String>? descriptionDetail,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
