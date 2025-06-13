// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_number_id_regis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNumberIdRegisImpl _$$GetNumberIdRegisImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNumberIdRegisImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$GetNumberIdRegisImplToJson(
        _$GetNumberIdRegisImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
