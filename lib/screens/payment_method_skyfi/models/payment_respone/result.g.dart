// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      iframeUrl: json['iframeUrl'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      orderNumber: json['orderNumber'] as String?,
      orderCode: json['orderCode'] as String?,
      token: json['token'] as String?,
      baseUrl: json['baseUrl'] as String?,
      socketUrl: json['socketUrl'] as String?,
      requestId: json['requestId'] as String?,
      paymentId: json['paymentId'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      showPTTT: json['showPTTT'] as String?,
      expireIn: (json['expireIn'] as num?)?.toInt(),
      orderAmount: (json['orderAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'iframeUrl': instance.iframeUrl,
      'redirectUrl': instance.redirectUrl,
      'orderNumber': instance.orderNumber,
      'orderCode': instance.orderCode,
      'token': instance.token,
      'baseUrl': instance.baseUrl,
      'socketUrl': instance.socketUrl,
      'requestId': instance.requestId,
      'paymentId': instance.paymentId,
      'amount': instance.amount,
      'showPTTT': instance.showPTTT,
      'expireIn': instance.expireIn,
      'orderAmount': instance.orderAmount,
    };
