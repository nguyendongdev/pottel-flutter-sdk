// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_add_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAddData _$ResponseAddDataFromJson(Map<String, dynamic> json) =>
    ResponseAddData(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : ResultAddData.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$ResponseAddDataToJson(ResponseAddData instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
