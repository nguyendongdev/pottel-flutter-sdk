// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_sim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChooseSimImpl _$$ChooseSimImplFromJson(Map<String, dynamic> json) =>
    _$ChooseSimImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$ChooseSimImplToJson(_$ChooseSimImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
