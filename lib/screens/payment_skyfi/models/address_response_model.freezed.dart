// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseResponse<T> _$BaseResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseResponse<T> {
  @JsonKey(name: 'requestId')
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int? get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  T? get result => throw _privateConstructorUsedError;

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseResponseCopyWith<T, BaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<T, $Res> {
  factory $BaseResponseCopyWith(
          BaseResponse<T> value, $Res Function(BaseResponse<T>) then) =
      _$BaseResponseCopyWithImpl<T, $Res, BaseResponse<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      @JsonKey(name: 'result') T? result});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<T, $Res, $Val extends BaseResponse<T>>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseImplCopyWith<T, $Res>
    implements $BaseResponseCopyWith<T, $Res> {
  factory _$$BaseResponseImplCopyWith(_$BaseResponseImpl<T> value,
          $Res Function(_$BaseResponseImpl<T>) then) =
      __$$BaseResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      @JsonKey(name: 'result') T? result});
}

/// @nodoc
class __$$BaseResponseImplCopyWithImpl<T, $Res>
    extends _$BaseResponseCopyWithImpl<T, $Res, _$BaseResponseImpl<T>>
    implements _$$BaseResponseImplCopyWith<T, $Res> {
  __$$BaseResponseImplCopyWithImpl(
      _$BaseResponseImpl<T> _value, $Res Function(_$BaseResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
  }) {
    return _then(_$BaseResponseImpl<T>(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseResponseImpl<T> implements _BaseResponse<T> {
  const _$BaseResponseImpl(
      {@JsonKey(name: 'requestId') this.requestId,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'totalRecords') this.totalRecords,
      @JsonKey(name: 'result') this.result});

  factory _$BaseResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'requestId')
  final String? requestId;
  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'totalRecords')
  final int? totalRecords;
  @override
  @JsonKey(name: 'result')
  final T? result;

  @override
  String toString() {
    return 'BaseResponse<$T>(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseImpl<T> &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, code, message,
      totalRecords, const DeepCollectionEquality().hash(result));

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      __$$BaseResponseImplCopyWithImpl<T, _$BaseResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseResponse<T> implements BaseResponse<T> {
  const factory _BaseResponse(
      {@JsonKey(name: 'requestId') final String? requestId,
      @JsonKey(name: 'code') final int? code,
      @JsonKey(name: 'message') final String? message,
      @JsonKey(name: 'totalRecords') final int? totalRecords,
      @JsonKey(name: 'result') final T? result}) = _$BaseResponseImpl<T>;

  factory _BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'requestId')
  String? get requestId;
  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'totalRecords')
  int? get totalRecords;
  @override
  @JsonKey(name: 'result')
  T? get result;

  /// Create a copy of BaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseResponseImplCopyWith<T, _$BaseResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) {
  return _CitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$CitiesResponse {
  @JsonKey(name: 'cities')
  List<CityModel>? get cities => throw _privateConstructorUsedError;

  /// Serializes this CitiesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitiesResponseCopyWith<CitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitiesResponseCopyWith<$Res> {
  factory $CitiesResponseCopyWith(
          CitiesResponse value, $Res Function(CitiesResponse) then) =
      _$CitiesResponseCopyWithImpl<$Res, CitiesResponse>;
  @useResult
  $Res call({@JsonKey(name: 'cities') List<CityModel>? cities});
}

/// @nodoc
class _$CitiesResponseCopyWithImpl<$Res, $Val extends CitiesResponse>
    implements $CitiesResponseCopyWith<$Res> {
  _$CitiesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
  }) {
    return _then(_value.copyWith(
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitiesResponseImplCopyWith<$Res>
    implements $CitiesResponseCopyWith<$Res> {
  factory _$$CitiesResponseImplCopyWith(_$CitiesResponseImpl value,
          $Res Function(_$CitiesResponseImpl) then) =
      __$$CitiesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cities') List<CityModel>? cities});
}

/// @nodoc
class __$$CitiesResponseImplCopyWithImpl<$Res>
    extends _$CitiesResponseCopyWithImpl<$Res, _$CitiesResponseImpl>
    implements _$$CitiesResponseImplCopyWith<$Res> {
  __$$CitiesResponseImplCopyWithImpl(
      _$CitiesResponseImpl _value, $Res Function(_$CitiesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
  }) {
    return _then(_$CitiesResponseImpl(
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitiesResponseImpl implements _CitiesResponse {
  const _$CitiesResponseImpl(
      {@JsonKey(name: 'cities') final List<CityModel>? cities})
      : _cities = cities;

  factory _$CitiesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitiesResponseImplFromJson(json);

  final List<CityModel>? _cities;
  @override
  @JsonKey(name: 'cities')
  List<CityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CitiesResponse(cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitiesResponseImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cities));

  /// Create a copy of CitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitiesResponseImplCopyWith<_$CitiesResponseImpl> get copyWith =>
      __$$CitiesResponseImplCopyWithImpl<_$CitiesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitiesResponseImplToJson(
      this,
    );
  }
}

abstract class _CitiesResponse implements CitiesResponse {
  const factory _CitiesResponse(
          {@JsonKey(name: 'cities') final List<CityModel>? cities}) =
      _$CitiesResponseImpl;

  factory _CitiesResponse.fromJson(Map<String, dynamic> json) =
      _$CitiesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'cities')
  List<CityModel>? get cities;

  /// Create a copy of CitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitiesResponseImplCopyWith<_$CitiesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DistrictsResponse _$DistrictsResponseFromJson(Map<String, dynamic> json) {
  return _DistrictsResponse.fromJson(json);
}

/// @nodoc
mixin _$DistrictsResponse {
  @JsonKey(name: 'districts')
  List<DistrictModel>? get districts => throw _privateConstructorUsedError;

  /// Serializes this DistrictsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DistrictsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictsResponseCopyWith<DistrictsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictsResponseCopyWith<$Res> {
  factory $DistrictsResponseCopyWith(
          DistrictsResponse value, $Res Function(DistrictsResponse) then) =
      _$DistrictsResponseCopyWithImpl<$Res, DistrictsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'districts') List<DistrictModel>? districts});
}

/// @nodoc
class _$DistrictsResponseCopyWithImpl<$Res, $Val extends DistrictsResponse>
    implements $DistrictsResponseCopyWith<$Res> {
  _$DistrictsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistrictsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districts = freezed,
  }) {
    return _then(_value.copyWith(
      districts: freezed == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<DistrictModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictsResponseImplCopyWith<$Res>
    implements $DistrictsResponseCopyWith<$Res> {
  factory _$$DistrictsResponseImplCopyWith(_$DistrictsResponseImpl value,
          $Res Function(_$DistrictsResponseImpl) then) =
      __$$DistrictsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'districts') List<DistrictModel>? districts});
}

