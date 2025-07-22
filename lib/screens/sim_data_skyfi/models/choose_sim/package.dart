import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
class Package with _$Package {
  factory Package({
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
    @JsonKey(name: 'is_default') int? isDefault,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
