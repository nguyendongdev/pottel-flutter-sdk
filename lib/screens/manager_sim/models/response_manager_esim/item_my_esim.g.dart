// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_my_esim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMyEsim _$ItemMyEsimFromJson(Map<String, dynamic> json) => ItemMyEsim(
      iccid: json['iccid'] as String?,
      status: json['status'] as String?,
      dataAmount: (json['data_amount'] as num?)?.toInt(),
      dataUnit: json['data_unit'] as String?,
      validityDays: (json['validity_days'] as num?)?.toInt(),
      qrcode: json['qrcode'] as String?,
      qrcodeUrl: json['qrcode_url'] as String?,
      regionId: (json['region_id'] as num?)?.toInt(),
      regionName: json['region_name'] as String?,
      providerName: json['provider_name'] as String?,
      data: json['data'] == null
          ? null
          : DataMyEsim.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemMyEsimToJson(ItemMyEsim instance) =>
    <String, dynamic>{
      'iccid': instance.iccid,
      'status': instance.status,
      'data_amount': instance.dataAmount,
      'data_unit': instance.dataUnit,
      'validity_days': instance.validityDays,
      'qrcode': instance.qrcode,
      'qrcode_url': instance.qrcodeUrl,
      'region_id': instance.regionId,
      'region_name': instance.regionName,
      'provider_name': instance.providerName,
      'data': instance.data,
    };