/// @nodoc
class __$$DistrictsResponseImplCopyWithImpl<$Res>
    extends _$DistrictsResponseCopyWithImpl<$Res, _$DistrictsResponseImpl>
    implements _$$DistrictsResponseImplCopyWith<$Res> {
  __$$DistrictsResponseImplCopyWithImpl(_$DistrictsResponseImpl _value,
      $Res Function(_$DistrictsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistrictsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districts = freezed,
  }) {
    return _then(_$DistrictsResponseImpl(
      districts: freezed == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<DistrictModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictsResponseImpl implements _DistrictsResponse {
  const _$DistrictsResponseImpl(
      {@JsonKey(name: 'districts') final List<DistrictModel>? districts})
      : _districts = districts;

  factory _$DistrictsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictsResponseImplFromJson(json);

  final List<DistrictModel>? _districts;
  @override
  @JsonKey(name: 'districts')
  List<DistrictModel>? get districts {
    final value = _districts;
    if (value == null) return null;
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DistrictsResponse(districts: $districts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_districts));

  /// Create a copy of DistrictsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictsResponseImplCopyWith<_$DistrictsResponseImpl> get copyWith =>
      __$$DistrictsResponseImplCopyWithImpl<_$DistrictsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictsResponseImplToJson(
      this,
    );
  }
}

abstract class _DistrictsResponse implements DistrictsResponse {
  const factory _DistrictsResponse(
          {@JsonKey(name: 'districts') final List<DistrictModel>? districts}) =
      _$DistrictsResponseImpl;

  factory _DistrictsResponse.fromJson(Map<String, dynamic> json) =
      _$DistrictsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'districts')
  List<DistrictModel>? get districts;

  /// Create a copy of DistrictsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictsResponseImplCopyWith<_$DistrictsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WardsResponse _$WardsResponseFromJson(Map<String, dynamic> json) {
  return _WardsResponse.fromJson(json);
}

/// @nodoc
mixin _$WardsResponse {
  @JsonKey(name: 'wards')
  List<WardModel>? get wards => throw _privateConstructorUsedError;

  /// Serializes this WardsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WardsResponseCopyWith<WardsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardsResponseCopyWith<$Res> {
  factory $WardsResponseCopyWith(
          WardsResponse value, $Res Function(WardsResponse) then) =
      _$WardsResponseCopyWithImpl<$Res, WardsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'wards') List<WardModel>? wards});
}

