// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compatible_device_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompatibleDeviceResponse _$CompatibleDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return _CompatibleDeviceResponse.fromJson(json);
}

/// @nodoc
mixin _$CompatibleDeviceResponse {
  @JsonKey(name: 'requestId')
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  List<BrandDevices> get result => throw _privateConstructorUsedError;

  /// Serializes this CompatibleDeviceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompatibleDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompatibleDeviceResponseCopyWith<CompatibleDeviceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompatibleDeviceResponseCopyWith<$Res> {
  factory $CompatibleDeviceResponseCopyWith(CompatibleDeviceResponse value,
          $Res Function(CompatibleDeviceResponse) then) =
      _$CompatibleDeviceResponseCopyWithImpl<$Res, CompatibleDeviceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result') List<BrandDevices> result});
}

/// @nodoc
class _$CompatibleDeviceResponseCopyWithImpl<$Res,
        $Val extends CompatibleDeviceResponse>
    implements $CompatibleDeviceResponseCopyWith<$Res> {
  _$CompatibleDeviceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompatibleDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<BrandDevices>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompatibleDeviceResponseImplCopyWith<$Res>
    implements $CompatibleDeviceResponseCopyWith<$Res> {
  factory _$$CompatibleDeviceResponseImplCopyWith(
          _$CompatibleDeviceResponseImpl value,
          $Res Function(_$CompatibleDeviceResponseImpl) then) =
      __$$CompatibleDeviceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result') List<BrandDevices> result});
}

/// @nodoc
class __$$CompatibleDeviceResponseImplCopyWithImpl<$Res>
    extends _$CompatibleDeviceResponseCopyWithImpl<$Res,
        _$CompatibleDeviceResponseImpl>
    implements _$$CompatibleDeviceResponseImplCopyWith<$Res> {
  __$$CompatibleDeviceResponseImplCopyWithImpl(
      _$CompatibleDeviceResponseImpl _value,
      $Res Function(_$CompatibleDeviceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompatibleDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? result = null,
  }) {
    return _then(_$CompatibleDeviceResponseImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<BrandDevices>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompatibleDeviceResponseImpl implements _CompatibleDeviceResponse {
  const _$CompatibleDeviceResponseImpl(
      {@JsonKey(name: 'requestId') this.requestId,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'totalRecords') required this.totalRecords,
      @JsonKey(name: 'result') required final List<BrandDevices> result})
      : _result = result;

  factory _$CompatibleDeviceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompatibleDeviceResponseImplFromJson(json);

  @override
  @JsonKey(name: 'requestId')
  final String? requestId;
  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'totalRecords')
  final int totalRecords;
  final List<BrandDevices> _result;
  @override
  @JsonKey(name: 'result')
  List<BrandDevices> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'CompatibleDeviceResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompatibleDeviceResponseImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, code, message,
      totalRecords, const DeepCollectionEquality().hash(_result));

  /// Create a copy of CompatibleDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompatibleDeviceResponseImplCopyWith<_$CompatibleDeviceResponseImpl>
      get copyWith => __$$CompatibleDeviceResponseImplCopyWithImpl<
          _$CompatibleDeviceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompatibleDeviceResponseImplToJson(
      this,
    );
  }
}

abstract class _CompatibleDeviceResponse implements CompatibleDeviceResponse {
  const factory _CompatibleDeviceResponse(
          {@JsonKey(name: 'requestId') final String? requestId,
          @JsonKey(name: 'code') required final int code,
          @JsonKey(name: 'message') required final String message,
          @JsonKey(name: 'totalRecords') required final int totalRecords,
          @JsonKey(name: 'result') required final List<BrandDevices> result}) =
      _$CompatibleDeviceResponseImpl;

  factory _CompatibleDeviceResponse.fromJson(Map<String, dynamic> json) =
      _$CompatibleDeviceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'requestId')
  String? get requestId;
  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'totalRecords')
  int get totalRecords;
  @override
  @JsonKey(name: 'result')
  List<BrandDevices> get result;

  /// Create a copy of CompatibleDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompatibleDeviceResponseImplCopyWith<_$CompatibleDeviceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BrandDevices _$BrandDevicesFromJson(Map<String, dynamic> json) {
  return _BrandDevices.fromJson(json);
}

