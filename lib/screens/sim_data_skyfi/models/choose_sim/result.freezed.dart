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
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId => throw _privateConstructorUsedError;
  String? get msisdn => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_price')
  int? get basePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  int? get salePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'variant_id')
  int? get variantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'usim_price')
  int? get usimPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'esim_price')
  int? get esimPrice => throw _privateConstructorUsedError;
  List<Package>? get packages => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'msisdn_id') int? msisdnId,
      String? msisdn,
      String? name,
      @JsonKey(name: 'base_price') int? basePrice,
      @JsonKey(name: 'sale_price') int? salePrice,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'variant_id') int? variantId,
      @JsonKey(name: 'usim_price') int? usimPrice,
      @JsonKey(name: 'esim_price') int? esimPrice,
      List<Package>? packages});
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
    Object? msisdnId = freezed,
    Object? msisdn = freezed,
    Object? name = freezed,
    Object? basePrice = freezed,
    Object? salePrice = freezed,
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? usimPrice = freezed,
    Object? esimPrice = freezed,
    Object? packages = freezed,
  }) {
    return _then(_value.copyWith(
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basePrice: freezed == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      usimPrice: freezed == usimPrice
          ? _value.usimPrice
          : usimPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      esimPrice: freezed == esimPrice
          ? _value.esimPrice
          : esimPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packages: freezed == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>?,
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
      {@JsonKey(name: 'msisdn_id') int? msisdnId,
      String? msisdn,
      String? name,
      @JsonKey(name: 'base_price') int? basePrice,
      @JsonKey(name: 'sale_price') int? salePrice,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'variant_id') int? variantId,
      @JsonKey(name: 'usim_price') int? usimPrice,
      @JsonKey(name: 'esim_price') int? esimPrice,
      List<Package>? packages});
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
    Object? msisdnId = freezed,
    Object? msisdn = freezed,
    Object? name = freezed,
    Object? basePrice = freezed,
    Object? salePrice = freezed,
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? usimPrice = freezed,
    Object? esimPrice = freezed,
    Object? packages = freezed,
  }) {
    return _then(_$ResultImpl(
      msisdnId: freezed == msisdnId
          ? _value.msisdnId
          : msisdnId // ignore: cast_nullable_to_non_nullable
              as int?,
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basePrice: freezed == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      usimPrice: freezed == usimPrice
          ? _value.usimPrice
          : usimPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      esimPrice: freezed == esimPrice
          ? _value.esimPrice
          : esimPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packages: freezed == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  _$ResultImpl(
      {@JsonKey(name: 'msisdn_id') this.msisdnId,
      this.msisdn,
      this.name,
      @JsonKey(name: 'base_price') this.basePrice,
      @JsonKey(name: 'sale_price') this.salePrice,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'variant_id') this.variantId,
      @JsonKey(name: 'usim_price') this.usimPrice,
      @JsonKey(name: 'esim_price') this.esimPrice,
      final List<Package>? packages})
      : _packages = packages;

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  @JsonKey(name: 'msisdn_id')
  final int? msisdnId;
  @override
  final String? msisdn;
  @override
  final String? name;
  @override
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @override
  @JsonKey(name: 'sale_price')
  final int? salePrice;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'variant_id')
  final int? variantId;
  @override
  @JsonKey(name: 'usim_price')
  final int? usimPrice;
  @override
  @JsonKey(name: 'esim_price')
  final int? esimPrice;
  final List<Package>? _packages;
  @override
  List<Package>? get packages {
    final value = _packages;
    if (value == null) return null;
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Result(msisdnId: $msisdnId, msisdn: $msisdn, name: $name, basePrice: $basePrice, salePrice: $salePrice, productId: $productId, variantId: $variantId, usimPrice: $usimPrice, esimPrice: $esimPrice, packages: $packages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.msisdnId, msisdnId) ||
                other.msisdnId == msisdnId) &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.usimPrice, usimPrice) ||
                other.usimPrice == usimPrice) &&
            (identical(other.esimPrice, esimPrice) ||
                other.esimPrice == esimPrice) &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      msisdnId,
      msisdn,
      name,
      basePrice,
      salePrice,
      productId,
      variantId,
      usimPrice,
      esimPrice,
      const DeepCollectionEquality().hash(_packages));

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
      {@JsonKey(name: 'msisdn_id') final int? msisdnId,
      final String? msisdn,
      final String? name,
      @JsonKey(name: 'base_price') final int? basePrice,
      @JsonKey(name: 'sale_price') final int? salePrice,
      @JsonKey(name: 'product_id') final int? productId,
      @JsonKey(name: 'variant_id') final int? variantId,
      @JsonKey(name: 'usim_price') final int? usimPrice,
      @JsonKey(name: 'esim_price') final int? esimPrice,
      final List<Package>? packages}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  @JsonKey(name: 'msisdn_id')
  int? get msisdnId;
  @override
  String? get msisdn;
  @override
  String? get name;
  @override
  @JsonKey(name: 'base_price')
  int? get basePrice;
  @override
  @JsonKey(name: 'sale_price')
  int? get salePrice;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'variant_id')
  int? get variantId;
  @override
  @JsonKey(name: 'usim_price')
  int? get usimPrice;
  @override
  @JsonKey(name: 'esim_price')
  int? get esimPrice;
  @override
  List<Package>? get packages;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