/// @nodoc
class _$WardsResponseCopyWithImpl<$Res, $Val extends WardsResponse>
    implements $WardsResponseCopyWith<$Res> {
  _$WardsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wards = freezed,
  }) {
    return _then(_value.copyWith(
      wards: freezed == wards
          ? _value.wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<WardModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WardsResponseImplCopyWith<$Res>
    implements $WardsResponseCopyWith<$Res> {
  factory _$$WardsResponseImplCopyWith(
          _$WardsResponseImpl value, $Res Function(_$WardsResponseImpl) then) =
      __$$WardsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'wards') List<WardModel>? wards});
}

/// @nodoc
class __$$WardsResponseImplCopyWithImpl<$Res>
    extends _$WardsResponseCopyWithImpl<$Res, _$WardsResponseImpl>
    implements _$$WardsResponseImplCopyWith<$Res> {
  __$$WardsResponseImplCopyWithImpl(
      _$WardsResponseImpl _value, $Res Function(_$WardsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wards = freezed,
  }) {
    return _then(_$WardsResponseImpl(
      wards: freezed == wards
          ? _value._wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<WardModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WardsResponseImpl implements _WardsResponse {
  const _$WardsResponseImpl(
      {@JsonKey(name: 'wards') final List<WardModel>? wards})
      : _wards = wards;

  factory _$WardsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WardsResponseImplFromJson(json);

  final List<WardModel>? _wards;
  @override
  @JsonKey(name: 'wards')
  List<WardModel>? get wards {
    final value = _wards;
    if (value == null) return null;
    if (_wards is EqualUnmodifiableListView) return _wards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WardsResponse(wards: $wards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardsResponseImpl &&
            const DeepCollectionEquality().equals(other._wards, _wards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_wards));

  /// Create a copy of WardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WardsResponseImplCopyWith<_$WardsResponseImpl> get copyWith =>
      __$$WardsResponseImplCopyWithImpl<_$WardsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WardsResponseImplToJson(
      this,
    );
  }
}

abstract class _WardsResponse implements WardsResponse {
  const factory _WardsResponse(
          {@JsonKey(name: 'wards') final List<WardModel>? wards}) =
      _$WardsResponseImpl;

  factory _WardsResponse.fromJson(Map<String, dynamic> json) =
      _$WardsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'wards')
  List<WardModel>? get wards;

  /// Create a copy of WardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WardsResponseImplCopyWith<_$WardsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'index')
  int? get index => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'index') int? index});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'index') int? index});
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
      _$CityModelImpl _value, $Res Function(_$CityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? index = freezed,
  }) {
    return _then(_$CityModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements _CityModel {
  const _$CityModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'index') this.index});

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'index')
  final int? index;

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, index);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(
      this,
    );
  }
}

abstract class _CityModel implements CityModel {
  const factory _CityModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'index') final int? index}) = _$CityModelImpl;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'index')
  int? get index;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) {
  return _DistrictModel.fromJson(json);
}

/// @nodoc
mixin _$DistrictModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'index')
  int? get index => throw _privateConstructorUsedError;

  /// Serializes this DistrictModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictModelCopyWith<DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictModelCopyWith<$Res> {
  factory $DistrictModelCopyWith(
          DistrictModel value, $Res Function(DistrictModel) then) =
      _$DistrictModelCopyWithImpl<$Res, DistrictModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'index') int? index});
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res, $Val extends DistrictModel>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cityId = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictModelImplCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$$DistrictModelImplCopyWith(
          _$DistrictModelImpl value, $Res Function(_$DistrictModelImpl) then) =
      __$$DistrictModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'index') int? index});
}

