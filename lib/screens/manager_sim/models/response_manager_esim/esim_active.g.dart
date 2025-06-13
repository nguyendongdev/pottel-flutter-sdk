// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esim_active.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EsimActive _$EsimActiveFromJson(Map<String, dynamic> json) => EsimActive(
      title: json['title'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ItemMyEsim.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EsimActiveToJson(EsimActive instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
    };
