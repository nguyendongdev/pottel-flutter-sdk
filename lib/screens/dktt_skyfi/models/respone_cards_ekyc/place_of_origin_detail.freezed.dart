// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_of_origin_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceOfOriginDetail _$PlaceOfOriginDetailFromJson(Map<String, dynamic> json) {
  return _PlaceOfOriginDetail.fromJson(json);
}

/// @nodoc
mixin _$PlaceOfOriginDetail {
  String? get address => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  String? get fullAddress => throw _privateConstructorUsedError;
  Ward? get ward => throw _privateConstructorUsedError;

  /// Serializes this PlaceOfOriginDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceOfOriginDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceOfOriginDetailCopyWith<PlaceOfOriginDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceOfOriginDetailCopyWith<$Res> {
  factory $PlaceOfOriginDetailCopyWith(
          PlaceOfOriginDetail value, $Res Function(PlaceOfOriginDetail) then) =
      _$PlaceOfOriginDetailCopyWithImpl<$Res, PlaceOfOriginDetail>;
  @useResult
  $Res call(
      {String? address,
      City? city,
      District? district,
      @JsonKey(name: 'full_address') String? fullAddress,
      Ward? ward});

  $CityCopyWith<$Res>? get city;
  $DistrictCopyWith<$Res>? get district;
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class _$PlaceOfOriginDetailCopyWithImpl<$Res, $Val extends PlaceOfOriginDetail>
    implements $PlaceOfOriginDetailCopyWith<$Res> {
  _$PlaceOfOriginDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceOfOriginDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? fullAddress = freezed,
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
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
    ) as $Val);
  }

  /// Create a copy of PlaceOfOriginDetail
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

  /// Create a copy of PlaceOfOriginDetail
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

  /// Create a copy of PlaceOfOriginDetail
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
abstract class _$$PlaceOfOriginDetailImplCopyWith<$Res>
    implements $PlaceOfOriginDetailCopyWith<$Res> {
  factory _$$PlaceOfOriginDetailImplCopyWith(_$PlaceOfOriginDetailImpl value,
          $Res Function(_$PlaceOfOriginDetailImpl) then) =
      __$$PlaceOfOriginDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? address,
      City? city,
      District? district,
      @JsonKey(name: 'full_address') String? fullAddress,
      Ward? ward});

  @override
  $CityCopyWith<$Res>? get city;
  @override
  $DistrictCopyWith<$Res>? get district;
  @override
  $WardCopyWith<$Res>? get ward;
}

/// @nodoc
class __$$PlaceOfOriginDetailImplCopyWithImpl<$Res>
    extends _$PlaceOfOriginDetailCopyWithImpl<$Res, _$PlaceOfOriginDetailImpl>
    implements _$$PlaceOfOriginDetailImplCopyWith<$Res> {
  __$$PlaceOfOriginDetailImplCopyWithImpl(_$PlaceOfOriginDetailImpl _value,
      $Res Function(_$PlaceOfOriginDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceOfOriginDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? fullAddress = freezed,
    Object? ward = freezed,
  }) {
    return _then(_$PlaceOfOriginDetailImpl(
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
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as Ward?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceOfOriginDetailImpl implements _PlaceOfOriginDetail {
  _$PlaceOfOriginDetailImpl(
      {this.address,
      this.city,
      this.district,
      @JsonKey(name: 'full_address') this.fullAddress,
      this.ward});

  factory _$PlaceOfOriginDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceOfOriginDetailImplFromJson(json);

  @override
  final String? address;
  @override
  final City? city;
  @override
  final District? district;
  @override
  @JsonKey(name: 'full_address')
  final String? fullAddress;
  @override
  final Ward? ward;

  @override
  String toString() {
    return 'PlaceOfOriginDetail(address: $address, city: $city, district: $district, fullAddress: $fullAddress, ward: $ward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceOfOriginDetailImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.ward, ward) || other.ward == ward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, city, district, fullAddress, ward);

  /// Create a copy of PlaceOfOriginDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceOfOriginDetailImplCopyWith<_$PlaceOfOriginDetailImpl> get copyWith =>
      __$$PlaceOfOriginDetailImplCopyWithImpl<_$PlaceOfOriginDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceOfOriginDetailImplToJson(
      this,
    );
  }
}

abstract class _PlaceOfOriginDetail implements PlaceOfOriginDetail {
  factory _PlaceOfOriginDetail(
      {final String? address,
      final City? city,
      final District? district,
      @JsonKey(name: 'full_address') final String? fullAddress,
      final Ward? ward}) = _$PlaceOfOriginDetailImpl;

  factory _PlaceOfOriginDetail.fromJson(Map<String, dynamic> json) =
      _$PlaceOfOriginDetailImpl.fromJson;

  @override
  String? get address;
  @override
  City? get city;
  @override
  District? get district;
  @override
  @JsonKey(name: 'full_address')
  String? get fullAddress;
  @override
  Ward? get ward;

  /// Create a copy of PlaceOfOriginDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceOfOriginDetailImplCopyWith<_$PlaceOfOriginDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
