// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_sims.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParamsSimsImpl _$$ParamsSimsImplFromJson(Map<String, dynamic> json) =>
    _$ParamsSimsImpl(
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ParamsSimsImplToJson(_$ParamsSimsImpl instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
