// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'esim_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EsimPackageModel _$EsimPackageModelFromJson(Map<String, dynamic> json) {
  return _EsimPackageModel.fromJson(json);
}

/// @nodoc
mixin _$EsimPackageModel {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'region_id')
  int get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  double get sellingPrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_amount')
  double get dataAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_unit')
  String get dataUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'validity_days')
  int get validityDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'variant_id')
  int get variantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'countries_size')
  int get providerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'countries_array')
  List<EsimRegionModel>? get countriesArray =>
      throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this EsimPackageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EsimPackageModelCopyWith<EsimPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsimPackageModelCopyWith<$Res> {
  factory $EsimPackageModelCopyWith(
          EsimPackageModel value, $Res Function(EsimPackageModel) then) =
      _$EsimPackageModelCopyWithImpl<$Res, EsimPackageModel>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'region_id') int regionId,
      @JsonKey(name: 'selling_price') double sellingPrice,
      String currency,
      @JsonKey(name: 'data_amount') double dataAmount,
      @JsonKey(name: 'data_unit') String dataUnit,
      @JsonKey(name: 'validity_days') int validityDays,
      @JsonKey(name: 'variant_id') int variantId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'countries_size') int providerName,
      @JsonKey(name: 'countries_array') List<EsimRegionModel>? countriesArray,
      int quantity});
}

/// @nodoc
class _$EsimPackageModelCopyWithImpl<$Res, $Val extends EsimPackageModel>
    implements $EsimPackageModelCopyWith<$Res> {
  _$EsimPackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regionId = null,
    Object? sellingPrice = null,
    Object? currency = null,
    Object? dataAmount = null,
    Object? dataUnit = null,
    Object? validityDays = null,
    Object? variantId = null,
    Object? productId = null,
    Object? providerName = null,
    Object? countriesArray = freezed,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dataAmount: null == dataAmount
          ? _value.dataAmount
          : dataAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dataUnit: null == dataUnit
          ? _value.dataUnit
          : dataUnit // ignore: cast_nullable_to_non_nullable
              as String,
      validityDays: null == validityDays
          ? _value.validityDays
          : validityDays // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as int,
      countriesArray: freezed == countriesArray
          ? _value.countriesArray
          : countriesArray // ignore: cast_nullable_to_non_nullable
              as List<EsimRegionModel>?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EsimPackageModelImplCopyWith<$Res>
    implements $EsimPackageModelCopyWith<$Res> {
  factory _$$EsimPackageModelImplCopyWith(_$EsimPackageModelImpl value,
          $Res Function(_$EsimPackageModelImpl) then) =
      __$$EsimPackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'region_id') int regionId,
      @JsonKey(name: 'selling_price') double sellingPrice,
      String currency,
      @JsonKey(name: 'data_amount') double dataAmount,
      @JsonKey(name: 'data_unit') String dataUnit,
      @JsonKey(name: 'validity_days') int validityDays,
      @JsonKey(name: 'variant_id') int variantId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'countries_size') int providerName,
      @JsonKey(name: 'countries_array') List<EsimRegionModel>? countriesArray,
      int quantity});
}

