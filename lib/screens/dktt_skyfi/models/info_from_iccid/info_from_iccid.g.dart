// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_from_iccid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfoFromIccidImpl _$$InfoFromIccidImplFromJson(Map<String, dynamic> json) =>
    _$InfoFromIccidImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$InfoFromIccidImplToJson(_$InfoFromIccidImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
