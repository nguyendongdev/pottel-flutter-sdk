// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_matching_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaceMatchingResponseImpl _$$FaceMatchingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FaceMatchingResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$FaceMatchingResponseImplToJson(
        _$FaceMatchingResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
