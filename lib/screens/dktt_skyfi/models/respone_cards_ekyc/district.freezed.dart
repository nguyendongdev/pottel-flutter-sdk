// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  @JsonKey(name: 'district_code')
  String? get districtCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_name')
  String? get districtName => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_district')
  String? get originalDistrict => throw _privateConstructorUsedError;

  /// Serializes this District to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call(
      {@JsonKey(name: 'district_code') String? districtCode,
      @JsonKey(name: 'district_name') String? districtName,
      @JsonKey(name: 'original_district') String? originalDistrict});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtCode = freezed,
    Object? districtName = freezed,
    Object? originalDistrict = freezed,
  }) {
    return _then(_value.copyWith(
      districtCode: freezed == districtCode
          ? _value.districtCode
          : districtCode // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalDistrict: freezed == originalDistrict
          ? _value.originalDistrict
          : originalDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'district_code') String? districtCode,
      @JsonKey(name: 'district_name') String? districtName,
      @JsonKey(name: 'original_district') String? originalDistrict});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtCode = freezed,
    Object? districtName = freezed,
    Object? originalDistrict = freezed,
  }) {
    return _then(_$DistrictImpl(
      districtCode: freezed == districtCode
          ? _value.districtCode
          : districtCode // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: freezed == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalDistrict: freezed == originalDistrict
          ? _value.originalDistrict
          : originalDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictImpl implements _District {
  _$DistrictImpl(
      {@JsonKey(name: 'district_code') this.districtCode,
      @JsonKey(name: 'district_name') this.districtName,
      @JsonKey(name: 'original_district') this.originalDistrict});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  @JsonKey(name: 'district_code')
  final String? districtCode;
  @override
  @JsonKey(name: 'district_name')
  final String? districtName;
  @override
  @JsonKey(name: 'original_district')
  final String? originalDistrict;

  @override
  String toString() {
    return 'District(districtCode: $districtCode, districtName: $districtName, originalDistrict: $originalDistrict)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.originalDistrict, originalDistrict) ||
                other.originalDistrict == originalDistrict));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, districtCode, districtName, originalDistrict);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  factory _District(
          {@JsonKey(name: 'district_code') final String? districtCode,
          @JsonKey(name: 'district_name') final String? districtName,
          @JsonKey(name: 'original_district') final String? originalDistrict}) =
      _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  @JsonKey(name: 'district_code')
  String? get districtCode;
  @override
  @JsonKey(name: 'district_name')
  String? get districtName;
  @override
  @JsonKey(name: 'original_district')
  String? get originalDistrict;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
