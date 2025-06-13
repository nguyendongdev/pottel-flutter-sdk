// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sims.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSimsImpl _$$ListSimsImplFromJson(Map<String, dynamic> json) =>
    _$ListSimsImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$ListSimsImplToJson(_$ListSimsImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
