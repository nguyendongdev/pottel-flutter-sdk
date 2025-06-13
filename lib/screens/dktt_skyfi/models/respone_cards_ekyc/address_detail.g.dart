// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDetailImpl _$$AddressDetailImplFromJson(Map<String, dynamic> json) =>
    _$AddressDetailImpl(
      address: json['address'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : Ward.fromJson(json['ward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressDetailImplToJson(_$AddressDetailImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'ward': instance.ward,
    };
