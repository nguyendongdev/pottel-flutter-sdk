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
  @JsonKey(name: 'iframeUrl')
  String? get iframeUrl => throw _privateConstructorUsedError;
  String? get redirectUrl => throw _privateConstructorUsedError;
  String? get orderNumber => throw _privateConstructorUsedError;
  String? get orderCode => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get baseUrl => throw _privateConstructorUsedError;
  String? get socketUrl => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get showPTTT => throw _privateConstructorUsedError;
  int? get expireIn => throw _privateConstructorUsedError;
  int? get orderAmount => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'iframeUrl') String? iframeUrl,
      String? redirectUrl,
      String? orderNumber,
      String? orderCode,
      String? token,
      String? baseUrl,
      String? socketUrl,
      String? requestId,
      String? paymentId,
      int? amount,
      String? showPTTT,
      int? expireIn,
      int? orderAmount});
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
    Object? iframeUrl = freezed,
    Object? redirectUrl = freezed,
    Object? orderNumber = freezed,
    Object? orderCode = freezed,
    Object? token = freezed,
    Object? baseUrl = freezed,
    Object? socketUrl = freezed,
    Object? requestId = freezed,
    Object? paymentId = freezed,
    Object? amount = freezed,
    Object? showPTTT = freezed,
    Object? expireIn = freezed,
    Object? orderAmount = freezed,
  }) {
    return _then(_value.copyWith(
      iframeUrl: freezed == iframeUrl
          ? _value.iframeUrl
          : iframeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCode: freezed == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      socketUrl: freezed == socketUrl
          ? _value.socketUrl
          : socketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      showPTTT: freezed == showPTTT
          ? _value.showPTTT
          : showPTTT // ignore: cast_nullable_to_non_nullable
              as String?,
      expireIn: freezed == expireIn
          ? _value.expireIn
          : expireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      orderAmount: freezed == orderAmount
          ? _value.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'iframeUrl') String? iframeUrl,
      String? redirectUrl,
      String? orderNumber,
      String? orderCode,
      String? token,
      String? baseUrl,
      String? socketUrl,
      String? requestId,
      String? paymentId,
      int? amount,
      String? showPTTT,
      int? expireIn,
      int? orderAmount});
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
    Object? iframeUrl = freezed,
    Object? redirectUrl = freezed,
    Object? orderNumber = freezed,
    Object? orderCode = freezed,
    Object? token = freezed,
    Object? baseUrl = freezed,
    Object? socketUrl = freezed,
    Object? requestId = freezed,
    Object? paymentId = freezed,
    Object? amount = freezed,
    Object? showPTTT = freezed,
    Object? expireIn = freezed,
    Object? orderAmount = freezed,
  }) {
    return _then(_$ResultImpl(
      iframeUrl: freezed == iframeUrl
          ? _value.iframeUrl
          : iframeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCode: freezed == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      socketUrl: freezed == socketUrl
          ? _value.socketUrl
          : socketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      showPTTT: freezed == showPTTT
          ? _value.showPTTT
          : showPTTT // ignore: cast_nullable_to_non_nullable
              as String?,
      expireIn: freezed == expireIn
          ? _value.expireIn
          : expireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      orderAmount: freezed == orderAmount
          ? _value.orderAmount
          : orderAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  _$ResultImpl(
      {@JsonKey(name: 'iframeUrl') this.iframeUrl,
      this.redirectUrl,
      this.orderNumber,
      this.orderCode,
      this.token,
      this.baseUrl,
      this.socketUrl,
      this.requestId,
      this.paymentId,
      this.amount,
      this.showPTTT,
      this.expireIn,
      this.orderAmount});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  @JsonKey(name: 'iframeUrl')
  final String? iframeUrl;
  @override
  final String? redirectUrl;
  @override
  final String? orderNumber;
  @override
  final String? orderCode;
  @override
  final String? token;
  @override
  final String? baseUrl;
  @override
  final String? socketUrl;
  @override
  final String? requestId;
  @override
  final String? paymentId;
  @override
  final int? amount;
  @override
  final String? showPTTT;
  @override
  final int? expireIn;
  @override
  final int? orderAmount;

  @override
  String toString() {
    return 'Result(iframeUrl: $iframeUrl, redirectUrl: $redirectUrl, orderNumber: $orderNumber, orderCode: $orderCode, token: $token, baseUrl: $baseUrl, socketUrl: $socketUrl, requestId: $requestId, paymentId: $paymentId, amount: $amount, showPTTT: $showPTTT, expireIn: $expireIn, orderAmount: $orderAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.iframeUrl, iframeUrl) ||
                other.iframeUrl == iframeUrl) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderCode, orderCode) ||
                other.orderCode == orderCode) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.socketUrl, socketUrl) ||
                other.socketUrl == socketUrl) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.showPTTT, showPTTT) ||
                other.showPTTT == showPTTT) &&
            (identical(other.expireIn, expireIn) ||
                other.expireIn == expireIn) &&
            (identical(other.orderAmount, orderAmount) ||
                other.orderAmount == orderAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      iframeUrl,
      redirectUrl,
      orderNumber,
      orderCode,
      token,
      baseUrl,
      socketUrl,
      requestId,
      paymentId,
      amount,
      showPTTT,
      expireIn,
      orderAmount);

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
      {@JsonKey(name: 'iframeUrl') final String? iframeUrl,
      final String? redirectUrl,
      final String? orderNumber,
      final String? orderCode,
      final String? token,
      final String? baseUrl,
      final String? socketUrl,
      final String? requestId,
      final String? paymentId,
      final int? amount,
      final String? showPTTT,
      final int? expireIn,
      final int? orderAmount}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  @JsonKey(name: 'iframeUrl')
  String? get iframeUrl;
  @override
  String? get redirectUrl;
  @override
  String? get orderNumber;
  @override
  String? get orderCode;
  @override
  String? get token;
  @override
  String? get baseUrl;
  @override
  String? get socketUrl;
  @override
  String? get requestId;
  @override
  String? get paymentId;
  @override
  int? get amount;
  @override
  String? get showPTTT;
  @override
  int? get expireIn;
  @override
  int? get orderAmount;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
