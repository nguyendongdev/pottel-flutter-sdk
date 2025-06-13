import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const factory RegionModel({
    required int id,
    required String code,
    required String name,
    required String type,
    @JsonKey(name: 'iso_code') String? isoCode,
    String? description,
    String? icon,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}

@freezed
class RegionResponse with _$RegionResponse {
  const factory RegionResponse({
    @JsonKey(name: 'requestId') String? requestId,
    required int code,
    required String message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    required List<RegionModel> result,
    dynamic extra,
  }) = _RegionResponse;

  factory RegionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionResponseFromJson(json);
}
