// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMyEsim _$DataMyEsimFromJson(Map<String, dynamic> json) => DataMyEsim(
      remaining: (json['remaining'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      expiredAt: json['expired_at'] as String?,
      isUnlimited: json['is_unlimited'] as bool?,
      status: json['status'] as String?,
      remainingVoice: (json['remaining_voice'] as num?)?.toInt(),
      remainingText: (json['remaining_text'] as num?)?.toInt(),
      totalVoice: (json['total_voice'] as num?)?.toInt(),
      totalText: (json['total_text'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataMyEsimToJson(DataMyEsim instance) =>
    <String, dynamic>{
      'remaining': instance.remaining,
      'total': instance.total,
      'expired_at': instance.expiredAt,
      'is_unlimited': instance.isUnlimited,
      'status': instance.status,
      'remaining_voice': instance.remainingVoice,
      'remaining_text': instance.remainingText,
      'total_voice': instance.totalVoice,
      'total_text': instance.totalText,
    };
