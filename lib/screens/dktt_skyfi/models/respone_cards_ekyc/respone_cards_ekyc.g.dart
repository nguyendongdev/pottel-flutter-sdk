// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_cards_ekyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponeCardsEkycImpl _$$ResponeCardsEkycImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponeCardsEkycImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$ResponeCardsEkycImplToJson(
        _$ResponeCardsEkycImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
