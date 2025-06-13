// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_history_toup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseHistoryToup _$ResponseHistoryToupFromJson(Map<String, dynamic> json) =>
    ResponseHistoryToup(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => TopUpHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$ResponseHistoryToupToJson(
        ResponseHistoryToup instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
