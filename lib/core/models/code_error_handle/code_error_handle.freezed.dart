// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_error_handle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CodeErrorHandle _$CodeErrorHandleFromJson(Map<String, dynamic> json) {
  return _CodeErrorHandle.fromJson(json);
}

/// @nodoc
mixin _$CodeErrorHandle {
  dynamic get requestId => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalRecords => throw _privateConstructorUsedError;
  dynamic get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this CodeErrorHandle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CodeErrorHandle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CodeErrorHandleCopyWith<CodeErrorHandle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeErrorHandleCopyWith<$Res> {
  factory $CodeErrorHandleCopyWith(
          CodeErrorHandle value, $Res Function(CodeErrorHandle) then) =
      _$CodeErrorHandleCopyWithImpl<$Res, CodeErrorHandle>;
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      dynamic result,
      dynamic extra});
}

/// @nodoc
class _$CodeErrorHandleCopyWithImpl<$Res, $Val extends CodeErrorHandle>
    implements $CodeErrorHandleCopyWith<$Res> {
  _$CodeErrorHandleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CodeErrorHandle
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
              as dynamic,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CodeErrorHandleImplCopyWith<$Res>
    implements $CodeErrorHandleCopyWith<$Res> {
  factory _$$CodeErrorHandleImplCopyWith(_$CodeErrorHandleImpl value,
          $Res Function(_$CodeErrorHandleImpl) then) =
      __$$CodeErrorHandleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      dynamic result,
      dynamic extra});
}

/// @nodoc
class __$$CodeErrorHandleImplCopyWithImpl<$Res>
    extends _$CodeErrorHandleCopyWithImpl<$Res, _$CodeErrorHandleImpl>
    implements _$$CodeErrorHandleImplCopyWith<$Res> {
  __$$CodeErrorHandleImplCopyWithImpl(
      _$CodeErrorHandleImpl _value, $Res Function(_$CodeErrorHandleImpl) _then)
      : super(_value, _then);

  /// Create a copy of CodeErrorHandle
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
    return _then(_$CodeErrorHandleImpl(
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
              as dynamic,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CodeErrorHandleImpl implements _CodeErrorHandle {
  _$CodeErrorHandleImpl(
      {this.requestId,
      this.code,
      this.message,
      this.totalRecords,
      this.result,
      this.extra});

  factory _$CodeErrorHandleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CodeErrorHandleImplFromJson(json);

  @override
  final dynamic requestId;
  @override
  final int? code;
  @override
  final String? message;
  @override
  final int? totalRecords;
  @override
  final dynamic result;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'CodeErrorHandle(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeErrorHandleImpl &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            const DeepCollectionEquality().equals(other.result, result) &&
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
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of CodeErrorHandle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeErrorHandleImplCopyWith<_$CodeErrorHandleImpl> get copyWith =>
      __$$CodeErrorHandleImplCopyWithImpl<_$CodeErrorHandleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CodeErrorHandleImplToJson(
      this,
    );
  }
}

abstract class _CodeErrorHandle implements CodeErrorHandle {
  factory _CodeErrorHandle(
      {final dynamic requestId,
      final int? code,
      final String? message,
      final int? totalRecords,
      final dynamic result,
      final dynamic extra}) = _$CodeErrorHandleImpl;

  factory _CodeErrorHandle.fromJson(Map<String, dynamic> json) =
      _$CodeErrorHandleImpl.fromJson;

  @override
  dynamic get requestId;
  @override
  int? get code;
  @override
  String? get message;
  @override
  int? get totalRecords;
  @override
  dynamic get result;
  @override
  dynamic get extra;

  /// Create a copy of CodeErrorHandle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeErrorHandleImplCopyWith<_$CodeErrorHandleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
