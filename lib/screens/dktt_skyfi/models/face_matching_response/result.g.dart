// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      faceMatch: json['face_match'] as String?,
      faceScore: (json['face_score'] as num?)?.toDouble(),
      threshold: json['threshold'] as String?,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'face_match': instance.faceMatch,
      'face_score': instance.faceScore,
      'threshold': instance.threshold,
    };
