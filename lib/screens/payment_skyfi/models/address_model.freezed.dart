// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({String id, String name, String? parentId, int level});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? parentId, int level});
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? level = null,
  }) {
    return _then(_$AddressModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl(
      {required this.id, required this.name, this.parentId, this.level = 0});

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  @JsonKey()
  final int level;

  @override
  String toString() {
    return 'AddressModel(id: $id, name: $name, parentId: $parentId, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, parentId, level);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required final String id,
      required final String name,
      final String? parentId,
      final int level}) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get parentId;
  @override
  int get level;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedAddress _$SelectedAddressFromJson(Map<String, dynamic> json) {
  return _SelectedAddress.fromJson(json);
}

/// @nodoc
mixin _$SelectedAddress {
  AddressModel? get province => throw _privateConstructorUsedError;
  AddressModel? get district => throw _privateConstructorUsedError;
  AddressModel? get ward => throw _privateConstructorUsedError;

  /// Serializes this SelectedAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedAddressCopyWith<SelectedAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedAddressCopyWith<$Res> {
  factory $SelectedAddressCopyWith(
          SelectedAddress value, $Res Function(SelectedAddress) then) =
      _$SelectedAddressCopyWithImpl<$Res, SelectedAddress>;
  @useResult
  $Res call(
      {AddressModel? province, AddressModel? district, AddressModel? ward});

  $AddressModelCopyWith<$Res>? get province;
  $AddressModelCopyWith<$Res>? get district;
  $AddressModelCopyWith<$Res>? get ward;
}

/// @nodoc
class _$SelectedAddressCopyWithImpl<$Res, $Val extends SelectedAddress>
    implements $SelectedAddressCopyWith<$Res> {
  _$SelectedAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
  }) {
    return _then(_value.copyWith(
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ) as $Val);
  }

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get ward {
    if (_value.ward == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.ward!, (value) {
      return _then(_value.copyWith(ward: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelectedAddressImplCopyWith<$Res>
    implements $SelectedAddressCopyWith<$Res> {
  factory _$$SelectedAddressImplCopyWith(_$SelectedAddressImpl value,
          $Res Function(_$SelectedAddressImpl) then) =
      __$$SelectedAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressModel? province, AddressModel? district, AddressModel? ward});

  @override
  $AddressModelCopyWith<$Res>? get province;
  @override
  $AddressModelCopyWith<$Res>? get district;
  @override
  $AddressModelCopyWith<$Res>? get ward;
}

/// @nodoc
class __$$SelectedAddressImplCopyWithImpl<$Res>
    extends _$SelectedAddressCopyWithImpl<$Res, _$SelectedAddressImpl>
    implements _$$SelectedAddressImplCopyWith<$Res> {
  __$$SelectedAddressImplCopyWithImpl(
      _$SelectedAddressImpl _value, $Res Function(_$SelectedAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
  }) {
    return _then(_$SelectedAddressImpl(
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedAddressImpl implements _SelectedAddress {
  const _$SelectedAddressImpl({this.province, this.district, this.ward});

  factory _$SelectedAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedAddressImplFromJson(json);

  @override
  final AddressModel? province;
  @override
  final AddressModel? district;
  @override
  final AddressModel? ward;

  @override
  String toString() {
    return 'SelectedAddress(province: $province, district: $district, ward: $ward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedAddressImpl &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.ward, ward) || other.ward == ward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, province, district, ward);

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedAddressImplCopyWith<_$SelectedAddressImpl> get copyWith =>
      __$$SelectedAddressImplCopyWithImpl<_$SelectedAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedAddressImplToJson(
      this,
    );
  }
}

abstract class _SelectedAddress implements SelectedAddress {
  const factory _SelectedAddress(
      {final AddressModel? province,
      final AddressModel? district,
      final AddressModel? ward}) = _$SelectedAddressImpl;

  factory _SelectedAddress.fromJson(Map<String, dynamic> json) =
      _$SelectedAddressImpl.fromJson;

  @override
  AddressModel? get province;
  @override
  AddressModel? get district;
  @override
  AddressModel? get ward;

  /// Create a copy of SelectedAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedAddressImplCopyWith<_$SelectedAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
