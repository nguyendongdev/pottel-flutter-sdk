// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ward _$WardFromJson(Map<String, dynamic> json) {
  return _Ward.fromJson(json);
}

/// @nodoc
mixin _$Ward {
  @JsonKey(name: 'original_ward')
  String? get originalWard => throw _privateConstructorUsedError;
  @JsonKey(name: 'ward_code')
  String? get wardCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ward_name')
  String? get wardName => throw _privateConstructorUsedError;

  /// Serializes this Ward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WardCopyWith<Ward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardCopyWith<$Res> {
  factory $WardCopyWith(Ward value, $Res Function(Ward) then) =
      _$WardCopyWithImpl<$Res, Ward>;
  @useResult
  $Res call(
      {@JsonKey(name: 'original_ward') String? originalWard,
      @JsonKey(name: 'ward_code') String? wardCode,
      @JsonKey(name: 'ward_name') String? wardName});
}

/// @nodoc
class _$WardCopyWithImpl<$Res, $Val extends Ward>
    implements $WardCopyWith<$Res> {
  _$WardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalWard = freezed,
    Object? wardCode = freezed,
    Object? wardName = freezed,
  }) {
    return _then(_value.copyWith(
      originalWard: freezed == originalWard
          ? _value.originalWard
          : originalWard // ignore: cast_nullable_to_non_nullable
              as String?,
      wardCode: freezed == wardCode
          ? _value.wardCode
          : wardCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wardName: freezed == wardName
          ? _value.wardName
          : wardName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WardImplCopyWith<$Res> implements $WardCopyWith<$Res> {
  factory _$$WardImplCopyWith(
          _$WardImpl value, $Res Function(_$WardImpl) then) =
      __$$WardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'original_ward') String? originalWard,
      @JsonKey(name: 'ward_code') String? wardCode,
      @JsonKey(name: 'ward_name') String? wardName});
}

/// @nodoc
class __$$WardImplCopyWithImpl<$Res>
    extends _$WardCopyWithImpl<$Res, _$WardImpl>
    implements _$$WardImplCopyWith<$Res> {
  __$$WardImplCopyWithImpl(_$WardImpl _value, $Res Function(_$WardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalWard = freezed,
    Object? wardCode = freezed,
    Object? wardName = freezed,
  }) {
    return _then(_$WardImpl(
      originalWard: freezed == originalWard
          ? _value.originalWard
          : originalWard // ignore: cast_nullable_to_non_nullable
              as String?,
      wardCode: freezed == wardCode
          ? _value.wardCode
          : wardCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wardName: freezed == wardName
          ? _value.wardName
          : wardName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WardImpl implements _Ward {
  _$WardImpl(
      {@JsonKey(name: 'original_ward') this.originalWard,
      @JsonKey(name: 'ward_code') this.wardCode,
      @JsonKey(name: 'ward_name') this.wardName});

  factory _$WardImpl.fromJson(Map<String, dynamic> json) =>
      _$$WardImplFromJson(json);

  @override
  @JsonKey(name: 'original_ward')
  final String? originalWard;
  @override
  @JsonKey(name: 'ward_code')
  final String? wardCode;
  @override
  @JsonKey(name: 'ward_name')
  final String? wardName;

  @override
  String toString() {
    return 'Ward(originalWard: $originalWard, wardCode: $wardCode, wardName: $wardName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardImpl &&
            (identical(other.originalWard, originalWard) ||
                other.originalWard == originalWard) &&
            (identical(other.wardCode, wardCode) ||
                other.wardCode == wardCode) &&
            (identical(other.wardName, wardName) ||
                other.wardName == wardName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, originalWard, wardCode, wardName);

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      __$$WardImplCopyWithImpl<_$WardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WardImplToJson(
      this,
    );
  }
}

abstract class _Ward implements Ward {
  factory _Ward(
      {@JsonKey(name: 'original_ward') final String? originalWard,
      @JsonKey(name: 'ward_code') final String? wardCode,
      @JsonKey(name: 'ward_name') final String? wardName}) = _$WardImpl;

  factory _Ward.fromJson(Map<String, dynamic> json) = _$WardImpl.fromJson;

  @override
  @JsonKey(name: 'original_ward')
  String? get originalWard;
  @override
  @JsonKey(name: 'ward_code')
  String? get wardCode;
  @override
  @JsonKey(name: 'ward_name')
  String? get wardName;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
