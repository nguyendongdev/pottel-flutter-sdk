// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageHistory _$PackageHistoryFromJson(Map<String, dynamic> json) =>
    PackageHistory(
      id: (json['id'] as num?)?.toInt(),
      msisdn: json['msisdn'] as String?,
      packCode: json['pack_code'] as String?,
      price: (json['price'] as num?)?.toInt(),
      transactionDate: json['transaction_date'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PackageHistoryToJson(PackageHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msisdn': instance.msisdn,
      'pack_code': instance.packCode,
      'price': instance.price,
      'transaction_date': instance.transactionDate,
      'description': instance.description,
      'status': instance.status,
    };
