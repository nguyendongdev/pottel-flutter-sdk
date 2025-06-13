// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopupResponseImpl _$$TopupResponseImplFromJson(Map<String, dynamic> json) =>
    _$TopupResponseImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$TopupResponseImplToJson(_$TopupResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
