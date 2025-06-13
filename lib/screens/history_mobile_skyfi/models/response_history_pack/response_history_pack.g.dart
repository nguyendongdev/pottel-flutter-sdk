// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_history_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseHistoryPack _$ResponseHistoryPackFromJson(Map<String, dynamic> json) =>
    ResponseHistoryPack(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => PackageHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$ResponseHistoryPackToJson(
        ResponseHistoryPack instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
