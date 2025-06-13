// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) {
  return _PackageModel.fromJson(json);
}

/// @nodoc
mixin _$PackageModel {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_per_day')
  double get dataPerDay => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  double get salePrice => throw _privateConstructorUsedError;
  List<String> get description => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this PackageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageModelCopyWith<PackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageModelCopyWith<$Res> {
  factory $PackageModelCopyWith(
          PackageModel value, $Res Function(PackageModel) then) =
      _$PackageModelCopyWithImpl<$Res, PackageModel>;
  @useResult
  $Res call(
      {String name,
      String code,
      @JsonKey(name: 'data_per_day') double dataPerDay,
      double price,
      @JsonKey(name: 'sale_price') double salePrice,
      List<String> description,
      bool isSelected});
}

/// @nodoc
class _$PackageModelCopyWithImpl<$Res, $Val extends PackageModel>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? dataPerDay = null,
    Object? price = null,
    Object? salePrice = null,
    Object? description = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dataPerDay: null == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageModelImplCopyWith<$Res>
    implements $PackageModelCopyWith<$Res> {
  factory _$$PackageModelImplCopyWith(
          _$PackageModelImpl value, $Res Function(_$PackageModelImpl) then) =
      __$$PackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String code,
      @JsonKey(name: 'data_per_day') double dataPerDay,
      double price,
      @JsonKey(name: 'sale_price') double salePrice,
      List<String> description,
      bool isSelected});
}

/// @nodoc
class __$$PackageModelImplCopyWithImpl<$Res>
    extends _$PackageModelCopyWithImpl<$Res, _$PackageModelImpl>
    implements _$$PackageModelImplCopyWith<$Res> {
  __$$PackageModelImplCopyWithImpl(
      _$PackageModelImpl _value, $Res Function(_$PackageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? dataPerDay = null,
    Object? price = null,
    Object? salePrice = null,
    Object? description = null,
    Object? isSelected = null,
  }) {
    return _then(_$PackageModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dataPerDay: null == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageModelImpl implements _PackageModel {
  const _$PackageModelImpl(
      {required this.name,
      required this.code,
      @JsonKey(name: 'data_per_day') required this.dataPerDay,
      required this.price,
      @JsonKey(name: 'sale_price') required this.salePrice,
      required final List<String> description,
      this.isSelected = false})
      : _description = description;

  factory _$PackageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageModelImplFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  @JsonKey(name: 'data_per_day')
  final double dataPerDay;
  @override
  final double price;
  @override
  @JsonKey(name: 'sale_price')
  final double salePrice;
  final List<String> _description;
  @override
  List<String> get description {
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_description);
  }

  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'PackageModel(name: $name, code: $code, dataPerDay: $dataPerDay, price: $price, salePrice: $salePrice, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.dataPerDay, dataPerDay) ||
                other.dataPerDay == dataPerDay) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, dataPerDay, price,
      salePrice, const DeepCollectionEquality().hash(_description), isSelected);

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      __$$PackageModelImplCopyWithImpl<_$PackageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageModelImplToJson(
      this,
    );
  }
}

abstract class _PackageModel implements PackageModel {
  const factory _PackageModel(
      {required final String name,
      required final String code,
      @JsonKey(name: 'data_per_day') required final double dataPerDay,
      required final double price,
      @JsonKey(name: 'sale_price') required final double salePrice,
      required final List<String> description,
      final bool isSelected}) = _$PackageModelImpl;

  factory _PackageModel.fromJson(Map<String, dynamic> json) =
      _$PackageModelImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(name: 'data_per_day')
  double get dataPerDay;
  @override
  double get price;
  @override
  @JsonKey(name: 'sale_price')
  double get salePrice;
  @override
  List<String> get description;
  @override
  bool get isSelected;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageResponse _$PackageResponseFromJson(Map<String, dynamic> json) {
  return _PackageResponse.fromJson(json);
}

/// @nodoc
mixin _$PackageResponse {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PackageModel> get result => throw _privateConstructorUsedError;

  /// Serializes this PackageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageResponseCopyWith<PackageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageResponseCopyWith<$Res> {
  factory $PackageResponseCopyWith(
          PackageResponse value, $Res Function(PackageResponse) then) =
      _$PackageResponseCopyWithImpl<$Res, PackageResponse>;
  @useResult
  $Res call({int code, String message, List<PackageModel> result});
}

/// @nodoc
class _$PackageResponseCopyWithImpl<$Res, $Val extends PackageResponse>
    implements $PackageResponseCopyWith<$Res> {
  _$PackageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageResponseImplCopyWith<$Res>
    implements $PackageResponseCopyWith<$Res> {
  factory _$$PackageResponseImplCopyWith(_$PackageResponseImpl value,
          $Res Function(_$PackageResponseImpl) then) =
      __$$PackageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message, List<PackageModel> result});
}

/// @nodoc
class __$$PackageResponseImplCopyWithImpl<$Res>
    extends _$PackageResponseCopyWithImpl<$Res, _$PackageResponseImpl>
    implements _$$PackageResponseImplCopyWith<$Res> {
  __$$PackageResponseImplCopyWithImpl(
      _$PackageResponseImpl _value, $Res Function(_$PackageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$PackageResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageResponseImpl implements _PackageResponse {
  const _$PackageResponseImpl(
      {required this.code,
      required this.message,
      required final List<PackageModel> result})
      : _result = result;

  factory _$PackageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageResponseImplFromJson(json);

  @override
  final int code;
  @override
  final String message;
  final List<PackageModel> _result;
  @override
  List<PackageModel> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'PackageResponse(code: $code, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(_result));

  /// Create a copy of PackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageResponseImplCopyWith<_$PackageResponseImpl> get copyWith =>
      __$$PackageResponseImplCopyWithImpl<_$PackageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageResponseImplToJson(
      this,
    );
  }
}

abstract class _PackageResponse implements PackageResponse {
  const factory _PackageResponse(
      {required final int code,
      required final String message,
      required final List<PackageModel> result}) = _$PackageResponseImpl;

  factory _PackageResponse.fromJson(Map<String, dynamic> json) =
      _$PackageResponseImpl.fromJson;

  @override
  int get code;
  @override
  String get message;
  @override
  List<PackageModel> get result;

  /// Create a copy of PackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageResponseImplCopyWith<_$PackageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
