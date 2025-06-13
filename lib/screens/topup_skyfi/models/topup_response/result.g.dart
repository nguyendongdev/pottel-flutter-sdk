// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      id: (json['id'] as num?)?.toInt(),
      value: (json['value'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      networkId: (json['network_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'status': instance.status,
      'network_id': instance.networkId,
    };