/// @nodoc
class __$$EsimPackageModelImplCopyWithImpl<$Res>
    extends _$EsimPackageModelCopyWithImpl<$Res, _$EsimPackageModelImpl>
    implements _$$EsimPackageModelImplCopyWith<$Res> {
  __$$EsimPackageModelImplCopyWithImpl(_$EsimPackageModelImpl _value,
      $Res Function(_$EsimPackageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regionId = null,
    Object? sellingPrice = null,
    Object? currency = null,
    Object? dataAmount = null,
    Object? dataUnit = null,
    Object? validityDays = null,
    Object? variantId = null,
    Object? productId = null,
    Object? providerName = null,
    Object? countriesArray = freezed,
    Object? quantity = null,
  }) {
    return _then(_$EsimPackageModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dataAmount: null == dataAmount
          ? _value.dataAmount
          : dataAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dataUnit: null == dataUnit
          ? _value.dataUnit
          : dataUnit // ignore: cast_nullable_to_non_nullable
              as String,
      validityDays: null == validityDays
          ? _value.validityDays
          : validityDays // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as int,
      countriesArray: freezed == countriesArray
          ? _value._countriesArray
          : countriesArray // ignore: cast_nullable_to_non_nullable
              as List<EsimRegionModel>?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EsimPackageModelImpl implements _EsimPackageModel {
  const _$EsimPackageModelImpl(
      {required this.name,
      @JsonKey(name: 'region_id') required this.regionId,
      @JsonKey(name: 'selling_price') required this.sellingPrice,
      required this.currency,
      @JsonKey(name: 'data_amount') required this.dataAmount,
      @JsonKey(name: 'data_unit') required this.dataUnit,
      @JsonKey(name: 'validity_days') required this.validityDays,
      @JsonKey(name: 'variant_id') required this.variantId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'countries_size') required this.providerName,
      @JsonKey(name: 'countries_array')
      final List<EsimRegionModel>? countriesArray,
      this.quantity = 0})
      : _countriesArray = countriesArray;

  factory _$EsimPackageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsimPackageModelImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'region_id')
  final int regionId;
  @override
  @JsonKey(name: 'selling_price')
  final double sellingPrice;
  @override
  final String currency;
  @override
  @JsonKey(name: 'data_amount')
  final double dataAmount;
  @override
  @JsonKey(name: 'data_unit')
  final String dataUnit;
  @override
  @JsonKey(name: 'validity_days')
  final int validityDays;
  @override
  @JsonKey(name: 'variant_id')
  final int variantId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'countries_size')
  final int providerName;
  final List<EsimRegionModel>? _countriesArray;
  @override
  @JsonKey(name: 'countries_array')
  List<EsimRegionModel>? get countriesArray {
    final value = _countriesArray;
    if (value == null) return null;
    if (_countriesArray is EqualUnmodifiableListView) return _countriesArray;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'EsimPackageModel(name: $name, regionId: $regionId, sellingPrice: $sellingPrice, currency: $currency, dataAmount: $dataAmount, dataUnit: $dataUnit, validityDays: $validityDays, variantId: $variantId, productId: $productId, providerName: $providerName, countriesArray: $countriesArray, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsimPackageModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dataAmount, dataAmount) ||
                other.dataAmount == dataAmount) &&
            (identical(other.dataUnit, dataUnit) ||
                other.dataUnit == dataUnit) &&
            (identical(other.validityDays, validityDays) ||
                other.validityDays == validityDays) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            const DeepCollectionEquality()
                .equals(other._countriesArray, _countriesArray) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      regionId,
      sellingPrice,
      currency,
      dataAmount,
      dataUnit,
      validityDays,
      variantId,
      productId,
      providerName,
      const DeepCollectionEquality().hash(_countriesArray),
      quantity);

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsimPackageModelImplCopyWith<_$EsimPackageModelImpl> get copyWith =>
      __$$EsimPackageModelImplCopyWithImpl<_$EsimPackageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsimPackageModelImplToJson(
      this,
    );
  }
}

abstract class _EsimPackageModel implements EsimPackageModel {
  const factory _EsimPackageModel(
      {required final String name,
      @JsonKey(name: 'region_id') required final int regionId,
      @JsonKey(name: 'selling_price') required final double sellingPrice,
      required final String currency,
      @JsonKey(name: 'data_amount') required final double dataAmount,
      @JsonKey(name: 'data_unit') required final String dataUnit,
      @JsonKey(name: 'validity_days') required final int validityDays,
      @JsonKey(name: 'variant_id') required final int variantId,
      @JsonKey(name: 'product_id') required final int productId,
      @JsonKey(name: 'countries_size') required final int providerName,
      @JsonKey(name: 'countries_array')
      final List<EsimRegionModel>? countriesArray,
      final int quantity}) = _$EsimPackageModelImpl;

  factory _EsimPackageModel.fromJson(Map<String, dynamic> json) =
      _$EsimPackageModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'region_id')
  int get regionId;
  @override
  @JsonKey(name: 'selling_price')
  double get sellingPrice;
  @override
  String get currency;
  @override
  @JsonKey(name: 'data_amount')
  double get dataAmount;
  @override
  @JsonKey(name: 'data_unit')
  String get dataUnit;
  @override
  @JsonKey(name: 'validity_days')
  int get validityDays;
  @override
  @JsonKey(name: 'variant_id')
  int get variantId;
  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'countries_size')
  int get providerName;
  @override
  @JsonKey(name: 'countries_array')
  List<EsimRegionModel>? get countriesArray;
  @override
  int get quantity;

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsimPackageModelImplCopyWith<_$EsimPackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageEsim _$ImageEsimFromJson(Map<String, dynamic> json) {
  return _ImageEsim.fromJson(json);
}

/// @nodoc
mixin _$ImageEsim {
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this ImageEsim to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageEsim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageEsimCopyWith<ImageEsim> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageEsimCopyWith<$Res> {
  factory $ImageEsimCopyWith(ImageEsim value, $Res Function(ImageEsim) then) =
      _$ImageEsimCopyWithImpl<$Res, ImageEsim>;
  @useResult
  $Res call({String url, int width, int height});
}

/// @nodoc
class _$ImageEsimCopyWithImpl<$Res, $Val extends ImageEsim>
    implements $ImageEsimCopyWith<$Res> {
  _$ImageEsimCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageEsim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageEsimImplCopyWith<$Res>
    implements $ImageEsimCopyWith<$Res> {
  factory _$$ImageEsimImplCopyWith(
          _$ImageEsimImpl value, $Res Function(_$ImageEsimImpl) then) =
      __$$ImageEsimImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, int width, int height});
}

