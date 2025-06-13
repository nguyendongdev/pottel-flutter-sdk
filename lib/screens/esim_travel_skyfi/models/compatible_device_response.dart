import 'package:freezed_annotation/freezed_annotation.dart';

part 'compatible_device_response.freezed.dart';
part 'compatible_device_response.g.dart';

@freezed
class CompatibleDeviceResponse with _$CompatibleDeviceResponse {
  const factory CompatibleDeviceResponse({
    @JsonKey(name: 'requestId') String? requestId,
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'totalRecords') required int totalRecords,
    @JsonKey(name: 'result') required List<BrandDevices> result,
  }) = _CompatibleDeviceResponse;

  factory CompatibleDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$CompatibleDeviceResponseFromJson(json);
}

@freezed
class BrandDevices with _$BrandDevices {
  const factory BrandDevices({
    @JsonKey(name: 'brand') required String brand,
    @JsonKey(name: 'devices') required List<Device> devices,
  }) = _BrandDevices;

  factory BrandDevices.fromJson(Map<String, dynamic> json) =>
      _$BrandDevicesFromJson(json);
}

@freezed
class Device with _$Device {
  const factory Device({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'brand') required String brand,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'os') required String os,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
