// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelDetailImpl _$$PackageModelDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageModelDetailImpl(
      requestId: json['requestId'],
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$PackageModelDetailImplToJson(
        _$PackageModelDetailImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };
