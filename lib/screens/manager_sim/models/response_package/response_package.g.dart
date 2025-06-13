// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePackage _$ResponsePackageFromJson(Map<String, dynamic> json) =>
    ResponsePackage(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ResultPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$ResponsePackageToJson(ResponsePackage instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
