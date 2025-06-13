// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  @JsonKey(name: 'requestId')
  String? get requestId => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int get totalRecords => throw _privateConstructorUsedError;
  CartResult get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) then) =
      _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      CartResult result,
      dynamic extra});

  $CartResultCopyWith<$Res> get result;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
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
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CartResult,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartResultCopyWith<$Res> get result {
    return $CartResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartResponseImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$CartResponseImplCopyWith(
          _$CartResponseImpl value, $Res Function(_$CartResponseImpl) then) =
      __$$CartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int totalRecords,
      CartResult result,
      dynamic extra});

  @override
  $CartResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$CartResponseImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$CartResponseImpl>
    implements _$$CartResponseImplCopyWith<$Res> {
  __$$CartResponseImplCopyWithImpl(
      _$CartResponseImpl _value, $Res Function(_$CartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? result = null,
    Object? extra = freezed,
  }) {
    return _then(_$CartResponseImpl(
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CartResult,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResponseImpl implements _CartResponse {
  const _$CartResponseImpl(
      {@JsonKey(name: 'requestId') this.requestId,
      required this.code,
      required this.message,
      @JsonKey(name: 'totalRecords') required this.totalRecords,
      required this.result,
      this.extra});

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResponseImplFromJson(json);

  @override
  @JsonKey(name: 'requestId')
  final String? requestId;
  @override
  final int code;
  @override
  final String message;
  @override
  @JsonKey(name: 'totalRecords')
  final int totalRecords;
  @override
  final CartResult result;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'CartResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseImpl &&
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

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      __$$CartResponseImplCopyWithImpl<_$CartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseImplToJson(
      this,
    );
  }
}

abstract class _CartResponse implements CartResponse {
  const factory _CartResponse(
      {@JsonKey(name: 'requestId') final String? requestId,
      required final int code,
      required final String message,
      @JsonKey(name: 'totalRecords') required final int totalRecords,
      required final CartResult result,
      final dynamic extra}) = _$CartResponseImpl;

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$CartResponseImpl.fromJson;

  @override
  @JsonKey(name: 'requestId')
  String? get requestId;
  @override
  int get code;
  @override
  String get message;
  @override
  @JsonKey(name: 'totalRecords')
  int get totalRecords;
  @override
  CartResult get result;
  @override
  dynamic get extra;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartResult _$CartResultFromJson(Map<String, dynamic> json) {
  return _CartResult.fromJson(json);
}

/// @nodoc
mixin _$CartResult {
  @JsonKey(name: 'cart_id')
  int get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;

  /// Serializes this CartResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResultCopyWith<CartResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResultCopyWith<$Res> {
  factory $CartResultCopyWith(
          CartResult value, $Res Function(CartResult) then) =
      _$CartResultCopyWithImpl<$Res, CartResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cart_id') int cartId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      List<CartItem> items});
}

/// @nodoc
class _$CartResultCopyWithImpl<$Res, $Val extends CartResult>
    implements $CartResultCopyWith<$Res> {
  _$CartResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartResultImplCopyWith<$Res>
    implements $CartResultCopyWith<$Res> {
  factory _$$CartResultImplCopyWith(
          _$CartResultImpl value, $Res Function(_$CartResultImpl) then) =
      __$$CartResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cart_id') int cartId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      List<CartItem> items});
}

/// @nodoc
class __$$CartResultImplCopyWithImpl<$Res>
    extends _$CartResultCopyWithImpl<$Res, _$CartResultImpl>
    implements _$$CartResultImplCopyWith<$Res> {
  __$$CartResultImplCopyWithImpl(
      _$CartResultImpl _value, $Res Function(_$CartResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = null,
    Object? items = null,
  }) {
    return _then(_$CartResultImpl(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResultImpl implements _CartResult {
  const _$CartResultImpl(
      {@JsonKey(name: 'cart_id') required this.cartId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'expires_at') required this.expiresAt,
      required final List<CartItem> items})
      : _items = items;

  factory _$CartResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResultImplFromJson(json);

  @override
  @JsonKey(name: 'cart_id')
  final int cartId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartResult(cartId: $cartId, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResultImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartId, createdAt, updatedAt,
      expiresAt, const DeepCollectionEquality().hash(_items));

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResultImplCopyWith<_$CartResultImpl> get copyWith =>
      __$$CartResultImplCopyWithImpl<_$CartResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResultImplToJson(
      this,
    );
  }
}

abstract class _CartResult implements CartResult {
  const factory _CartResult(
      {@JsonKey(name: 'cart_id') required final int cartId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'expires_at') required final DateTime expiresAt,
      required final List<CartItem> items}) = _$CartResultImpl;

  factory _CartResult.fromJson(Map<String, dynamic> json) =
      _$CartResultImpl.fromJson;

  @override
  @JsonKey(name: 'cart_id')
  int get cartId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  List<CartItem> get items;

  /// Create a copy of CartResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResultImplCopyWith<_$CartResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(name: 'cart_id')
  int get cartId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sim_type')
  String get simType => throw _privateConstructorUsedError;
  @JsonKey(name: 'region_id')
  int get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_code')
  String get packCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  double get salePrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_price')
  double get packPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sim_price')
  double get simPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cart_id') int cartId,
      int id,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'sim_type') String simType,
      @JsonKey(name: 'region_id') int regionId,
      @JsonKey(name: 'pack_code') String packCode,
      @JsonKey(name: 'sale_price') double salePrice,
      int quantity,
      @JsonKey(name: 'pack_price') double packPrice,
      @JsonKey(name: 'sim_price') double simPrice,
      @JsonKey(name: 'msisdn_id') int? msisdnId,
      @JsonKey(name: 'total_price') double totalPrice,
      @JsonKey(name: 'icon') String icon});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? id = null,
    Object? productName = null,
    Object? productId = null,
    Object? simType = null,
    Object? regionId = null,
    Object? packCode = null,
    Object? salePrice = null,
    Object? quantity = null,
    Object? packPrice = null,
    Object? simPrice = null,
    Object? msisdnId = freezed,
    Object? totalPrice = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      simType: null == simType
          ? _value.simType
          : simType // ignore: cast_nullable_to_non_nullable
              as String,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      packCode: null == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      packPrice: null == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as double,
      simPrice: null == simPrice
          ? _value.simPrice
          : simPrice // ignore: cast_nullable_to_non_nullable
              as double,
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cart_id') int cartId,
      int id,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'sim_type') String simType,
      @JsonKey(name: 'region_id') int regionId,
      @JsonKey(name: 'pack_code') String packCode,
      @JsonKey(name: 'sale_price') double salePrice,
      int quantity,
      @JsonKey(name: 'pack_price') double packPrice,
      @JsonKey(name: 'sim_price') double simPrice,
      @JsonKey(name: 'msisdn_id') int? msisdnId,
      @JsonKey(name: 'total_price') double totalPrice,
      @JsonKey(name: 'icon') String icon});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? id = null,
    Object? productName = null,
    Object? productId = null,
    Object? simType = null,
    Object? regionId = null,
    Object? packCode = null,
    Object? salePrice = null,
    Object? quantity = null,
    Object? packPrice = null,
    Object? simPrice = null,
    Object? msisdnId = freezed,
    Object? totalPrice = null,
    Object? icon = null,
  }) {
    return _then(_$CartItemImpl(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      simType: null == simType
          ? _value.simType
          : simType // ignore: cast_nullable_to_non_nullable
              as String,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      packCode: null == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      packPrice: null == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as double,
      simPrice: null == simPrice
          ? _value.simPrice
          : simPrice // ignore: cast_nullable_to_non_nullable
              as double,
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {@JsonKey(name: 'cart_id') required this.cartId,
      required this.id,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'sim_type') required this.simType,
      @JsonKey(name: 'region_id') required this.regionId,
      @JsonKey(name: 'pack_code') required this.packCode,
      @JsonKey(name: 'sale_price') required this.salePrice,
      required this.quantity,
      @JsonKey(name: 'pack_price') required this.packPrice,
      @JsonKey(name: 'sim_price') required this.simPrice,
      @JsonKey(name: 'msisdn_id') this.msisdnId,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'icon') required this.icon});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(name: 'cart_id')
  final int cartId;
  @override
  final int id;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'sim_type')
  final String simType;
  @override
  @JsonKey(name: 'region_id')
  final int regionId;
  @override
  @JsonKey(name: 'pack_code')
  final String packCode;
  @override
  @JsonKey(name: 'sale_price')
  final double salePrice;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'pack_price')
  final double packPrice;
  @override
  @JsonKey(name: 'sim_price')
  final double simPrice;
  @override
  @JsonKey(name: 'msisdn_id')
  final int? msisdnId;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  @JsonKey(name: 'icon')
  final String icon;

  @override
  String toString() {
    return 'CartItem(cartId: $cartId, id: $id, productName: $productName, productId: $productId, simType: $simType, regionId: $regionId, packCode: $packCode, salePrice: $salePrice, quantity: $quantity, packPrice: $packPrice, simPrice: $simPrice, msisdnId: $msisdnId, totalPrice: $totalPrice, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.simType, simType) || other.simType == simType) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.packCode, packCode) ||
                other.packCode == packCode) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.packPrice, packPrice) ||
                other.packPrice == packPrice) &&
            (identical(other.simPrice, simPrice) ||
                other.simPrice == simPrice) &&
            (identical(other.msisdnId, msisdnId) ||
                other.msisdnId == msisdnId) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartId,
      id,
      productName,
      productId,
      simType,
      regionId,
      packCode,
      salePrice,
      quantity,
      packPrice,
      simPrice,
      msisdnId,
      totalPrice,
      icon);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {@JsonKey(name: 'cart_id') required final int cartId,
      required final int id,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'product_id') required final int productId,
      @JsonKey(name: 'sim_type') required final String simType,
      @JsonKey(name: 'region_id') required final int regionId,
      @JsonKey(name: 'pack_code') required final String packCode,
      @JsonKey(name: 'sale_price') required final double salePrice,
      required final int quantity,
      @JsonKey(name: 'pack_price') required final double packPrice,
      @JsonKey(name: 'sim_price') required final double simPrice,
      @JsonKey(name: 'msisdn_id') final int? msisdnId,
      @JsonKey(name: 'total_price') required final double totalPrice,
      @JsonKey(name: 'icon') required final String icon}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(name: 'cart_id')
  int get cartId;
  @override
  int get id;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'sim_type')
  String get simType;
  @override
  @JsonKey(name: 'region_id')
  int get regionId;
  @override
  @JsonKey(name: 'pack_code')
  String get packCode;
  @override
  @JsonKey(name: 'sale_price')
  double get salePrice;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'pack_price')
  double get packPrice;
  @override
  @JsonKey(name: 'sim_price')
  double get simPrice;
  @override
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  @JsonKey(name: 'icon')
  String get icon;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
