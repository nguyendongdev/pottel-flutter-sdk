// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerResponseImpl _$$BannerResponseImplFromJson(Map<String, dynamic> json) =>
    _$BannerResponseImpl(
      requestId: json['requestId'],
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result:
          (json['result'] as List<dynamic>).map((e) => e as String).toList(),
      extra: json['extra'],
    );

Map<String, dynamic> _$$BannerResponseImplToJson(
        _$BannerResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
