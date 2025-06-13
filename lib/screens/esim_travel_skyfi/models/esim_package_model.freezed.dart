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
      this.quantity = 0});

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
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'EsimPackageModel(name: $name, regionId: $regionId, sellingPrice: $sellingPrice, currency: $currency, dataAmount: $dataAmount, dataUnit: $dataUnit, validityDays: $validityDays, variantId: $variantId, productId: $productId, quantity: $quantity)';
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
  int get quantity;

  /// Create a copy of EsimPackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsimPackageModelImplCopyWith<_$EsimPackageModelImpl> get copyWith =>
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
