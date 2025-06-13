// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esim_not_active.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EsimNotActive _$EsimNotActiveFromJson(Map<String, dynamic> json) =>
    EsimNotActive(
      title: json['title'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ItemMyEsim.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EsimNotActiveToJson(EsimNotActive instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list': instance.list,
    };
