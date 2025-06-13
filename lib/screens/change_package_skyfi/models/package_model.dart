import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_model.freezed.dart';
part 'package_model.g.dart';

@freezed
class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String name,
    required String code,
    @JsonKey(name: 'data_per_day') required double dataPerDay,
    required double price,
    @JsonKey(name: 'sale_price') required double salePrice,
    required List<String> description,
    @Default(false) bool isSelected,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}

@freezed
class PackageResponse with _$PackageResponse {
  const factory PackageResponse({
    required int code,
    required String message,
    required List<PackageModel> result,
  }) = _PackageResponse;

  factory PackageResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageResponseFromJson(json);
}
