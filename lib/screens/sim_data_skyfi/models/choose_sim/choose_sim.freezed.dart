// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_sim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChooseSim _$ChooseSimFromJson(Map<String, dynamic> json) {
  return _ChooseSim.fromJson(json);
}

/// @nodoc
mixin _$ChooseSim {
  dynamic get requestId => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalRecords => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this ChooseSim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChooseSim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChooseSimCopyWith<ChooseSim> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseSimCopyWith<$Res> {
  factory $ChooseSimCopyWith(ChooseSim value, $Res Function(ChooseSim) then) =
      _$ChooseSimCopyWithImpl<$Res, ChooseSim>;
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      List<Result>? result,
      dynamic extra});
}

/// @nodoc
class _$ChooseSimCopyWithImpl<$Res, $Val extends ChooseSim>
    implements $ChooseSimCopyWith<$Res> {
  _$ChooseSimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChooseSim
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
              as List<Result>?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChooseSimImplCopyWith<$Res>
    implements $ChooseSimCopyWith<$Res> {
  factory _$$ChooseSimImplCopyWith(
          _$ChooseSimImpl value, $Res Function(_$ChooseSimImpl) then) =
      __$$ChooseSimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic requestId,
      int? code,
      String? message,
      int? totalRecords,
      List<Result>? result,
      dynamic extra});
}

/// @nodoc
class __$$ChooseSimImplCopyWithImpl<$Res>
    extends _$ChooseSimCopyWithImpl<$Res, _$ChooseSimImpl>
    implements _$$ChooseSimImplCopyWith<$Res> {
  __$$ChooseSimImplCopyWithImpl(
      _$ChooseSimImpl _value, $Res Function(_$ChooseSimImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChooseSim
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
    return _then(_$ChooseSimImpl(
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
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChooseSimImpl implements _ChooseSim {
  _$ChooseSimImpl(
      {this.requestId,
      this.code,
      this.message,
      this.totalRecords,
      final List<Result>? result,
      this.extra})
      : _result = result;

  factory _$ChooseSimImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChooseSimImplFromJson(json);

  @override
  final dynamic requestId;
  @override
  final int? code;
  @override
  final String? message;
  @override
  final int? totalRecords;
  final List<Result>? _result;
  @override
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic extra;

  @override
  String toString() {
    return 'ChooseSim(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseSimImpl &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
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
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of ChooseSim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseSimImplCopyWith<_$ChooseSimImpl> get copyWith =>
      __$$ChooseSimImplCopyWithImpl<_$ChooseSimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChooseSimImplToJson(
      this,
    );
  }
}

abstract class _ChooseSim implements ChooseSim {
  factory _ChooseSim(
      {final dynamic requestId,
      final int? code,
      final String? message,
      final int? totalRecords,
      final List<Result>? result,
      final dynamic extra}) = _$ChooseSimImpl;

  factory _ChooseSim.fromJson(Map<String, dynamic> json) =
      _$ChooseSimImpl.fromJson;

  @override
  dynamic get requestId;
  @override
  int? get code;
  @override
  String? get message;
  @override
  int? get totalRecords;
  @override
  List<Result>? get result;
  @override
  dynamic get extra;

  /// Create a copy of ChooseSim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChooseSimImplCopyWith<_$ChooseSimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