/// @nodoc
class __$$DistrictModelImplCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res, _$DistrictModelImpl>
    implements _$$DistrictModelImplCopyWith<$Res> {
  __$$DistrictModelImplCopyWithImpl(
      _$DistrictModelImpl _value, $Res Function(_$DistrictModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cityId = freezed,
    Object? index = freezed,
  }) {
    return _then(_$DistrictModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictModelImpl implements _DistrictModel {
  const _$DistrictModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'index') this.index});

  factory _$DistrictModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'index')
  final int? index;

  @override
  String toString() {
    return 'DistrictModel(id: $id, name: $name, cityId: $cityId, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, cityId, index);

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      __$$DistrictModelImplCopyWithImpl<_$DistrictModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictModelImplToJson(
      this,
    );
  }
}

abstract class _DistrictModel implements DistrictModel {
  const factory _DistrictModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'city_id') final int? cityId,
      @JsonKey(name: 'index') final int? index}) = _$DistrictModelImpl;

  factory _DistrictModel.fromJson(Map<String, dynamic> json) =
      _$DistrictModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'index')
  int? get index;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WardModel _$WardModelFromJson(Map<String, dynamic> json) {
  return _WardModel.fromJson(json);
}

/// @nodoc
mixin _$WardModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int? get districtId => throw _privateConstructorUsedError;

  /// Serializes this WardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WardModelCopyWith<WardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardModelCopyWith<$Res> {
  factory $WardModelCopyWith(WardModel value, $Res Function(WardModel) then) =
      _$WardModelCopyWithImpl<$Res, WardModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'district_id') int? districtId});
}

/// @nodoc
class _$WardModelCopyWithImpl<$Res, $Val extends WardModel>
    implements $WardModelCopyWith<$Res> {
  _$WardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? districtId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WardModelImplCopyWith<$Res>
    implements $WardModelCopyWith<$Res> {
  factory _$$WardModelImplCopyWith(
          _$WardModelImpl value, $Res Function(_$WardModelImpl) then) =
      __$$WardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'district_id') int? districtId});
}

/// @nodoc
class __$$WardModelImplCopyWithImpl<$Res>
    extends _$WardModelCopyWithImpl<$Res, _$WardModelImpl>
    implements _$$WardModelImplCopyWith<$Res> {
  __$$WardModelImplCopyWithImpl(
      _$WardModelImpl _value, $Res Function(_$WardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? districtId = freezed,
  }) {
    return _then(_$WardModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WardModelImpl implements _WardModel {
  const _$WardModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'district_id') this.districtId});

  factory _$WardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WardModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'district_id')
  final int? districtId;

  @override
  String toString() {
    return 'WardModel(id: $id, name: $name, districtId: $districtId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, districtId);

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WardModelImplCopyWith<_$WardModelImpl> get copyWith =>
      __$$WardModelImplCopyWithImpl<_$WardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WardModelImplToJson(
      this,
    );
  }
}

