// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_user_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckUserPasswordResponse _$CheckUserPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _CheckUserPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckUserPasswordResponse {
  @JsonKey(name: 'requestId')
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  CheckUserPasswordResult? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra')
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this CheckUserPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckUserPasswordResponseCopyWith<CheckUserPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserPasswordResponseCopyWith<$Res> {
  factory $CheckUserPasswordResponseCopyWith(CheckUserPasswordResponse value,
          $Res Function(CheckUserPasswordResponse) then) =
      _$CheckUserPasswordResponseCopyWithImpl<$Res, CheckUserPasswordResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result') CheckUserPasswordResult? result,
      @JsonKey(name: 'extra') dynamic extra});

  $CheckUserPasswordResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$CheckUserPasswordResponseCopyWithImpl<$Res,
        $Val extends CheckUserPasswordResponse>
    implements $CheckUserPasswordResponseCopyWith<$Res> {
  _$CheckUserPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CheckUserPasswordResult?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckUserPasswordResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $CheckUserPasswordResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckUserPasswordResponseImplCopyWith<$Res>
    implements $CheckUserPasswordResponseCopyWith<$Res> {
  factory _$$CheckUserPasswordResponseImplCopyWith(
          _$CheckUserPasswordResponseImpl value,
          $Res Function(_$CheckUserPasswordResponseImpl) then) =
      __$$CheckUserPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result') CheckUserPasswordResult? result,
      @JsonKey(name: 'extra') dynamic extra});

  @override
  $CheckUserPasswordResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$CheckUserPasswordResponseImplCopyWithImpl<$Res>
    extends _$CheckUserPasswordResponseCopyWithImpl<$Res,
        _$CheckUserPasswordResponseImpl>
    implements _$$CheckUserPasswordResponseImplCopyWith<$Res> {
  __$$CheckUserPasswordResponseImplCopyWithImpl(
      _$CheckUserPasswordResponseImpl _value,
      $Res Function(_$CheckUserPasswordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$CheckUserPasswordResponseImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CheckUserPasswordResult?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckUserPasswordResponseImpl implements _CheckUserPasswordResponse {
  const _$CheckUserPasswordResponseImpl(
      {@JsonKey(name: 'requestId') this.requestId,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'totalRecords') required this.totalRecords,
      @JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'extra') this.extra});

  factory _$CheckUserPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckUserPasswordResponseImplFromJson(json);

  @override
  @JsonKey(name: 'requestId')
  final String? requestId;
  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'totalRecords')
  final int totalRecords;
  @override
  @JsonKey(name: 'result')
  final CheckUserPasswordResult? result;
  @override
  @JsonKey(name: 'extra')
  final dynamic extra;

  @override
  String toString() {
    return 'CheckUserPasswordResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserPasswordResponseImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, code, message,
      totalRecords, result, const DeepCollectionEquality().hash(extra));

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserPasswordResponseImplCopyWith<_$CheckUserPasswordResponseImpl>
      get copyWith => __$$CheckUserPasswordResponseImplCopyWithImpl<
          _$CheckUserPasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckUserPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckUserPasswordResponse implements CheckUserPasswordResponse {
  const factory _CheckUserPasswordResponse(
      {@JsonKey(name: 'requestId') final String? requestId,
      @JsonKey(name: 'code') required final int code,
      @JsonKey(name: 'message') required final String message,
      @JsonKey(name: 'totalRecords') required final int totalRecords,
      @JsonKey(name: 'result') required final CheckUserPasswordResult? result,
      @JsonKey(name: 'extra')
      final dynamic extra}) = _$CheckUserPasswordResponseImpl;

  factory _CheckUserPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$CheckUserPasswordResponseImpl.fromJson;

  @override
  @JsonKey(name: 'requestId')
  String? get requestId;
  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'totalRecords')
  int get totalRecords;
  @override
  @JsonKey(name: 'result')
  CheckUserPasswordResult? get result;
  @override
  @JsonKey(name: 'extra')
  dynamic get extra;

  /// Create a copy of CheckUserPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserPasswordResponseImplCopyWith<_$CheckUserPasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckUserPasswordResult _$CheckUserPasswordResultFromJson(
    Map<String, dynamic> json) {
  return _CheckUserPasswordResult.fromJson(json);
}

/// @nodoc
mixin _$CheckUserPasswordResult {
  @JsonKey(name: 'is_set_password')
  bool get isSetPassword => throw _privateConstructorUsedError;

  /// Serializes this CheckUserPasswordResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckUserPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckUserPasswordResultCopyWith<CheckUserPasswordResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserPasswordResultCopyWith<$Res> {
  factory $CheckUserPasswordResultCopyWith(CheckUserPasswordResult value,
          $Res Function(CheckUserPasswordResult) then) =
      _$CheckUserPasswordResultCopyWithImpl<$Res, CheckUserPasswordResult>;
  @useResult
  $Res call({@JsonKey(name: 'is_set_password') bool isSetPassword});
}

/// @nodoc
class _$CheckUserPasswordResultCopyWithImpl<$Res,
        $Val extends CheckUserPasswordResult>
    implements $CheckUserPasswordResultCopyWith<$Res> {
  _$CheckUserPasswordResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckUserPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSetPassword = null,
  }) {
    return _then(_value.copyWith(
      isSetPassword: null == isSetPassword
          ? _value.isSetPassword
          : isSetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckUserPasswordResultImplCopyWith<$Res>
    implements $CheckUserPasswordResultCopyWith<$Res> {
  factory _$$CheckUserPasswordResultImplCopyWith(
          _$CheckUserPasswordResultImpl value,
          $Res Function(_$CheckUserPasswordResultImpl) then) =
      __$$CheckUserPasswordResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'is_set_password') bool isSetPassword});
}

