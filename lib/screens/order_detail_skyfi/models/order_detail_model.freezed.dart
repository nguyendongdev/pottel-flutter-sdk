// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  @JsonKey(name: 'order_code')
  String get orderCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_usim')
  int get totalUsim => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_esim')
  int get totalEsim => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_esim_travel')
  int get totalEsimTravel => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_code') String orderCode,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'total_usim') int totalUsim,
      @JsonKey(name: 'total_esim') int totalEsim,
      @JsonKey(name: 'total_esim_travel') int totalEsimTravel});
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCode = null,
    Object? createdAt = null,
    Object? totalAmount = null,
    Object? totalUsim = null,
    Object? totalEsim = null,
    Object? totalEsimTravel = null,
  }) {
    return _then(_value.copyWith(
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalUsim: null == totalUsim
          ? _value.totalUsim
          : totalUsim // ignore: cast_nullable_to_non_nullable
              as int,
      totalEsim: null == totalEsim
          ? _value.totalEsim
          : totalEsim // ignore: cast_nullable_to_non_nullable
              as int,
      totalEsimTravel: null == totalEsimTravel
          ? _value.totalEsimTravel
          : totalEsimTravel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(_$OrderDetailModelImpl value,
          $Res Function(_$OrderDetailModelImpl) then) =
      __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_code') String orderCode,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'total_usim') int totalUsim,
      @JsonKey(name: 'total_esim') int totalEsim,
      @JsonKey(name: 'total_esim_travel') int totalEsimTravel});
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(_$OrderDetailModelImpl _value,
      $Res Function(_$OrderDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCode = null,
    Object? createdAt = null,
    Object? totalAmount = null,
    Object? totalUsim = null,
    Object? totalEsim = null,
    Object? totalEsimTravel = null,
  }) {
    return _then(_$OrderDetailModelImpl(
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalUsim: null == totalUsim
          ? _value.totalUsim
          : totalUsim // ignore: cast_nullable_to_non_nullable
              as int,
      totalEsim: null == totalEsim
          ? _value.totalEsim
          : totalEsim // ignore: cast_nullable_to_non_nullable
              as int,
      totalEsimTravel: null == totalEsimTravel
          ? _value.totalEsimTravel
          : totalEsimTravel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailModelImpl implements _OrderDetailModel {
  const _$OrderDetailModelImpl(
      {@JsonKey(name: 'order_code') required this.orderCode,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'total_usim') required this.totalUsim,
      @JsonKey(name: 'total_esim') required this.totalEsim,
      @JsonKey(name: 'total_esim_travel') required this.totalEsimTravel});

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'order_code')
  final String orderCode;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'total_usim')
  final int totalUsim;
  @override
  @JsonKey(name: 'total_esim')
  final int totalEsim;
  @override
  @JsonKey(name: 'total_esim_travel')
  final int totalEsimTravel;

  @override
  String toString() {
    return 'OrderDetailModel(orderCode: $orderCode, createdAt: $createdAt, totalAmount: $totalAmount, totalUsim: $totalUsim, totalEsim: $totalEsim, totalEsimTravel: $totalEsimTravel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
            (identical(other.orderCode, orderCode) ||
                other.orderCode == orderCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalUsim, totalUsim) ||
                other.totalUsim == totalUsim) &&
            (identical(other.totalEsim, totalEsim) ||
                other.totalEsim == totalEsim) &&
            (identical(other.totalEsimTravel, totalEsimTravel) ||
                other.totalEsimTravel == totalEsimTravel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderCode, createdAt,
      totalAmount, totalUsim, totalEsim, totalEsimTravel);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailModel implements OrderDetailModel {
  const factory _OrderDetailModel(
      {@JsonKey(name: 'order_code') required final String orderCode,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'total_usim') required final int totalUsim,
      @JsonKey(name: 'total_esim') required final int totalEsim,
      @JsonKey(name: 'total_esim_travel')
      required final int totalEsimTravel}) = _$OrderDetailModelImpl;

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'order_code')
  String get orderCode;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'total_usim')
  int get totalUsim;
  @override
  @JsonKey(name: 'total_esim')
  int get totalEsim;
  @override
  @JsonKey(name: 'total_esim_travel')
  int get totalEsimTravel;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailResponse _$OrderDetailResponseFromJson(Map<String, dynamic> json) {
  return _OrderDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailResponse {
  String? get requestId => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int? get totalRecords => throw _privateConstructorUsedError;
  OrderDetailResult get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailResponseCopyWith<OrderDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailResponseCopyWith<$Res> {
  factory $OrderDetailResponseCopyWith(
          OrderDetailResponse value, $Res Function(OrderDetailResponse) then) =
      _$OrderDetailResponseCopyWithImpl<$Res, OrderDetailResponse>;
  @useResult
  $Res call(
      {String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      OrderDetailResult result,
      dynamic extra});

  $OrderDetailResultCopyWith<$Res> get result;
}

/// @nodoc
class _$OrderDetailResponseCopyWithImpl<$Res, $Val extends OrderDetailResponse>
    implements $OrderDetailResponseCopyWith<$Res> {
  _$OrderDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = freezed,
    Object? result = null,
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
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as OrderDetailResult,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderDetailResultCopyWith<$Res> get result {
    return $OrderDetailResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailResponseImplCopyWith<$Res>
    implements $OrderDetailResponseCopyWith<$Res> {
  factory _$$OrderDetailResponseImplCopyWith(_$OrderDetailResponseImpl value,
          $Res Function(_$OrderDetailResponseImpl) then) =
      __$$OrderDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      OrderDetailResult result,
      dynamic extra});

  @override
  $OrderDetailResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$OrderDetailResponseImplCopyWithImpl<$Res>
    extends _$OrderDetailResponseCopyWithImpl<$Res, _$OrderDetailResponseImpl>
    implements _$$OrderDetailResponseImplCopyWith<$Res> {
  __$$OrderDetailResponseImplCopyWithImpl(_$OrderDetailResponseImpl _value,
      $Res Function(_$OrderDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = freezed,
    Object? result = null,
    Object? extra = freezed,
  }) {
    return _then(_$OrderDetailResponseImpl(
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
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as OrderDetailResult,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailResponseImpl implements _OrderDetailResponse {
  const _$OrderDetailResponseImpl(
      {this.requestId,
      required this.code,
      required this.message,
      @JsonKey(name: 'totalRecords') this.totalRecords,
      required this.result,
      this.extra});

  factory _$OrderDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailResponseImplFromJson(json);

  @override
  final String? requestId;
  @override
  final int code;
  @override
  final String message;
  @override
  @JsonKey(name: 'totalRecords')
  final int? totalRecords;
  @override
  final OrderDetailResult result;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'OrderDetailResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailResponseImpl &&
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

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      __$$OrderDetailResponseImplCopyWithImpl<_$OrderDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailResponse implements OrderDetailResponse {
  const factory _OrderDetailResponse(
      {final String? requestId,
      required final int code,
      required final String message,
      @JsonKey(name: 'totalRecords') final int? totalRecords,
      required final OrderDetailResult result,
      final dynamic extra}) = _$OrderDetailResponseImpl;

  factory _OrderDetailResponse.fromJson(Map<String, dynamic> json) =
      _$OrderDetailResponseImpl.fromJson;

  @override
  String? get requestId;
  @override
  int get code;
  @override
  String get message;
  @override
  @JsonKey(name: 'totalRecords')
  int? get totalRecords;
  @override
  OrderDetailResult get result;
  @override
  dynamic get extra;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailResult _$OrderDetailResultFromJson(Map<String, dynamic> json) {
  return _OrderDetailResult.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailResult {
  OrderDetailModel get order => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailResultCopyWith<OrderDetailResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailResultCopyWith<$Res> {
  factory $OrderDetailResultCopyWith(
          OrderDetailResult value, $Res Function(OrderDetailResult) then) =
      _$OrderDetailResultCopyWithImpl<$Res, OrderDetailResult>;
  @useResult
  $Res call({OrderDetailModel order});

  $OrderDetailModelCopyWith<$Res> get order;
}

/// @nodoc
class _$OrderDetailResultCopyWithImpl<$Res, $Val extends OrderDetailResult>
    implements $OrderDetailResultCopyWith<$Res> {
  _$OrderDetailResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetailModel,
    ) as $Val);
  }

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderDetailModelCopyWith<$Res> get order {
    return $OrderDetailModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailResultImplCopyWith<$Res>
    implements $OrderDetailResultCopyWith<$Res> {
  factory _$$OrderDetailResultImplCopyWith(_$OrderDetailResultImpl value,
          $Res Function(_$OrderDetailResultImpl) then) =
      __$$OrderDetailResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderDetailModel order});

  @override
  $OrderDetailModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$OrderDetailResultImplCopyWithImpl<$Res>
    extends _$OrderDetailResultCopyWithImpl<$Res, _$OrderDetailResultImpl>
    implements _$$OrderDetailResultImplCopyWith<$Res> {
  __$$OrderDetailResultImplCopyWithImpl(_$OrderDetailResultImpl _value,
      $Res Function(_$OrderDetailResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$OrderDetailResultImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetailModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailResultImpl implements _OrderDetailResult {
  const _$OrderDetailResultImpl({required this.order});

  factory _$OrderDetailResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailResultImplFromJson(json);

  @override
  final OrderDetailModel order;

  @override
  String toString() {
    return 'OrderDetailResult(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailResultImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailResultImplCopyWith<_$OrderDetailResultImpl> get copyWith =>
      __$$OrderDetailResultImplCopyWithImpl<_$OrderDetailResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailResultImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailResult implements OrderDetailResult {
  const factory _OrderDetailResult({required final OrderDetailModel order}) =
      _$OrderDetailResultImpl;

  factory _OrderDetailResult.fromJson(Map<String, dynamic> json) =
      _$OrderDetailResultImpl.fromJson;

  @override
  OrderDetailModel get order;

  /// Create a copy of OrderDetailResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailResultImplCopyWith<_$OrderDetailResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
