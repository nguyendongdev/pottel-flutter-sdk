import 'package:freezed_annotation/freezed_annotation.dart';

part 'esim_package_model.freezed.dart';
part 'esim_package_model.g.dart';

@freezed
class EsimPackageModel with _$EsimPackageModel {
  const factory EsimPackageModel({
    required String name,
    @JsonKey(name: 'region_id') required int regionId,
    @JsonKey(name: 'selling_price') required double sellingPrice,
    required String currency,
    @JsonKey(name: 'data_amount') required double dataAmount,
    @JsonKey(name: 'data_unit') required String dataUnit,
    @JsonKey(name: 'validity_days') required int validityDays,
    @JsonKey(name: 'variant_id') required int variantId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'countries_size') required int providerName,
    @JsonKey(name: 'countries_array') List<EsimRegionModel>? countriesArray,
    @Default(0) int quantity,
  }) = _EsimPackageModel;

  factory EsimPackageModel.fromJson(Map<String, dynamic> json) =>
      _$EsimPackageModelFromJson(json);
}

@freezed
class ImageEsim with _$ImageEsim {
  const factory ImageEsim({
    required String url,
    required int width,
    required int height,
  }) = _ImageEsim;

  factory ImageEsim.fromJson(Map<String, dynamic> json) =>
      _$ImageEsimFromJson(json);
}

@freezed
class EsimRegionModel with _$EsimRegionModel {
  const factory EsimRegionModel({
    @JsonKey(name: 'code') required String countryCode,
    @JsonKey(name: 'name') required String title,
    @JsonKey(name: 'image') required String image,
  }) = _EsimRegionModel;

  factory EsimRegionModel.fromJson(Map<String, dynamic> json) =>
      _$EsimRegionModelFromJson(json);
}

@freezed
class EsimPackageResponse with _$EsimPackageResponse {
  const factory EsimPackageResponse({
    @JsonKey(name: 'requestId') String? requestId,
    required int code,
    required String message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    required List<EsimPackageModel> result,
    dynamic extra,
  }) = _EsimPackageResponse;

  factory EsimPackageResponse.fromJson(Map<String, dynamic> json) =>
      _$EsimPackageResponseFromJson(json);
}
