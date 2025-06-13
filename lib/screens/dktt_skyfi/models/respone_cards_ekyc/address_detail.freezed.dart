// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressDetail _$AddressDetailFromJson(Map<String, dynamic> json) {
  return _AddressDetail.fromJson(json);
}

/// @nodoc
mixin _$AddressDetail {
  String? get address => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  Ward? get ward => throw _privateConstructorUsedError;

  /// Serializes this AddressDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressDetailCopyWith<AddressDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailCopyWith<$Res> {
  factory $AddressDetailCopyWith(
          AddressDetail value, $Res Function(AddressDetail) then) =
      _$AddressDetailCopyWithImpl<$Res, AddressDetail>;
  @useResult
  $Res call({String? address, City? city, District? district, Ward? ward});

  $CityCopyWith<$Res>? get city;
  $DistrictCopyWith<$Res>? get district;
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class _$AddressDetailCopyWithImpl<$Res, $Val extends AddressDetail>
    implements $AddressDetailCopyWith<$Res> {
  _$AddressDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? ward = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
    ) as $Val);
  }

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WardCopyWith<$Res>? get ward {
    if (_value.ward == null) {
      return null;
    }

    return $WardCopyWith<$Res>(_value.ward!, (value) {
      return _then(_value.copyWith(ward: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressDetailImplCopyWith<$Res>
    implements $AddressDetailCopyWith<$Res> {
  factory _$$AddressDetailImplCopyWith(
          _$AddressDetailImpl value, $Res Function(_$AddressDetailImpl) then) =
      __$$AddressDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? address, City? city, District? district, Ward? ward});

  @override
  $CityCopyWith<$Res>? get city;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class __$$AddressDetailImplCopyWithImpl<$Res>
    extends _$AddressDetailCopyWithImpl<$Res, _$AddressDetailImpl>
    implements _$$AddressDetailImplCopyWith<$Res> {
  __$$AddressDetailImplCopyWithImpl(
      _$AddressDetailImpl _value, $Res Function(_$AddressDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? ward = freezed,
  }) {
    return _then(_$AddressDetailImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDetailImpl implements _AddressDetail {
  _$AddressDetailImpl({this.address, this.city, this.district, this.ward});

  factory _$AddressDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDetailImplFromJson(json);

  @override
  final String? address;
  @override
  final City? city;
  @override
  final District? district;
  @override
  final Ward? ward;

  @override
  String toString() {
    return 'AddressDetail(address: $address, city: $city, district: $district, ward: $ward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDetailImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.ward, ward) || other.ward == ward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, city, district, ward);

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDetailImplCopyWith<_$AddressDetailImpl> get copyWith =>
      __$$AddressDetailImplCopyWithImpl<_$AddressDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDetailImplToJson(
      this,
    );
  }
}

abstract class _AddressDetail implements AddressDetail {
  factory _AddressDetail(
      {final String? address,
      final City? city,
      final District? district,
      final Ward? ward}) = _$AddressDetailImpl;

  factory _AddressDetail.fromJson(Map<String, dynamic> json) =
      _$AddressDetailImpl.fromJson;

  @override
  String? get address;
  @override
  City? get city;
  @override
  District? get district;
  @override
  Ward? get ward;

  /// Create a copy of AddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDetailImplCopyWith<_$AddressDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