/// @nodoc
class __$$CheckUserPasswordResultImplCopyWithImpl<$Res>
    extends _$CheckUserPasswordResultCopyWithImpl<$Res,
        _$CheckUserPasswordResultImpl>
    implements _$$CheckUserPasswordResultImplCopyWith<$Res> {
  __$$CheckUserPasswordResultImplCopyWithImpl(
      _$CheckUserPasswordResultImpl _value,
      $Res Function(_$CheckUserPasswordResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckUserPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSetPassword = null,
  }) {
    return _then(_$CheckUserPasswordResultImpl(
      isSetPassword: null == isSetPassword
          ? _value.isSetPassword
          : isSetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckUserPasswordResultImpl implements _CheckUserPasswordResult {
  const _$CheckUserPasswordResultImpl(
      {@JsonKey(name: 'is_set_password') required this.isSetPassword});

  factory _$CheckUserPasswordResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckUserPasswordResultImplFromJson(json);

  @override
  @JsonKey(name: 'is_set_password')
  final bool isSetPassword;

  @override
  String toString() {
    return 'CheckUserPasswordResult(isSetPassword: $isSetPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserPasswordResultImpl &&
            (identical(other.isSetPassword, isSetPassword) ||
                other.isSetPassword == isSetPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isSetPassword);

  /// Create a copy of CheckUserPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserPasswordResultImplCopyWith<_$CheckUserPasswordResultImpl>
      get copyWith => __$$CheckUserPasswordResultImplCopyWithImpl<
          _$CheckUserPasswordResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckUserPasswordResultImplToJson(
      this,
    );
  }
}

abstract class _CheckUserPasswordResult implements CheckUserPasswordResult {
  const factory _CheckUserPasswordResult(
      {@JsonKey(name: 'is_set_password')
      required final bool isSetPassword}) = _$CheckUserPasswordResultImpl;

  factory _CheckUserPasswordResult.fromJson(Map<String, dynamic> json) =
      _$CheckUserPasswordResultImpl.fromJson;

  @override
  @JsonKey(name: 'is_set_password')
  bool get isSetPassword;

  /// Create a copy of CheckUserPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserPasswordResultImplCopyWith<_$CheckUserPasswordResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckUserPasswordRequest _$CheckUserPasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _CheckUserPasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckUserPasswordRequest {
  @JsonKey(name: 'msisdn')
  String get msisdn => throw _privateConstructorUsedError;

  /// Serializes this CheckUserPasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckUserPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckUserPasswordRequestCopyWith<CheckUserPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserPasswordRequestCopyWith<$Res> {
  factory $CheckUserPasswordRequestCopyWith(CheckUserPasswordRequest value,
          $Res Function(CheckUserPasswordRequest) then) =
      _$CheckUserPasswordRequestCopyWithImpl<$Res, CheckUserPasswordRequest>;
  @useResult
  $Res call({@JsonKey(name: 'msisdn') String msisdn});
}

/// @nodoc
class _$CheckUserPasswordRequestCopyWithImpl<$Res,
        $Val extends CheckUserPasswordRequest>
    implements $CheckUserPasswordRequestCopyWith<$Res> {
  _$CheckUserPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckUserPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = null,
  }) {
    return _then(_value.copyWith(
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckUserPasswordRequestImplCopyWith<$Res>
    implements $CheckUserPasswordRequestCopyWith<$Res> {
  factory _$$CheckUserPasswordRequestImplCopyWith(
          _$CheckUserPasswordRequestImpl value,
          $Res Function(_$CheckUserPasswordRequestImpl) then) =
      __$$CheckUserPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'msisdn') String msisdn});
}

/// @nodoc
class __$$CheckUserPasswordRequestImplCopyWithImpl<$Res>
    extends _$CheckUserPasswordRequestCopyWithImpl<$Res,
        _$CheckUserPasswordRequestImpl>
    implements _$$CheckUserPasswordRequestImplCopyWith<$Res> {
  __$$CheckUserPasswordRequestImplCopyWithImpl(
      _$CheckUserPasswordRequestImpl _value,
      $Res Function(_$CheckUserPasswordRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckUserPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = null,
  }) {
    return _then(_$CheckUserPasswordRequestImpl(
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckUserPasswordRequestImpl implements _CheckUserPasswordRequest {
  const _$CheckUserPasswordRequestImpl(
      {@JsonKey(name: 'msisdn') required this.msisdn});

  factory _$CheckUserPasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckUserPasswordRequestImplFromJson(json);

  @override
  @JsonKey(name: 'msisdn')
  final String msisdn;

  @override
  String toString() {
    return 'CheckUserPasswordRequest(msisdn: $msisdn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserPasswordRequestImpl &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, msisdn);

  /// Create a copy of CheckUserPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserPasswordRequestImplCopyWith<_$CheckUserPasswordRequestImpl>
      get copyWith => __$$CheckUserPasswordRequestImplCopyWithImpl<
          _$CheckUserPasswordRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckUserPasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _CheckUserPasswordRequest implements CheckUserPasswordRequest {
  const factory _CheckUserPasswordRequest(
          {@JsonKey(name: 'msisdn') required final String msisdn}) =
      _$CheckUserPasswordRequestImpl;

  factory _CheckUserPasswordRequest.fromJson(Map<String, dynamic> json) =
      _$CheckUserPasswordRequestImpl.fromJson;

  @override
  @JsonKey(name: 'msisdn')
  String get msisdn;

  /// Create a copy of CheckUserPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserPasswordRequestImplCopyWith<_$CheckUserPasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
