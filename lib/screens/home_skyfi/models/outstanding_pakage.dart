import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_pakage.freezed.dart';
part 'outstanding_pakage.g.dart';

@freezed
class OutStandingPackageResponse with _$OutStandingPackageResponse {
  const factory OutStandingPackageResponse({
    String? requestId,
    required int code,
    required String message,
    required int totalRecords,
    required List<PackageModel> result,
    dynamic extra,
  }) = _PackageResponse;

  factory OutStandingPackageResponse.fromJson(Map<String, dynamic> json) =>
      _$OutStandingPackageResponseFromJson(json);
}

@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String code,
    required String name,
    required List<String> description,
    required String cycle,
    @JsonKey(name: 'is_main') required int isMain,
    required double price,
    required String brief,
    @JsonKey(name: 'validity_day', defaultValue: 0) int? validityDay,
    @JsonKey(name: 'data_per_day') required double dataPerDay,
    @JsonKey(name: 'data_per_month') required double dataPerMonth,
    @JsonKey(name: 'is_outstanding') required int isOutstanding,
    @JsonKey(name: 'free_call_minute', defaultValue: 0) int? freeCallMinute,
    @JsonKey(name: 'free_sms', defaultValue: 0) required int? freeSms,
    @JsonKey(name: 'discount_percent', defaultValue: 0) double? discountPercent,
    required int index,
    @JsonKey(name: 'sale_price') required double salePrice,
    required int id,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}