/// @nodoc
class __$$ImageEsimImplCopyWithImpl<$Res>
    extends _$ImageEsimCopyWithImpl<$Res, _$ImageEsimImpl>
    implements _$$ImageEsimImplCopyWith<$Res> {
  __$$ImageEsimImplCopyWithImpl(
      _$ImageEsimImpl _value, $Res Function(_$ImageEsimImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageEsim
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$ImageEsimImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageEsimImpl implements _ImageEsim {
  const _$ImageEsimImpl(
      {required this.url, required this.width, required this.height});

  factory _$ImageEsimImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageEsimImplFromJson(json);

  @override
  final String url;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'ImageEsim(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageEsimImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  /// Create a copy of ImageEsim
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageEsimImplCopyWith<_$ImageEsimImpl> get copyWith =>
      __$$ImageEsimImplCopyWithImpl<_$ImageEsimImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageEsimImplToJson(
      this,
    );
  }
}

abstract class _ImageEsim implements ImageEsim {
  const factory _ImageEsim(
      {required final String url,
      required final int width,
      required final int height}) = _$ImageEsimImpl;

  factory _ImageEsim.fromJson(Map<String, dynamic> json) =
      _$ImageEsimImpl.fromJson;

  @override
  String get url;
  @override
  int get width;
  @override
  int get height;

  /// Create a copy of ImageEsim
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageEsimImplCopyWith<_$ImageEsimImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EsimRegionModel _$EsimRegionModelFromJson(Map<String, dynamic> json) {
  return _EsimRegionModel.fromJson(json);
}

/// @nodoc
mixin _$EsimRegionModel {
  @JsonKey(name: 'country_code')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  ImageEsim? get image => throw _privateConstructorUsedError;

  /// Serializes this EsimRegionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EsimRegionModelCopyWith<EsimRegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsimRegionModelCopyWith<$Res> {
  factory $EsimRegionModelCopyWith(
          EsimRegionModel value, $Res Function(EsimRegionModel) then) =
      _$EsimRegionModelCopyWithImpl<$Res, EsimRegionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ImageEsim? image});

  $ImageEsimCopyWith<$Res>? get image;
}

/// @nodoc
class _$EsimRegionModelCopyWithImpl<$Res, $Val extends EsimRegionModel>
    implements $EsimRegionModelCopyWith<$Res> {
  _$EsimRegionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? title = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageEsim?,
    ) as $Val);
  }

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageEsimCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageEsimCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EsimRegionModelImplCopyWith<$Res>
    implements $EsimRegionModelCopyWith<$Res> {
  factory _$$EsimRegionModelImplCopyWith(_$EsimRegionModelImpl value,
          $Res Function(_$EsimRegionModelImpl) then) =
      __$$EsimRegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ImageEsim? image});

  @override
  $ImageEsimCopyWith<$Res>? get image;
}

/// @nodoc
class __$$EsimRegionModelImplCopyWithImpl<$Res>
    extends _$EsimRegionModelCopyWithImpl<$Res, _$EsimRegionModelImpl>
    implements _$$EsimRegionModelImplCopyWith<$Res> {
  __$$EsimRegionModelImplCopyWithImpl(
      _$EsimRegionModelImpl _value, $Res Function(_$EsimRegionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? title = null,
    Object? image = freezed,
  }) {
    return _then(_$EsimRegionModelImpl(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageEsim?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EsimRegionModelImpl implements _EsimRegionModel {
  const _$EsimRegionModelImpl(
      {@JsonKey(name: 'country_code') required this.countryCode,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'image') this.image});

  factory _$EsimRegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsimRegionModelImplFromJson(json);

  @override
  @JsonKey(name: 'country_code')
  final String countryCode;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'image')
  final ImageEsim? image;

  @override
  String toString() {
    return 'EsimRegionModel(countryCode: $countryCode, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsimRegionModelImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryCode, title, image);

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsimRegionModelImplCopyWith<_$EsimRegionModelImpl> get copyWith =>
      __$$EsimRegionModelImplCopyWithImpl<_$EsimRegionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsimRegionModelImplToJson(
      this,
    );
  }
}

abstract class _EsimRegionModel implements EsimRegionModel {
  const factory _EsimRegionModel(
      {@JsonKey(name: 'country_code') required final String countryCode,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'image') final ImageEsim? image}) = _$EsimRegionModelImpl;

  factory _EsimRegionModel.fromJson(Map<String, dynamic> json) =
      _$EsimRegionModelImpl.fromJson;

  @override
  @JsonKey(name: 'country_code')
  String get countryCode;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'image')
  ImageEsim? get image;

  /// Create a copy of EsimRegionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsimRegionModelImplCopyWith<_$EsimRegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EsimPackageResponse _$EsimPackageResponseFromJson(Map<String, dynamic> json) {
  return _EsimPackageResponse.fromJson(json);
}

