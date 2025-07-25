// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatible_device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompatibleDeviceResponseImpl _$$CompatibleDeviceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompatibleDeviceResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      totalRecords: (json['totalRecords'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => BrandDevices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompatibleDeviceResponseImplToJson(
        _$CompatibleDeviceResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
    };

_$BrandDevicesImpl _$$BrandDevicesImplFromJson(Map<String, dynamic> json) =>
    _$BrandDevicesImpl(
      brand: json['brand'] as String,
      devices: (json['devices'] as List<dynamic>)
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      noteVi: json['note_vi'] as String?,
    );

Map<String, dynamic> _$$BrandDevicesImplToJson(_$BrandDevicesImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'devices': instance.devices,
      'note': instance.note,
      'note_vi': instance.noteVi,
    };

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      name: json['name'] as String,
      os: json['os'] as String,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'os': instance.os,
    };
