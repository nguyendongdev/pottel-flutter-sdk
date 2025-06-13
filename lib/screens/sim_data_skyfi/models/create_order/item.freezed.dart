// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'variant_id')
  int? get variantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_price')
  int? get packPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sim_price')
  int? get simPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  int? get salePrice => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'sim_type')
  String? get simType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_code')
  String? get packCode => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'variant_id') int? variantId,
      @JsonKey(name: 'msisdn_id') int? msisdnId,
      @JsonKey(name: 'pack_price') int? packPrice,
      @JsonKey(name: 'sim_price') int? simPrice,
      @JsonKey(name: 'sale_price') int? salePrice,
      int? quantity,
      @JsonKey(name: 'sim_type') String? simType,
      @JsonKey(name: 'pack_code') String? packCode});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? msisdnId = freezed,
    Object? packPrice = freezed,
    Object? simPrice = freezed,
    Object? salePrice = freezed,
    Object? quantity = freezed,
    Object? simType = freezed,
    Object? packCode = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      packPrice: freezed == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      simPrice: freezed == simPrice
          ? _value.simPrice
          : simPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      simType: freezed == simType
          ? _value.simType
          : simType // ignore: cast_nullable_to_non_nullable
              as String?,
      packCode: freezed == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'variant_id') int? variantId,
      @JsonKey(name: 'msisdn_id') int? msisdnId,
      @JsonKey(name: 'pack_price') int? packPrice,
      @JsonKey(name: 'sim_price') int? simPrice,
      @JsonKey(name: 'sale_price') int? salePrice,
      int? quantity,
      @JsonKey(name: 'sim_type') String? simType,
      @JsonKey(name: 'pack_code') String? packCode});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? msisdnId = freezed,
    Object? packPrice = freezed,
    Object? simPrice = freezed,
    Object? salePrice = freezed,
    Object? quantity = freezed,
    Object? simType = freezed,
    Object? packCode = freezed,
  }) {
    return _then(_$ItemImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      packPrice: freezed == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      simPrice: freezed == simPrice
          ? _value.simPrice
          : simPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      simType: freezed == simType
          ? _value.simType
          : simType // ignore: cast_nullable_to_non_nullable
              as String?,
      packCode: freezed == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {@JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'variant_id') this.variantId,
      @JsonKey(name: 'msisdn_id') this.msisdnId,
      @JsonKey(name: 'pack_price') this.packPrice,
      @JsonKey(name: 'sim_price') this.simPrice,
      @JsonKey(name: 'sale_price') this.salePrice,
      this.quantity,
      @JsonKey(name: 'sim_type') this.simType,
      @JsonKey(name: 'pack_code') this.packCode});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'variant_id')
  final int? variantId;
  @override
  @JsonKey(name: 'msisdn_id')
  final int? msisdnId;
  @override
  @JsonKey(name: 'pack_price')
  final int? packPrice;
  @override
  @JsonKey(name: 'sim_price')
  final int? simPrice;
  @override
  @JsonKey(name: 'sale_price')
  final int? salePrice;
  @override
  final int? quantity;
  @override
  @JsonKey(name: 'sim_type')
  final String? simType;
  @override
  @JsonKey(name: 'pack_code')
  final String? packCode;

  @override
  String toString() {
    return 'Item(productId: $productId, variantId: $variantId, msisdnId: $msisdnId, packPrice: $packPrice, simPrice: $simPrice, salePrice: $salePrice, quantity: $quantity, simType: $simType, packCode: $packCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.msisdnId, msisdnId) ||
                other.msisdnId == msisdnId) &&
            (identical(other.packPrice, packPrice) ||
                other.packPrice == packPrice) &&
            (identical(other.simPrice, simPrice) ||
                other.simPrice == simPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.simType, simType) || other.simType == simType) &&
            (identical(other.packCode, packCode) ||
                other.packCode == packCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, variantId, msisdnId,
      packPrice, simPrice, salePrice, quantity, simType, packCode);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {@JsonKey(name: 'product_id') final int? productId,
      @JsonKey(name: 'variant_id') final int? variantId,
      @JsonKey(name: 'msisdn_id') final int? msisdnId,
      @JsonKey(name: 'pack_price') final int? packPrice,
      @JsonKey(name: 'sim_price') final int? simPrice,
      @JsonKey(name: 'sale_price') final int? salePrice,
      final int? quantity,
      @JsonKey(name: 'sim_type') final String? simType,
      @JsonKey(name: 'pack_code') final String? packCode}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'variant_id')
  int? get variantId;
  @override
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId;
  @override
  @JsonKey(name: 'pack_price')
  int? get packPrice;
  @override
  @JsonKey(name: 'sim_price')
  int? get simPrice;
  @override
  @JsonKey(name: 'sale_price')
  int? get salePrice;
  @override
  int? get quantity;
  @override
  @JsonKey(name: 'sim_type')
  String? get simType;
  @override
  @JsonKey(name: 'pack_code')
  String? get packCode;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
