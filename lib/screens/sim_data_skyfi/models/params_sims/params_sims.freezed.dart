// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'params_sims.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParamsSims _$ParamsSimsFromJson(Map<String, dynamic> json) {
  return _ParamsSims.fromJson(json);
}

/// @nodoc
mixin _$ParamsSims {
  Filters? get filters => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  /// Serializes this ParamsSims to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParamsSimsCopyWith<ParamsSims> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsSimsCopyWith<$Res> {
  factory $ParamsSimsCopyWith(
          ParamsSims value, $Res Function(ParamsSims) then) =
      _$ParamsSimsCopyWithImpl<$Res, ParamsSims>;
  @useResult
  $Res call({Filters? filters, int? page, int? pageSize});

  $FiltersCopyWith<$Res>? get filters;
}

/// @nodoc
class _$ParamsSimsCopyWithImpl<$Res, $Val extends ParamsSims>
    implements $ParamsSimsCopyWith<$Res> {
  _$ParamsSimsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FiltersCopyWith<$Res>? get filters {
    if (_value.filters == null) {
      return null;
    }

    return $FiltersCopyWith<$Res>(_value.filters!, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParamsSimsImplCopyWith<$Res>
    implements $ParamsSimsCopyWith<$Res> {
  factory _$$ParamsSimsImplCopyWith(
          _$ParamsSimsImpl value, $Res Function(_$ParamsSimsImpl) then) =
      __$$ParamsSimsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Filters? filters, int? page, int? pageSize});

  @override
  $FiltersCopyWith<$Res>? get filters;
}

/// @nodoc
class __$$ParamsSimsImplCopyWithImpl<$Res>
    extends _$ParamsSimsCopyWithImpl<$Res, _$ParamsSimsImpl>
    implements _$$ParamsSimsImplCopyWith<$Res> {
  __$$ParamsSimsImplCopyWithImpl(
      _$ParamsSimsImpl _value, $Res Function(_$ParamsSimsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$ParamsSimsImpl(
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParamsSimsImpl implements _ParamsSims {
  _$ParamsSimsImpl({this.filters, this.page, this.pageSize});

  factory _$ParamsSimsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamsSimsImplFromJson(json);

  @override
  final Filters? filters;
  @override
  final int? page;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'ParamsSims(filters: $filters, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamsSimsImpl &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, filters, page, pageSize);

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamsSimsImplCopyWith<_$ParamsSimsImpl> get copyWith =>
      __$$ParamsSimsImplCopyWithImpl<_$ParamsSimsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamsSimsImplToJson(
      this,
    );
  }
}

abstract class _ParamsSims implements ParamsSims {
  factory _ParamsSims(
      {final Filters? filters,
      final int? page,
      final int? pageSize}) = _$ParamsSimsImpl;

  factory _ParamsSims.fromJson(Map<String, dynamic> json) =
      _$ParamsSimsImpl.fromJson;

  @override
  Filters? get filters;
  @override
  int? get page;
  @override
  int? get pageSize;

  /// Create a copy of ParamsSims
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamsSimsImplCopyWith<_$ParamsSimsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
