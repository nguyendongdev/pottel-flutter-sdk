// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseImpl<T> _$$BaseResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BaseResponseImpl<T>(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
    );

Map<String, dynamic> _$$BaseResponseImplToJson<T>(
  _$BaseResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$CitiesResponseImpl _$$CitiesResponseImplFromJson(Map<String, dynamic> json) =>
    _$CitiesResponseImpl(
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CitiesResponseImplToJson(
        _$CitiesResponseImpl instance) =>
    <String, dynamic>{
      'cities': instance.cities,
    };

_$DistrictsResponseImpl _$$DistrictsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DistrictsResponseImpl(
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DistrictsResponseImplToJson(
        _$DistrictsResponseImpl instance) =>
    <String, dynamic>{
      'districts': instance.districts,
    };

_$WardsResponseImpl _$$WardsResponseImplFromJson(Map<String, dynamic> json) =>
    _$WardsResponseImpl(
      wards: (json['wards'] as List<dynamic>?)
          ?.map((e) => WardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WardsResponseImplToJson(_$WardsResponseImpl instance) =>
    <String, dynamic>{
      'wards': instance.wards,
    };

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      index: (json['index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'index': instance.index,
    };

_$DistrictModelImpl _$$DistrictModelImplFromJson(Map<String, dynamic> json) =>
    _$DistrictModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      index: (json['index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DistrictModelImplToJson(_$DistrictModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_id': instance.cityId,
      'index': instance.index,
    };

_$WardModelImpl _$$WardModelImplFromJson(Map<String, dynamic> json) =>
    _$WardModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      districtId: (json['district_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WardModelImplToJson(_$WardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'district_id': instance.districtId,
    };

_$NewCitiesResponseImpl _$$NewCitiesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewCitiesResponseImpl(
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => NewCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewCitiesResponseImplToJson(
        _$NewCitiesResponseImpl instance) =>
    <String, dynamic>{
      'cities': instance.cities,
    };

_$NewWardsResponseImpl _$$NewWardsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewWardsResponseImpl(
      wards: (json['wards'] as List<dynamic>?)
          ?.map((e) => NewWardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewWardsResponseImplToJson(
        _$NewWardsResponseImpl instance) =>
    <String, dynamic>{
      'wards': instance.wards,
    };

_$NewCityModelImpl _$$NewCityModelImplFromJson(Map<String, dynamic> json) =>
    _$NewCityModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      vnpostProvinceCode: (json['vnpost_province_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NewCityModelImplToJson(_$NewCityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vnpost_province_code': instance.vnpostProvinceCode,
    };

_$NewWardModelImpl _$$NewWardModelImplFromJson(Map<String, dynamic> json) =>
    _$NewWardModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      vnpostCommuneCode: (json['vnpost_commune_code'] as num?)?.toInt(),
      cityId: (json['city_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NewWardModelImplToJson(_$NewWardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vnpost_commune_code': instance.vnpostCommuneCode,
      'city_id': instance.cityId,
    };
