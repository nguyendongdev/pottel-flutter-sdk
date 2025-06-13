// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      name: json['name'] as String,
      code: json['code'] as String,
      dataPerDay: (json['data_per_day'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      salePrice: (json['sale_price'] as num).toDouble(),
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'data_per_day': instance.dataPerDay,
      'price': instance.price,
      'sale_price': instance.salePrice,
      'description': instance.description,
      'isSelected': instance.isSelected,
    };

_$PackageResponseImpl _$$PackageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageResponseImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PackageResponseImplToJson(
        _$PackageResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };
