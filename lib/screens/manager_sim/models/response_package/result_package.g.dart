// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultPackage _$ResultPackageFromJson(Map<String, dynamic> json) =>
    ResultPackage(
      id: json['id'] as String?,
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      isUnlimited: json['is_unlimited'] as bool?,
      title: json['title'] as String?,
      data: json['data'] as String?,
      shortInfo: json['short_info'],
      voice: json['voice'],
      text: json['text'],
      netPrice: (json['net_price'] as num?)?.toInt(),
      name: json['name'] as String?,
      sellingPrice: (json['selling_price'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultPackageToJson(ResultPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
      'amount': instance.amount,
      'day': instance.day,
      'is_unlimited': instance.isUnlimited,
      'title': instance.title,
      'data': instance.data,
      'short_info': instance.shortInfo,
      'voice': instance.voice,
      'text': instance.text,
      'net_price': instance.netPrice,
      'name': instance.name,
      'selling_price': instance.sellingPrice,
      'currency': instance.currency,
      'product_id': instance.productId,
    };
