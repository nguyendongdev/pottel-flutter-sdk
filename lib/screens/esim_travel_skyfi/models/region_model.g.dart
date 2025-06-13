// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      isoCode: json['iso_code'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'type': instance.type,
      'iso_code': instance.isoCode,
      'description': instance.description,
      'icon': instance.icon,
    };

_$RegionResponseImpl _$$RegionResponseImplFromJson(Map<String, dynamic> json) =>
    _$RegionResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$RegionResponseImplToJson(
        _$RegionResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
