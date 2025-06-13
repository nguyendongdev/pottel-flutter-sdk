// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrder _$CreateOrderFromJson(Map<String, dynamic> json) {
  return _CreateOrder.fromJson(json);
}

/// @nodoc
mixin _$CreateOrder {
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_amount')
  int? get shippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_phone')
  String? get contactPhone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int? get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ward_id')
  int? get wardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  int? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_from_cart_id')
  int? get createFromCartId => throw _privateConstructorUsedError;
  List<Item>? get items => throw _privateConstructorUsedError;

  /// Serializes this CreateOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrderCopyWith<CreateOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderCopyWith<$Res> {
  factory $CreateOrderCopyWith(
          CreateOrder value, $Res Function(CreateOrder) then) =
      _$CreateOrderCopyWithImpl<$Res, CreateOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String? deliveryAddress,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'discount_amount') int? discountAmount,
      @JsonKey(name: 'shipping_amount') int? shippingAmount,
      @JsonKey(name: 'contact_phone') String? contactPhone,
      String? email,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'district_id') int? districtId,
      @JsonKey(name: 'ward_id') int? wardId,
      @JsonKey(name: 'created_by') String? createdBy,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'total_amount') int? totalAmount,
      @JsonKey(name: 'create_from_cart_id') int? createFromCartId,
      List<Item>? items});
}

/// @nodoc
class _$CreateOrderCopyWithImpl<$Res, $Val extends CreateOrder>
    implements $CreateOrderCopyWith<$Res> {
  _$CreateOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = freezed,
    Object? paymentMethod = freezed,
    Object? discountAmount = freezed,
    Object? shippingAmount = freezed,
    Object? contactPhone = freezed,
    Object? email = freezed,
    Object? cityId = freezed,
    Object? districtId = freezed,
    Object? wardId = freezed,
    Object? createdBy = freezed,
    Object? customerName = freezed,
    Object? totalAmount = freezed,
    Object? createFromCartId = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAmount: freezed == shippingAmount
          ? _value.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      wardId: freezed == wardId
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      createFromCartId: freezed == createFromCartId
          ? _value.createFromCartId
          : createFromCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderImplCopyWith<$Res>
    implements $CreateOrderCopyWith<$Res> {
  factory _$$CreateOrderImplCopyWith(
          _$CreateOrderImpl value, $Res Function(_$CreateOrderImpl) then) =
      __$$CreateOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_address') String? deliveryAddress,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'discount_amount') int? discountAmount,
      @JsonKey(name: 'shipping_amount') int? shippingAmount,
      @JsonKey(name: 'contact_phone') String? contactPhone,
      String? email,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'district_id') int? districtId,
      @JsonKey(name: 'ward_id') int? wardId,
      @JsonKey(name: 'created_by') String? createdBy,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'total_amount') int? totalAmount,
      @JsonKey(name: 'create_from_cart_id') int? createFromCartId,
      List<Item>? items});
}

/// @nodoc
class __$$CreateOrderImplCopyWithImpl<$Res>
    extends _$CreateOrderCopyWithImpl<$Res, _$CreateOrderImpl>
    implements _$$CreateOrderImplCopyWith<$Res> {
  __$$CreateOrderImplCopyWithImpl(
      _$CreateOrderImpl _value, $Res Function(_$CreateOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryAddress = freezed,
    Object? paymentMethod = freezed,
    Object? discountAmount = freezed,
    Object? shippingAmount = freezed,
    Object? contactPhone = freezed,
    Object? email = freezed,
    Object? cityId = freezed,
    Object? districtId = freezed,
    Object? wardId = freezed,
    Object? createdBy = freezed,
    Object? customerName = freezed,
    Object? totalAmount = freezed,
    Object? createFromCartId = freezed,
    Object? items = freezed,
  }) {
    return _then(_$CreateOrderImpl(
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAmount: freezed == shippingAmount
          ? _value.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int?,
      wardId: freezed == wardId
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      createFromCartId: freezed == createFromCartId
          ? _value.createFromCartId
          : createFromCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderImpl implements _CreateOrder {
  _$CreateOrderImpl(
      {@JsonKey(name: 'delivery_address') this.deliveryAddress,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'discount_amount') this.discountAmount,
      @JsonKey(name: 'shipping_amount') this.shippingAmount,
      @JsonKey(name: 'contact_phone') this.contactPhone,
      this.email,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'district_id') this.districtId,
      @JsonKey(name: 'ward_id') this.wardId,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'total_amount') this.totalAmount,
      @JsonKey(name: 'create_from_cart_id') this.createFromCartId,
      final List<Item>? items})
      : _items = items;

  factory _$CreateOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_address')
  final String? deliveryAddress;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'discount_amount')
  final int? discountAmount;
  @override
  @JsonKey(name: 'shipping_amount')
  final int? shippingAmount;
  @override
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'district_id')
  final int? districtId;
  @override
  @JsonKey(name: 'ward_id')
  final int? wardId;
  @override
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'total_amount')
  final int? totalAmount;
  @override
  @JsonKey(name: 'create_from_cart_id')
  final int? createFromCartId;
  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateOrder(deliveryAddress: $deliveryAddress, paymentMethod: $paymentMethod, discountAmount: $discountAmount, shippingAmount: $shippingAmount, contactPhone: $contactPhone, email: $email, cityId: $cityId, districtId: $districtId, wardId: $wardId, createdBy: $createdBy, customerName: $customerName, totalAmount: $totalAmount, createFromCartId: $createFromCartId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderImpl &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.wardId, wardId) || other.wardId == wardId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.createFromCartId, createFromCartId) ||
                other.createFromCartId == createFromCartId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryAddress,
      paymentMethod,
      discountAmount,
      shippingAmount,
      contactPhone,
      email,
      cityId,
      districtId,
      wardId,
      createdBy,
      customerName,
      totalAmount,
      createFromCartId,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of CreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      __$$CreateOrderImplCopyWithImpl<_$CreateOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderImplToJson(
      this,
    );
  }
}

abstract class _CreateOrder implements CreateOrder {
  factory _CreateOrder(
      {@JsonKey(name: 'delivery_address') final String? deliveryAddress,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      @JsonKey(name: 'discount_amount') final int? discountAmount,
      @JsonKey(name: 'shipping_amount') final int? shippingAmount,
      @JsonKey(name: 'contact_phone') final String? contactPhone,
      final String? email,
      @JsonKey(name: 'city_id') final int? cityId,
      @JsonKey(name: 'district_id') final int? districtId,
      @JsonKey(name: 'ward_id') final int? wardId,
      @JsonKey(name: 'created_by') final String? createdBy,
      @JsonKey(name: 'customer_name') final String? customerName,
      @JsonKey(name: 'total_amount') final int? totalAmount,
      @JsonKey(name: 'create_from_cart_id') final int? createFromCartId,
      final List<Item>? items}) = _$CreateOrderImpl;

  factory _CreateOrder.fromJson(Map<String, dynamic> json) =
      _$CreateOrderImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'discount_amount')
  int? get discountAmount;
  @override
  @JsonKey(name: 'shipping_amount')
  int? get shippingAmount;
  @override
  @JsonKey(name: 'contact_phone')
  String? get contactPhone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'district_id')
  int? get districtId;
  @override
  @JsonKey(name: 'ward_id')
  int? get wardId;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'total_amount')
  int? get totalAmount;
  @override
  @JsonKey(name: 'create_from_cart_id')
  int? get createFromCartId;
  @override
  List<Item>? get items;

  /// Create a copy of CreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
