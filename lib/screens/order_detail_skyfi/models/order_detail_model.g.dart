// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailModelImpl(
      orderCode: json['order_code'] as String,
      createdAt: json['created_at'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalUsim: (json['total_usim'] as num).toInt(),
      totalEsim: (json['total_esim'] as num).toInt(),
      totalEsimTravel: (json['total_esim_travel'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderDetailModelImplToJson(
        _$OrderDetailModelImpl instance) =>
    <String, dynamic>{
      'order_code': instance.orderCode,
      'created_at': instance.createdAt,
      'total_amount': instance.totalAmount,
      'total_usim': instance.totalUsim,
      'total_esim': instance.totalEsim,
      'total_esim_travel': instance.totalEsimTravel,
    };

_$OrderDetailResponseImpl _$$OrderDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result:
          OrderDetailResult.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$OrderDetailResponseImplToJson(
        _$OrderDetailResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$OrderDetailResultImpl _$$OrderDetailResultImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailResultImpl(
      order: OrderDetailModel.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderDetailResultImplToJson(
        _$OrderDetailResultImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
    };