abstract class _WardModel implements WardModel {
  const factory _WardModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'district_id') final int? districtId}) = _$WardModelImpl;

  factory _WardModel.fromJson(Map<String, dynamic> json) =
      _$WardModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'district_id')
  int? get districtId;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WardModelImplCopyWith<_$WardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewCitiesResponse _$NewCitiesResponseFromJson(Map<String, dynamic> json) {
  return _NewCitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$NewCitiesResponse {
  @JsonKey(name: 'cities')
  List<NewCityModel>? get cities => throw _privateConstructorUsedError;

  /// Serializes this NewCitiesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewCitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewCitiesResponseCopyWith<NewCitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCitiesResponseCopyWith<$Res> {
  factory $NewCitiesResponseCopyWith(
          NewCitiesResponse value, $Res Function(NewCitiesResponse) then) =
      _$NewCitiesResponseCopyWithImpl<$Res, NewCitiesResponse>;
  @useResult
  $Res call({@JsonKey(name: 'cities') List<NewCityModel>? cities});
}

/// @nodoc
class _$NewCitiesResponseCopyWithImpl<$Res, $Val extends NewCitiesResponse>
    implements $NewCitiesResponseCopyWith<$Res> {
  _$NewCitiesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewCitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
  }) {
    return _then(_value.copyWith(
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<NewCityModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewCitiesResponseImplCopyWith<$Res>
    implements $NewCitiesResponseCopyWith<$Res> {
  factory _$$NewCitiesResponseImplCopyWith(_$NewCitiesResponseImpl value,
          $Res Function(_$NewCitiesResponseImpl) then) =
      __$$NewCitiesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cities') List<NewCityModel>? cities});
}

/// @nodoc
class __$$NewCitiesResponseImplCopyWithImpl<$Res>
    extends _$NewCitiesResponseCopyWithImpl<$Res, _$NewCitiesResponseImpl>
    implements _$$NewCitiesResponseImplCopyWith<$Res> {
  __$$NewCitiesResponseImplCopyWithImpl(_$NewCitiesResponseImpl _value,
      $Res Function(_$NewCitiesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewCitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = freezed,
  }) {
    return _then(_$NewCitiesResponseImpl(
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<NewCityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewCitiesResponseImpl implements _NewCitiesResponse {
  const _$NewCitiesResponseImpl(
      {@JsonKey(name: 'cities') final List<NewCityModel>? cities})
      : _cities = cities;

  factory _$NewCitiesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewCitiesResponseImplFromJson(json);

  final List<NewCityModel>? _cities;
  @override
  @JsonKey(name: 'cities')
  List<NewCityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NewCitiesResponse(cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewCitiesResponseImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cities));

  /// Create a copy of NewCitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewCitiesResponseImplCopyWith<_$NewCitiesResponseImpl> get copyWith =>
      __$$NewCitiesResponseImplCopyWithImpl<_$NewCitiesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewCitiesResponseImplToJson(
      this,
    );
  }
}

abstract class _NewCitiesResponse implements NewCitiesResponse {
  const factory _NewCitiesResponse(
          {@JsonKey(name: 'cities') final List<NewCityModel>? cities}) =
      _$NewCitiesResponseImpl;

  factory _NewCitiesResponse.fromJson(Map<String, dynamic> json) =
      _$NewCitiesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'cities')
  List<NewCityModel>? get cities;

  /// Create a copy of NewCitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewCitiesResponseImplCopyWith<_$NewCitiesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewWardsResponse _$NewWardsResponseFromJson(Map<String, dynamic> json) {
  return _NewWardsResponse.fromJson(json);
}

/// @nodoc
mixin _$NewWardsResponse {
  @JsonKey(name: 'wards')
  List<NewWardModel>? get wards => throw _privateConstructorUsedError;

  /// Serializes this NewWardsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewWardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewWardsResponseCopyWith<NewWardsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewWardsResponseCopyWith<$Res> {
  factory $NewWardsResponseCopyWith(
          NewWardsResponse value, $Res Function(NewWardsResponse) then) =
      _$NewWardsResponseCopyWithImpl<$Res, NewWardsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'wards') List<NewWardModel>? wards});
}

/// @nodoc
class _$NewWardsResponseCopyWithImpl<$Res, $Val extends NewWardsResponse>
    implements $NewWardsResponseCopyWith<$Res> {
  _$NewWardsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewWardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wards = freezed,
  }) {
    return _then(_value.copyWith(
      wards: freezed == wards
          ? _value.wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<NewWardModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewWardsResponseImplCopyWith<$Res>
    implements $NewWardsResponseCopyWith<$Res> {
  factory _$$NewWardsResponseImplCopyWith(_$NewWardsResponseImpl value,
          $Res Function(_$NewWardsResponseImpl) then) =
      __$$NewWardsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'wards') List<NewWardModel>? wards});
}

