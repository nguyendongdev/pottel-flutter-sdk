import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_package.freezed.dart';
part 'current_package.g.dart';

@freezed
class CurrentPackageResponse with _$CurrentPackageResponse {
  const factory CurrentPackageResponse({
    String? requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<CurrentPackage>? result,
    dynamic extra,
  }) = _CurrentPackageResponse;

  factory CurrentPackageResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentPackageResponseFromJson(json);
}

@freezed
class CurrentPackage with _$CurrentPackage {
  const factory CurrentPackage({
    String? packageName,
    String? fromDate,
    String? toDate,
    String? remainData,
    String? totalData,
    String? remainVoice,
    String? totalVoice,
    String? code,
    String? name,
    String? cycle,
    String? remainSms,
    String? totalSms,
    @JsonKey(name: "is_main") int? isMain,
    int? price,
    String? brief,
    @JsonKey(name: "data_per_day") int? dataPerDay,
    @JsonKey(name: "data_per_month") int? dataPerMonth,
    int? index,
    @JsonKey(name: "sale_price") int? salePrice,
    int? status,
    @JsonKey(name: "arr_reg_code") String? arrRegCode,
    @JsonKey(name: "on_buy_sim") int? onBuySim,
    @JsonKey(name: "reg_code_tkc") String? regCodeTkc,
    @JsonKey(name: "reg_code_0d") String? regCode0D,
    int? id,
    @JsonKey(name: "is_internal_package") int? isInternalPackage,
    @JsonKey(name: "free_call_minute") int? freeCallMinute,
    @JsonKey(name: "free_sms") int? freeSms,
    @JsonKey(name: "validity_day") int? validityDay,
    @JsonKey(name: 'is_outstanding') int? isOutstanding,
    List<String>? description,
    @JsonKey(name: 'description_detail') List<String>? descriptionDetail,
  }) = _CurrentPackage;

  factory CurrentPackage.fromJson(Map<String, dynamic> json) =>
      _$CurrentPackageFromJson(json);
}
