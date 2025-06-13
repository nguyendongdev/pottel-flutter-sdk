// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_from_iccid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfoFromIccid _$InfoFromIccidFromJson(Map<String, dynamic> json) {
  return _InfoFromIccid.fromJson(json);
}

/// @nodoc
mixin _$InfoFromIccid {
  dynamic get requestId => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalRecords => throw _privateConstructorUsedError;
  Result? get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this InfoFromIccid to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoFromIccidCopyWith<InfoFromIccid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoFromIccidCopyWith<$Res> {
  factory $InfoFromIccidCopyWith(
          InfoFromIccid value, $Res Function(InfoFromIccid) then) =
      _$InfoFromIccidCopyWithImpl<$Res, InfoFromIccid>;
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      Result? result,
      dynamic extra});

  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$InfoFromIccidCopyWithImpl<$Res, $Val extends InfoFromIccid>
    implements $InfoFromIccidCopyWith<$Res> {
  _$InfoFromIccidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfoFromIccidImplCopyWith<$Res>
    implements $InfoFromIccidCopyWith<$Res> {
  factory _$$InfoFromIccidImplCopyWith(
          _$InfoFromIccidImpl value, $Res Function(_$InfoFromIccidImpl) then) =
      __$$InfoFromIccidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      Result? result,
      dynamic extra});

  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$InfoFromIccidImplCopyWithImpl<$Res>
    extends _$InfoFromIccidCopyWithImpl<$Res, _$InfoFromIccidImpl>
    implements _$$InfoFromIccidImplCopyWith<$Res> {
  __$$InfoFromIccidImplCopyWithImpl(
      _$InfoFromIccidImpl _value, $Res Function(_$InfoFromIccidImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$InfoFromIccidImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoFromIccidImpl implements _InfoFromIccid {
  _$InfoFromIccidImpl(
      {this.requestId,
      this.code,
      this.message,
      this.totalRecords,
      this.result,
      this.extra});

  factory _$InfoFromIccidImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoFromIccidImplFromJson(json);

  @override
  final dynamic requestId;
  @override
  final int? code;
  @override
  final String? message;
  @override
  final int? totalRecords;
  @override
  final Result? result;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'InfoFromIccid(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoFromIccidImpl &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestId),
      code,
      message,
      totalRecords,
      result,
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoFromIccidImplCopyWith<_$InfoFromIccidImpl> get copyWith =>
      __$$InfoFromIccidImplCopyWithImpl<_$InfoFromIccidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoFromIccidImplToJson(
      this,
    );
  }
}

abstract class _InfoFromIccid implements InfoFromIccid {
  factory _InfoFromIccid(
      {final dynamic requestId,
      final int? code,
      final String? message,
      final int? totalRecords,
      final Result? result,
      final dynamic extra}) = _$InfoFromIccidImpl;

  factory _InfoFromIccid.fromJson(Map<String, dynamic> json) =
      _$InfoFromIccidImpl.fromJson;

  @override
  dynamic get requestId;
  @override
  int? get code;
  @override
  String? get message;
  @override
  int? get totalRecords;
  @override
  Result? get result;
  @override
  dynamic get extra;

  /// Create a copy of InfoFromIccid
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoFromIccidImplCopyWith<_$InfoFromIccidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
