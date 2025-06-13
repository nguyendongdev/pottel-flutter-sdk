// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String? get iccid => throw _privateConstructorUsedError;
  String? get imsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'call_id')
  String? get callId => throw _privateConstructorUsedError;
  bool? get checkExist => throw _privateConstructorUsedError;

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String? iccid,
      String? imsi,
      @JsonKey(name: 'call_id') String? callId,
      bool? checkExist});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iccid = freezed,
    Object? imsi = freezed,
    Object? callId = freezed,
    Object? checkExist = freezed,
  }) {
    return _then(_value.copyWith(
      iccid: freezed == iccid
          ? _value.iccid
          : iccid // ignore: cast_nullable_to_non_nullable
              as String?,
      imsi: freezed == imsi
          ? _value.imsi
          : imsi // ignore: cast_nullable_to_non_nullable
              as String?,
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      checkExist: freezed == checkExist
          ? _value.checkExist
          : checkExist // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? iccid,
      String? imsi,
      @JsonKey(name: 'call_id') String? callId,
      bool? checkExist});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iccid = freezed,
    Object? imsi = freezed,
    Object? callId = freezed,
    Object? checkExist = freezed,
  }) {
    return _then(_$ResultImpl(
      iccid: freezed == iccid
          ? _value.iccid
          : iccid // ignore: cast_nullable_to_non_nullable
              as String?,
      imsi: freezed == imsi
          ? _value.imsi
          : imsi // ignore: cast_nullable_to_non_nullable
              as String?,
      callId: freezed == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String?,
      checkExist: freezed == checkExist
          ? _value.checkExist
          : checkExist // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  _$ResultImpl(
      {this.iccid,
      this.imsi,
      @JsonKey(name: 'call_id') this.callId,
      this.checkExist});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final String? iccid;
  @override
  final String? imsi;
  @override
  @JsonKey(name: 'call_id')
  final String? callId;
  @override
  final bool? checkExist;

  @override
  String toString() {
    return 'Result(iccid: $iccid, imsi: $imsi, callId: $callId, checkExist: $checkExist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.iccid, iccid) || other.iccid == iccid) &&
            (identical(other.imsi, imsi) || other.imsi == imsi) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.checkExist, checkExist) ||
                other.checkExist == checkExist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, iccid, imsi, callId, checkExist);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  factory _Result(
      {final String? iccid,
      final String? imsi,
      @JsonKey(name: 'call_id') final String? callId,
      final bool? checkExist}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String? get iccid;
  @override
  String? get imsi;
  @override
  @JsonKey(name: 'call_id')
  String? get callId;
  @override
  bool? get checkExist;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
