// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_of_origin_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceOfOriginDetailImpl _$$PlaceOfOriginDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceOfOriginDetailImpl(
      address: json['address'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      fullAddress: json['full_address'] as String?,
      ward: json['ward'] == null
          ? null
          : Ward.fromJson(json['ward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceOfOriginDetailImplToJson(
        _$PlaceOfOriginDetailImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'full_address': instance.fullAddress,
      'ward': instance.ward,
    };
