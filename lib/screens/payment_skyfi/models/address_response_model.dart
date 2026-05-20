import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_response_model.freezed.dart';
part 'address_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @JsonKey(name: 'requestId') String? requestId,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    @JsonKey(name: 'result') T? result,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
class CitiesResponse with _$CitiesResponse {
  const factory CitiesResponse({
    @JsonKey(name: 'cities') List<CityModel>? cities,
  }) = _CitiesResponse;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseFromJson(json);
}

@freezed
class DistrictsResponse with _$DistrictsResponse {
  const factory DistrictsResponse({
    @JsonKey(name: 'districts') List<DistrictModel>? districts,
  }) = _DistrictsResponse;

  factory DistrictsResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictsResponseFromJson(json);
}

@freezed
class WardsResponse with _$WardsResponse {
  const factory WardsResponse({
    @JsonKey(name: 'wards') List<WardModel>? wards,
  }) = _WardsResponse;

  factory WardsResponse.fromJson(Map<String, dynamic> json) =>
      _$WardsResponseFromJson(json);
}

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'index') int? index,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@freezed
class DistrictModel with _$DistrictModel {
  const factory DistrictModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'index') int? index,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
}

@freezed
class WardModel with _$WardModel {
  const factory WardModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'district_id') int? districtId,
  }) = _WardModel;

  factory WardModel.fromJson(Map<String, dynamic> json) =>
      _$WardModelFromJson(json);
}

@freezed
class NewCitiesResponse with _$NewCitiesResponse {
  const factory NewCitiesResponse({
    @JsonKey(name: 'cities') List<NewCityModel>? cities,
  }) = _NewCitiesResponse;

  factory NewCitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$NewCitiesResponseFromJson(json);
}

@freezed
class NewWardsResponse with _$NewWardsResponse {
  const factory NewWardsResponse({
    @JsonKey(name: 'wards') List<NewWardModel>? wards,
  }) = _NewWardsResponse;

  factory NewWardsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewWardsResponseFromJson(json);
}

@freezed
class NewCityModel with _$NewCityModel {
  const factory NewCityModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'vnpost_province_code') int? vnpostProvinceCode,
  }) = _NewCityModel;

  factory NewCityModel.fromJson(Map<String, dynamic> json) =>
      _$NewCityModelFromJson(json);
}

@freezed
class NewWardModel with _$NewWardModel {
  const factory NewWardModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'vnpost_commune_code') int? vnpostCommuneCode,
    @JsonKey(name: 'city_id') int? cityId,
  }) = _NewWardModel;

  factory NewWardModel.fromJson(Map<String, dynamic> json) =>
      _$NewWardModelFromJson(json);
}