/// @nodoc
mixin _$BrandDevices {
  @JsonKey(name: 'brand')
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'devices')
  List<Device> get devices => throw _privateConstructorUsedError;

  /// Serializes this BrandDevices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandDevices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandDevicesCopyWith<BrandDevices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandDevicesCopyWith<$Res> {
  factory $BrandDevicesCopyWith(
          BrandDevices value, $Res Function(BrandDevices) then) =
      _$BrandDevicesCopyWithImpl<$Res, BrandDevices>;
  @useResult
  $Res call(
      {@JsonKey(name: 'brand') String brand,
      @JsonKey(name: 'devices') List<Device> devices});
}

/// @nodoc
class _$BrandDevicesCopyWithImpl<$Res, $Val extends BrandDevices>
    implements $BrandDevicesCopyWith<$Res> {
  _$BrandDevicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandDevices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandDevicesImplCopyWith<$Res>
    implements $BrandDevicesCopyWith<$Res> {
  factory _$$BrandDevicesImplCopyWith(
          _$BrandDevicesImpl value, $Res Function(_$BrandDevicesImpl) then) =
      __$$BrandDevicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'brand') String brand,
      @JsonKey(name: 'devices') List<Device> devices});
}

/// @nodoc
class __$$BrandDevicesImplCopyWithImpl<$Res>
    extends _$BrandDevicesCopyWithImpl<$Res, _$BrandDevicesImpl>
    implements _$$BrandDevicesImplCopyWith<$Res> {
  __$$BrandDevicesImplCopyWithImpl(
      _$BrandDevicesImpl _value, $Res Function(_$BrandDevicesImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandDevices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? devices = null,
  }) {
    return _then(_$BrandDevicesImpl(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandDevicesImpl implements _BrandDevices {
  const _$BrandDevicesImpl(
      {@JsonKey(name: 'brand') required this.brand,
      @JsonKey(name: 'devices') required final List<Device> devices})
      : _devices = devices;

  factory _$BrandDevicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandDevicesImplFromJson(json);

  @override
  @JsonKey(name: 'brand')
  final String brand;
  final List<Device> _devices;
  @override
  @JsonKey(name: 'devices')
  List<Device> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'BrandDevices(brand: $brand, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandDevicesImpl &&
            (identical(other.brand, brand) || other.brand == brand) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, brand, const DeepCollectionEquality().hash(_devices));

  /// Create a copy of BrandDevices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandDevicesImplCopyWith<_$BrandDevicesImpl> get copyWith =>
      __$$BrandDevicesImplCopyWithImpl<_$BrandDevicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandDevicesImplToJson(
      this,
    );
  }
}

abstract class _BrandDevices implements BrandDevices {
  const factory _BrandDevices(
          {@JsonKey(name: 'brand') required final String brand,
          @JsonKey(name: 'devices') required final List<Device> devices}) =
      _$BrandDevicesImpl;

  factory _BrandDevices.fromJson(Map<String, dynamic> json) =
      _$BrandDevicesImpl.fromJson;

  @override
  @JsonKey(name: 'brand')
  String get brand;
  @override
  @JsonKey(name: 'devices')
  List<Device> get devices;

  /// Create a copy of BrandDevices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandDevicesImplCopyWith<_$BrandDevicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand')
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'os')
  String get os => throw _privateConstructorUsedError;

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'brand') String brand,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'os') String os});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? name = null,
    Object? os = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'brand') String brand,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'os') String os});
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? name = null,
    Object? os = null,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl implements _Device {
  const _$DeviceImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'brand') required this.brand,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'os') required this.os});

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'brand')
  final String brand;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'os')
  final String os;

  @override
  String toString() {
    return 'Device(id: $id, brand: $brand, name: $name, os: $os)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.os, os) || other.os == os));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, brand, name, os);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'brand') required final String brand,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'os') required final String os}) = _$DeviceImpl;

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'brand')
  String get brand;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'os')
  String get os;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
