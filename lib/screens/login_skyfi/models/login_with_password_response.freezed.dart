// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginWithPasswordResponse _$LoginWithPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _LoginWithPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginWithPasswordResponse {
  @JsonKey(name: 'requestId', nullable: true)
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'result', nullable: true)
  LoginWithPasswordResult? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra', nullable: true)
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this LoginWithPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginWithPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginWithPasswordResponseCopyWith<LoginWithPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithPasswordResponseCopyWith<$Res> {
  factory $LoginWithPasswordResponseCopyWith(LoginWithPasswordResponse value,
          $Res Function(LoginWithPasswordResponse) then) =
      _$LoginWithPasswordResponseCopyWithImpl<$Res, LoginWithPasswordResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId', nullable: true) String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result', nullable: true) LoginWithPasswordResult? result,
      @JsonKey(name: 'extra', nullable: true) dynamic extra});

  $LoginWithPasswordResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$LoginWithPasswordResponseCopyWithImpl<$Res,
        $Val extends LoginWithPasswordResponse>
    implements $LoginWithPasswordResponseCopyWith<$Res> {
  _$LoginWithPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginWithPasswordResponse
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
              as LoginWithPasswordResult?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of LoginWithPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginWithPasswordResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $LoginWithPasswordResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginWithPasswordResponseImplCopyWith<$Res>
    implements $LoginWithPasswordResponseCopyWith<$Res> {
  factory _$$LoginWithPasswordResponseImplCopyWith(
          _$LoginWithPasswordResponseImpl value,
          $Res Function(_$LoginWithPasswordResponseImpl) then) =
      __$$LoginWithPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId', nullable: true) String? requestId,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      @JsonKey(name: 'result', nullable: true) LoginWithPasswordResult? result,
      @JsonKey(name: 'extra', nullable: true) dynamic extra});

  @override
  $LoginWithPasswordResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$LoginWithPasswordResponseImplCopyWithImpl<$Res>
    extends _$LoginWithPasswordResponseCopyWithImpl<$Res,
        _$LoginWithPasswordResponseImpl>
    implements _$$LoginWithPasswordResponseImplCopyWith<$Res> {
  __$$LoginWithPasswordResponseImplCopyWithImpl(
      _$LoginWithPasswordResponseImpl _value,
      $Res Function(_$LoginWithPasswordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginWithPasswordResponse
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
    return _then(_$LoginWithPasswordResponseImpl(
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
              as LoginWithPasswordResult?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithPasswordResponseImpl implements _LoginWithPasswordResponse {
  const _$LoginWithPasswordResponseImpl(
      {@JsonKey(name: 'requestId', nullable: true) this.requestId,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'totalRecords') required this.totalRecords,
      @JsonKey(name: 'result', nullable: true) this.result,
      @JsonKey(name: 'extra', nullable: true) this.extra});

  factory _$LoginWithPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithPasswordResponseImplFromJson(json);

  @override
  @JsonKey(name: 'requestId', nullable: true)
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
  @JsonKey(name: 'result', nullable: true)
  final LoginWithPasswordResult? result;
  @override
  @JsonKey(name: 'extra', nullable: true)
  final dynamic extra;

  @override
  String toString() {
    return 'LoginWithPasswordResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPasswordResponseImpl &&
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

  /// Create a copy of LoginWithPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPasswordResponseImplCopyWith<_$LoginWithPasswordResponseImpl>
      get copyWith => __$$LoginWithPasswordResponseImplCopyWithImpl<
          _$LoginWithPasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginWithPasswordResponse implements LoginWithPasswordResponse {
  const factory _LoginWithPasswordResponse(
          {@JsonKey(name: 'requestId', nullable: true) final String? requestId,
          @JsonKey(name: 'code') required final int code,
          @JsonKey(name: 'message') required final String message,
          @JsonKey(name: 'totalRecords') required final int totalRecords,
          @JsonKey(name: 'result', nullable: true)
          final LoginWithPasswordResult? result,
          @JsonKey(name: 'extra', nullable: true) final dynamic extra}) =
      _$LoginWithPasswordResponseImpl;

  factory _LoginWithPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$LoginWithPasswordResponseImpl.fromJson;

  @override
  @JsonKey(name: 'requestId', nullable: true)
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
  @JsonKey(name: 'result', nullable: true)
  LoginWithPasswordResult? get result;
  @override
  @JsonKey(name: 'extra', nullable: true)
  dynamic get extra;

  /// Create a copy of LoginWithPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithPasswordResponseImplCopyWith<_$LoginWithPasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LoginWithPasswordResult _$LoginWithPasswordResultFromJson(
    Map<String, dynamic> json) {
  return _LoginWithPasswordResult.fromJson(json);
}

/// @nodoc
mixin _$LoginWithPasswordResult {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_expires_at')
  String get refreshExpiresAt => throw _privateConstructorUsedError;

  /// Serializes this LoginWithPasswordResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginWithPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginWithPasswordResultCopyWith<LoginWithPasswordResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithPasswordResultCopyWith<$Res> {
  factory $LoginWithPasswordResultCopyWith(LoginWithPasswordResult value,
          $Res Function(LoginWithPasswordResult) then) =
      _$LoginWithPasswordResultCopyWithImpl<$Res, LoginWithPasswordResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'expires_at') String expiresAt,
      @JsonKey(name: 'refresh_expires_at') String refreshExpiresAt});
}

/// @nodoc
class _$LoginWithPasswordResultCopyWithImpl<$Res,
        $Val extends LoginWithPasswordResult>
    implements $LoginWithPasswordResultCopyWith<$Res> {
  _$LoginWithPasswordResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginWithPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? phone = null,
    Object? expiresAt = null,
    Object? refreshExpiresAt = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      refreshExpiresAt: null == refreshExpiresAt
          ? _value.refreshExpiresAt
          : refreshExpiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginWithPasswordResultImplCopyWith<$Res>
    implements $LoginWithPasswordResultCopyWith<$Res> {
  factory _$$LoginWithPasswordResultImplCopyWith(
          _$LoginWithPasswordResultImpl value,
          $Res Function(_$LoginWithPasswordResultImpl) then) =
      __$$LoginWithPasswordResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'expires_at') String expiresAt,
      @JsonKey(name: 'refresh_expires_at') String refreshExpiresAt});
}

/// @nodoc
class __$$LoginWithPasswordResultImplCopyWithImpl<$Res>
    extends _$LoginWithPasswordResultCopyWithImpl<$Res,
        _$LoginWithPasswordResultImpl>
    implements _$$LoginWithPasswordResultImplCopyWith<$Res> {
  __$$LoginWithPasswordResultImplCopyWithImpl(
      _$LoginWithPasswordResultImpl _value,
      $Res Function(_$LoginWithPasswordResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginWithPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? phone = null,
    Object? expiresAt = null,
    Object? refreshExpiresAt = null,
  }) {
    return _then(_$LoginWithPasswordResultImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      refreshExpiresAt: null == refreshExpiresAt
          ? _value.refreshExpiresAt
          : refreshExpiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithPasswordResultImpl implements _LoginWithPasswordResult {
  const _$LoginWithPasswordResultImpl(
      {@JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'refresh_token') required this.refreshToken,
      @JsonKey(name: 'phone') required this.phone,
      @JsonKey(name: 'expires_at') required this.expiresAt,
      @JsonKey(name: 'refresh_expires_at') required this.refreshExpiresAt});

  factory _$LoginWithPasswordResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithPasswordResultImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'expires_at')
  final String expiresAt;
  @override
  @JsonKey(name: 'refresh_expires_at')
  final String refreshExpiresAt;

  @override
  String toString() {
    return 'LoginWithPasswordResult(token: $token, refreshToken: $refreshToken, phone: $phone, expiresAt: $expiresAt, refreshExpiresAt: $refreshExpiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPasswordResultImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.refreshExpiresAt, refreshExpiresAt) ||
                other.refreshExpiresAt == refreshExpiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, refreshToken, phone, expiresAt, refreshExpiresAt);

  /// Create a copy of LoginWithPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPasswordResultImplCopyWith<_$LoginWithPasswordResultImpl>
      get copyWith => __$$LoginWithPasswordResultImplCopyWithImpl<
          _$LoginWithPasswordResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithPasswordResultImplToJson(
      this,
    );
  }
}

abstract class _LoginWithPasswordResult implements LoginWithPasswordResult {
  const factory _LoginWithPasswordResult(
      {@JsonKey(name: 'token') required final String token,
      @JsonKey(name: 'refresh_token') required final String refreshToken,
      @JsonKey(name: 'phone') required final String phone,
      @JsonKey(name: 'expires_at') required final String expiresAt,
      @JsonKey(name: 'refresh_expires_at')
      required final String refreshExpiresAt}) = _$LoginWithPasswordResultImpl;

  factory _LoginWithPasswordResult.fromJson(Map<String, dynamic> json) =
      _$LoginWithPasswordResultImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'expires_at')
  String get expiresAt;
  @override
  @JsonKey(name: 'refresh_expires_at')
  String get refreshExpiresAt;

  /// Create a copy of LoginWithPasswordResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithPasswordResultImplCopyWith<_$LoginWithPasswordResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LoginWithPasswordRequest _$LoginWithPasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _LoginWithPasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginWithPasswordRequest {
  @JsonKey(name: 'msisdn')
  String get msisdn => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginWithPasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginWithPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginWithPasswordRequestCopyWith<LoginWithPasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithPasswordRequestCopyWith<$Res> {
  factory $LoginWithPasswordRequestCopyWith(LoginWithPasswordRequest value,
          $Res Function(LoginWithPasswordRequest) then) =
      _$LoginWithPasswordRequestCopyWithImpl<$Res, LoginWithPasswordRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'msisdn') String msisdn,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$LoginWithPasswordRequestCopyWithImpl<$Res,
        $Val extends LoginWithPasswordRequest>
    implements $LoginWithPasswordRequestCopyWith<$Res> {
  _$LoginWithPasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginWithPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginWithPasswordRequestImplCopyWith<$Res>
    implements $LoginWithPasswordRequestCopyWith<$Res> {
  factory _$$LoginWithPasswordRequestImplCopyWith(
          _$LoginWithPasswordRequestImpl value,
          $Res Function(_$LoginWithPasswordRequestImpl) then) =
      __$$LoginWithPasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'msisdn') String msisdn,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$$LoginWithPasswordRequestImplCopyWithImpl<$Res>
    extends _$LoginWithPasswordRequestCopyWithImpl<$Res,
        _$LoginWithPasswordRequestImpl>
    implements _$$LoginWithPasswordRequestImplCopyWith<$Res> {
  __$$LoginWithPasswordRequestImplCopyWithImpl(
      _$LoginWithPasswordRequestImpl _value,
      $Res Function(_$LoginWithPasswordRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginWithPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = null,
    Object? password = null,
  }) {
    return _then(_$LoginWithPasswordRequestImpl(
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithPasswordRequestImpl implements _LoginWithPasswordRequest {
  const _$LoginWithPasswordRequestImpl(
      {@JsonKey(name: 'msisdn') required this.msisdn,
      @JsonKey(name: 'password') required this.password});

  factory _$LoginWithPasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithPasswordRequestImplFromJson(json);

  @override
  @JsonKey(name: 'msisdn')
  final String msisdn;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'LoginWithPasswordRequest(msisdn: $msisdn, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPasswordRequestImpl &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, msisdn, password);

  /// Create a copy of LoginWithPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPasswordRequestImplCopyWith<_$LoginWithPasswordRequestImpl>
      get copyWith => __$$LoginWithPasswordRequestImplCopyWithImpl<
          _$LoginWithPasswordRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithPasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginWithPasswordRequest implements LoginWithPasswordRequest {
  const factory _LoginWithPasswordRequest(
          {@JsonKey(name: 'msisdn') required final String msisdn,
          @JsonKey(name: 'password') required final String password}) =
      _$LoginWithPasswordRequestImpl;

  factory _LoginWithPasswordRequest.fromJson(Map<String, dynamic> json) =
      _$LoginWithPasswordRequestImpl.fromJson;

  @override
  @JsonKey(name: 'msisdn')
  String get msisdn;
  @override
  @JsonKey(name: 'password')
  String get password;

  /// Create a copy of LoginWithPasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithPasswordRequestImplCopyWith<_$LoginWithPasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