/// @nodoc
class __$$NewWardsResponseImplCopyWithImpl<$Res>
    extends _$NewWardsResponseCopyWithImpl<$Res, _$NewWardsResponseImpl>
    implements _$$NewWardsResponseImplCopyWith<$Res> {
  __$$NewWardsResponseImplCopyWithImpl(_$NewWardsResponseImpl _value,
      $Res Function(_$NewWardsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewWardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wards = freezed,
  }) {
    return _then(_$NewWardsResponseImpl(
      wards: freezed == wards
          ? _value._wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<NewWardModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewWardsResponseImpl implements _NewWardsResponse {
  const _$NewWardsResponseImpl(
      {@JsonKey(name: 'wards') final List<NewWardModel>? wards})
      : _wards = wards;

  factory _$NewWardsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewWardsResponseImplFromJson(json);

  final List<NewWardModel>? _wards;
  @override
  @JsonKey(name: 'wards')
  List<NewWardModel>? get wards {
    final value = _wards;
    if (value == null) return null;
    if (_wards is EqualUnmodifiableListView) return _wards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NewWardsResponse(wards: $wards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewWardsResponseImpl &&
            const DeepCollectionEquality().equals(other._wards, _wards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_wards));

  /// Create a copy of NewWardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewWardsResponseImplCopyWith<_$NewWardsResponseImpl> get copyWith =>
      __$$NewWardsResponseImplCopyWithImpl<_$NewWardsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewWardsResponseImplToJson(
      this,
    );
  }
}

abstract class _NewWardsResponse implements NewWardsResponse {
  const factory _NewWardsResponse(
          {@JsonKey(name: 'wards') final List<NewWardModel>? wards}) =
      _$NewWardsResponseImpl;

  factory _NewWardsResponse.fromJson(Map<String, dynamic> json) =
      _$NewWardsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'wards')
  List<NewWardModel>? get wards;

  /// Create a copy of NewWardsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewWardsResponseImplCopyWith<_$NewWardsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewCityModel _$NewCityModelFromJson(Map<String, dynamic> json) {
  return _NewCityModel.fromJson(json);
}

/// @nodoc
mixin _$NewCityModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vnpost_province_code')
  int? get vnpostProvinceCode => throw _privateConstructorUsedError;

  /// Serializes this NewCityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewCityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewCityModelCopyWith<NewCityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCityModelCopyWith<$Res> {
  factory $NewCityModelCopyWith(
          NewCityModel value, $Res Function(NewCityModel) then) =
      _$NewCityModelCopyWithImpl<$Res, NewCityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vnpost_province_code') int? vnpostProvinceCode});
}

/// @nodoc
class _$NewCityModelCopyWithImpl<$Res, $Val extends NewCityModel>
    implements $NewCityModelCopyWith<$Res> {
  _$NewCityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewCityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? vnpostProvinceCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vnpostProvinceCode: freezed == vnpostProvinceCode
          ? _value.vnpostProvinceCode
          : vnpostProvinceCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewCityModelImplCopyWith<$Res>
    implements $NewCityModelCopyWith<$Res> {
  factory _$$NewCityModelImplCopyWith(
          _$NewCityModelImpl value, $Res Function(_$NewCityModelImpl) then) =
      __$$NewCityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vnpost_province_code') int? vnpostProvinceCode});
}

/// @nodoc
class __$$NewCityModelImplCopyWithImpl<$Res>
    extends _$NewCityModelCopyWithImpl<$Res, _$NewCityModelImpl>
    implements _$$NewCityModelImplCopyWith<$Res> {
  __$$NewCityModelImplCopyWithImpl(
      _$NewCityModelImpl _value, $Res Function(_$NewCityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewCityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? vnpostProvinceCode = freezed,
  }) {
    return _then(_$NewCityModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vnpostProvinceCode: freezed == vnpostProvinceCode
          ? _value.vnpostProvinceCode
          : vnpostProvinceCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewCityModelImpl implements _NewCityModel {
  const _$NewCityModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'vnpost_province_code') this.vnpostProvinceCode});

  factory _$NewCityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewCityModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'vnpost_province_code')
  final int? vnpostProvinceCode;

  @override
  String toString() {
    return 'NewCityModel(id: $id, name: $name, vnpostProvinceCode: $vnpostProvinceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewCityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vnpostProvinceCode, vnpostProvinceCode) ||
                other.vnpostProvinceCode == vnpostProvinceCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, vnpostProvinceCode);

  /// Create a copy of NewCityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewCityModelImplCopyWith<_$NewCityModelImpl> get copyWith =>
      __$$NewCityModelImplCopyWithImpl<_$NewCityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewCityModelImplToJson(
      this,
    );
  }
}

abstract class _NewCityModel implements NewCityModel {
  const factory _NewCityModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'vnpost_province_code')
      final int? vnpostProvinceCode}) = _$NewCityModelImpl;

  factory _NewCityModel.fromJson(Map<String, dynamic> json) =
      _$NewCityModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'vnpost_province_code')
  int? get vnpostProvinceCode;

  /// Create a copy of NewCityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewCityModelImplCopyWith<_$NewCityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewWardModel _$NewWardModelFromJson(Map<String, dynamic> json) {
  return _NewWardModel.fromJson(json);
}

