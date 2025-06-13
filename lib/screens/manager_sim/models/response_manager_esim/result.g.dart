// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultMyEsim _$ResultMyEsimFromJson(Map<String, dynamic> json) => ResultMyEsim(
      esimNotActive: json['esimNotActive'] == null
          ? null
          : EsimNotActive.fromJson(
              json['esimNotActive'] as Map<String, dynamic>),
      esimActive: json['esimActive'] == null
          ? null
          : EsimActive.fromJson(json['esimActive'] as Map<String, dynamic>),
      esimExpired: json['esimExpired'] == null
          ? null
          : EsimExpired.fromJson(json['esimExpired'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultMyEsimToJson(ResultMyEsim instance) =>
    <String, dynamic>{
      'esimNotActive': instance.esimNotActive,
      'esimActive': instance.esimActive,
      'esimExpired': instance.esimExpired,
    };
