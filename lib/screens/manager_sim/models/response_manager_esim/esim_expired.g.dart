// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esim_expired.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EsimExpired _$EsimExpiredFromJson(Map<String, dynamic> json) => EsimExpired(
      title: json['title'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ItemMyEsim.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EsimExpiredToJson(EsimExpired instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
    };