/// @nodoc
mixin _$EsimPackageResponse {
  @JsonKey(name: 'requestId')
  String? get requestId => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRecords')
  int? get totalRecords => throw _privateConstructorUsedError;
  List<EsimPackageModel> get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this EsimPackageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EsimPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EsimPackageResponseCopyWith<EsimPackageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsimPackageResponseCopyWith<$Res> {
  factory $EsimPackageResponseCopyWith(
          EsimPackageResponse value, $Res Function(EsimPackageResponse) then) =
      _$EsimPackageResponseCopyWithImpl<$Res, EsimPackageResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      List<EsimPackageModel> result,
      dynamic extra});
}

/// @nodoc
class _$EsimPackageResponseCopyWithImpl<$Res, $Val extends EsimPackageResponse>
    implements $EsimPackageResponseCopyWith<$Res> {
  _$EsimPackageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EsimPackageResponse
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
              as List<EsimPackageModel>,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EsimPackageResponseImplCopyWith<$Res>
    implements $EsimPackageResponseCopyWith<$Res> {
  factory _$$EsimPackageResponseImplCopyWith(_$EsimPackageResponseImpl value,
          $Res Function(_$EsimPackageResponseImpl) then) =
      __$$EsimPackageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestId') String? requestId,
      int code,
      String message,
      @JsonKey(name: 'totalRecords') int? totalRecords,
      List<EsimPackageModel> result,
      dynamic extra});
}

/// @nodoc
class __$$EsimPackageResponseImplCopyWithImpl<$Res>
    extends _$EsimPackageResponseCopyWithImpl<$Res, _$EsimPackageResponseImpl>
    implements _$$EsimPackageResponseImplCopyWith<$Res> {
  __$$EsimPackageResponseImplCopyWithImpl(_$EsimPackageResponseImpl _value,
      $Res Function(_$EsimPackageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EsimPackageResponse
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
    return _then(_$EsimPackageResponseImpl(
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
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<EsimPackageModel>,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EsimPackageResponseImpl implements _EsimPackageResponse {
  const _$EsimPackageResponseImpl(
      {@JsonKey(name: 'requestId') this.requestId,
      required this.code,
      required this.message,
      @JsonKey(name: 'totalRecords') this.totalRecords,
      required final List<EsimPackageModel> result,
      this.extra})
      : _result = result;

  factory _$EsimPackageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsimPackageResponseImplFromJson(json);

  @override
  @JsonKey(name: 'requestId')
  final String? requestId;
  @override
  final int code;
  @override
  final String message;
  @override
  @JsonKey(name: 'totalRecords')
  final int? totalRecords;
  final List<EsimPackageModel> _result;
  @override
  List<EsimPackageModel> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final dynamic extra;

  @override
  String toString() {
    return 'EsimPackageResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsimPackageResponseImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      code,
      message,
      totalRecords,
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(extra));

  /// Create a copy of EsimPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsimPackageResponseImplCopyWith<_$EsimPackageResponseImpl> get copyWith =>
      __$$EsimPackageResponseImplCopyWithImpl<_$EsimPackageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsimPackageResponseImplToJson(
      this,
    );
  }
}

abstract class _EsimPackageResponse implements EsimPackageResponse {
  const factory _EsimPackageResponse(
      {@JsonKey(name: 'requestId') final String? requestId,
      required final int code,
      required final String message,
      @JsonKey(name: 'totalRecords') final int? totalRecords,
      required final List<EsimPackageModel> result,
      final dynamic extra}) = _$EsimPackageResponseImpl;

  factory _EsimPackageResponse.fromJson(Map<String, dynamic> json) =
      _$EsimPackageResponseImpl.fromJson;

  @override
  @JsonKey(name: 'requestId')
  String? get requestId;
  @override
  int get code;
  @override
  String get message;
  @override
  @JsonKey(name: 'totalRecords')
  int? get totalRecords;
  @override
  List<EsimPackageModel> get result;
  @override
  dynamic get extra;

  /// Create a copy of EsimPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsimPackageResponseImplCopyWith<_$EsimPackageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
