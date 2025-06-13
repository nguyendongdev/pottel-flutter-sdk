// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      districtCode: json['district_code'] as String?,
      districtName: json['district_name'] as String?,
      originalDistrict: json['original_district'] as String?,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'district_code': instance.districtCode,
      'district_name': instance.districtName,
      'original_district': instance.originalDistrict,
    };