/// @nodoc
mixin _$NewWardModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vnpost_commune_code')
  int? get vnpostCommuneCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;

  /// Serializes this NewWardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewWardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewWardModelCopyWith<NewWardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewWardModelCopyWith<$Res> {
  factory $NewWardModelCopyWith(
          NewWardModel value, $Res Function(NewWardModel) then) =
      _$NewWardModelCopyWithImpl<$Res, NewWardModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vnpost_commune_code') int? vnpostCommuneCode,
      @JsonKey(name: 'city_id') int? cityId});
}

/// @nodoc
class _$NewWardModelCopyWithImpl<$Res, $Val extends NewWardModel>
    implements $NewWardModelCopyWith<$Res> {
  _$NewWardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewWardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? vnpostCommuneCode = freezed,
    Object? cityId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vnpostCommuneCode: freezed == vnpostCommuneCode
          ? _value.vnpostCommuneCode
          : vnpostCommuneCode // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewWardModelImplCopyWith<$Res>
    implements $NewWardModelCopyWith<$Res> {
  factory _$$NewWardModelImplCopyWith(
          _$NewWardModelImpl value, $Res Function(_$NewWardModelImpl) then) =
      __$$NewWardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vnpost_commune_code') int? vnpostCommuneCode,
      @JsonKey(name: 'city_id') int? cityId});
}

/// @nodoc
class __$$NewWardModelImplCopyWithImpl<$Res>
    extends _$NewWardModelCopyWithImpl<$Res, _$NewWardModelImpl>
    implements _$$NewWardModelImplCopyWith<$Res> {
  __$$NewWardModelImplCopyWithImpl(
      _$NewWardModelImpl _value, $Res Function(_$NewWardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewWardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? vnpostCommuneCode = freezed,
    Object? cityId = freezed,
  }) {
    return _then(_$NewWardModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vnpostCommuneCode: freezed == vnpostCommuneCode
          ? _value.vnpostCommuneCode
          : vnpostCommuneCode // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewWardModelImpl implements _NewWardModel {
  const _$NewWardModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'vnpost_commune_code') this.vnpostCommuneCode,
      @JsonKey(name: 'city_id') this.cityId});

  factory _$NewWardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewWardModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'vnpost_commune_code')
  final int? vnpostCommuneCode;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;

  @override
  String toString() {
    return 'NewWardModel(id: $id, name: $name, vnpostCommuneCode: $vnpostCommuneCode, cityId: $cityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewWardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vnpostCommuneCode, vnpostCommuneCode) ||
                other.vnpostCommuneCode == vnpostCommuneCode) &&
            (identical(other.cityId, cityId) || other.cityId == cityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, vnpostCommuneCode, cityId);

  /// Create a copy of NewWardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewWardModelImplCopyWith<_$NewWardModelImpl> get copyWith =>
      __$$NewWardModelImplCopyWithImpl<_$NewWardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewWardModelImplToJson(
      this,
    );
  }
}

abstract class _NewWardModel implements NewWardModel {
  const factory _NewWardModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'vnpost_commune_code') final int? vnpostCommuneCode,
      @JsonKey(name: 'city_id') final int? cityId}) = _$NewWardModelImpl;

  factory _NewWardModel.fromJson(Map<String, dynamic> json) =
      _$NewWardModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'vnpost_commune_code')
  int? get vnpostCommuneCode;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;

  /// Create a copy of NewWardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewWardModelImplCopyWith<_$NewWardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
