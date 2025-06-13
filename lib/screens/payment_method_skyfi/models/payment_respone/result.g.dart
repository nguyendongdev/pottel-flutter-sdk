// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      redirectUrl: json['redirectUrl'] as String?,
      orderNumber: json['orderNumber'] as String?,
      orderAmount: (json['orderAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'orderNumber': instance.orderNumber,
      'orderAmount': instance.orderAmount,
    };
