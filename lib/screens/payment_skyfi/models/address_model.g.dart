// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      level: (json['level'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'level': instance.level,
    };

_$SelectedAddressImpl _$$SelectedAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedAddressImpl(
      province: json['province'] == null
          ? null
          : AddressModel.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : AddressModel.fromJson(json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : AddressModel.fromJson(json['ward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SelectedAddressImplToJson(
        _$SelectedAddressImpl instance) =>
    <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
    };
