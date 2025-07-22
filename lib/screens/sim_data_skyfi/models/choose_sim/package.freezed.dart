// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
mixin _$Package {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get description => throw _privateConstructorUsedError;
  String get cycle => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_main')
  int get isMain => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get brief => throw _privateConstructorUsedError;
  @JsonKey(name: 'validity_day', defaultValue: 0)
  int? get validityDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_per_day')
  double get dataPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_per_month')
  double get dataPerMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_outstanding')
  int get isOutstanding => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_call_minute', defaultValue: 0)
  int? get freeCallMinute => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_sms', defaultValue: 0)
  int? get freeSms => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent', defaultValue: 0)
  double? get discountPercent => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  double get salePrice => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  int? get isDefault => throw _privateConstructorUsedError;

  /// Serializes this Package to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res, Package>;
  @useResult
  $Res call(
      {String code,
      String name,
      List<String> description,
      String cycle,
      @JsonKey(name: 'is_main') int isMain,
      double price,
      String brief,
      @JsonKey(name: 'validity_day', defaultValue: 0) int? validityDay,
      @JsonKey(name: 'data_per_day') double dataPerDay,
      @JsonKey(name: 'data_per_month') double dataPerMonth,
      @JsonKey(name: 'is_outstanding') int isOutstanding,
      @JsonKey(name: 'free_call_minute', defaultValue: 0) int? freeCallMinute,
      @JsonKey(name: 'free_sms', defaultValue: 0) int? freeSms,
      @JsonKey(name: 'discount_percent', defaultValue: 0)
      double? discountPercent,
      int index,
      @JsonKey(name: 'sale_price') double salePrice,
      int id,
      @JsonKey(name: 'is_default') int? isDefault});
}

/// @nodoc
class _$PackageCopyWithImpl<$Res, $Val extends Package>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? cycle = null,
    Object? isMain = null,
    Object? price = null,
    Object? brief = null,
    Object? validityDay = freezed,
    Object? dataPerDay = null,
    Object? dataPerMonth = null,
    Object? isOutstanding = null,
    Object? freeCallMinute = freezed,
    Object? freeSms = freezed,
    Object? discountPercent = freezed,
    Object? index = null,
    Object? salePrice = null,
    Object? id = null,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String,
      isMain: null == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      validityDay: freezed == validityDay
          ? _value.validityDay
          : validityDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPerDay: null == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      dataPerMonth: null == dataPerMonth
          ? _value.dataPerMonth
          : dataPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      isOutstanding: null == isOutstanding
          ? _value.isOutstanding
          : isOutstanding // ignore: cast_nullable_to_non_nullable
              as int,
      freeCallMinute: freezed == freeCallMinute
          ? _value.freeCallMinute
          : freeCallMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      freeSms: freezed == freeSms
          ? _value.freeSms
          : freeSms // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageImplCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$$PackageImplCopyWith(
          _$PackageImpl value, $Res Function(_$PackageImpl) then) =
      __$$PackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      List<String> description,
      String cycle,
      @JsonKey(name: 'is_main') int isMain,
      double price,
      String brief,
      @JsonKey(name: 'validity_day', defaultValue: 0) int? validityDay,
      @JsonKey(name: 'data_per_day') double dataPerDay,
      @JsonKey(name: 'data_per_month') double dataPerMonth,
      @JsonKey(name: 'is_outstanding') int isOutstanding,
      @JsonKey(name: 'free_call_minute', defaultValue: 0) int? freeCallMinute,
      @JsonKey(name: 'free_sms', defaultValue: 0) int? freeSms,
      @JsonKey(name: 'discount_percent', defaultValue: 0)
      double? discountPercent,
      int index,
      @JsonKey(name: 'sale_price') double salePrice,
      int id,
      @JsonKey(name: 'is_default') int? isDefault});
}

/// @nodoc
class __$$PackageImplCopyWithImpl<$Res>
    extends _$PackageCopyWithImpl<$Res, _$PackageImpl>
    implements _$$PackageImplCopyWith<$Res> {
  __$$PackageImplCopyWithImpl(
      _$PackageImpl _value, $Res Function(_$PackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? cycle = null,
    Object? isMain = null,
    Object? price = null,
    Object? brief = null,
    Object? validityDay = freezed,
    Object? dataPerDay = null,
    Object? dataPerMonth = null,
    Object? isOutstanding = null,
    Object? freeCallMinute = freezed,
    Object? freeSms = freezed,
    Object? discountPercent = freezed,
    Object? index = null,
    Object? salePrice = null,
    Object? id = null,
    Object? isDefault = freezed,
  }) {
    return _then(_$PackageImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String,
      isMain: null == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      brief: null == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String,
      validityDay: freezed == validityDay
          ? _value.validityDay
          : validityDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPerDay: null == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      dataPerMonth: null == dataPerMonth
          ? _value.dataPerMonth
          : dataPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      isOutstanding: null == isOutstanding
          ? _value.isOutstanding
          : isOutstanding // ignore: cast_nullable_to_non_nullable
              as int,
      freeCallMinute: freezed == freeCallMinute
          ? _value.freeCallMinute
          : freeCallMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      freeSms: freezed == freeSms
          ? _value.freeSms
          : freeSms // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageImpl implements _Package {
  _$PackageImpl(
      {required this.code,
      required this.name,
      required final List<String> description,
      required this.cycle,
      @JsonKey(name: 'is_main') required this.isMain,
      required this.price,
      required this.brief,
      @JsonKey(name: 'validity_day', defaultValue: 0) this.validityDay,
      @JsonKey(name: 'data_per_day') required this.dataPerDay,
      @JsonKey(name: 'data_per_month') required this.dataPerMonth,
      @JsonKey(name: 'is_outstanding') required this.isOutstanding,
      @JsonKey(name: 'free_call_minute', defaultValue: 0) this.freeCallMinute,
      @JsonKey(name: 'free_sms', defaultValue: 0) required this.freeSms,
      @JsonKey(name: 'discount_percent', defaultValue: 0) this.discountPercent,
      required this.index,
      @JsonKey(name: 'sale_price') required this.salePrice,
      required this.id,
      @JsonKey(name: 'is_default') this.isDefault})
      : _description = description;

  factory _$PackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  final List<String> _description;
  @override
  List<String> get description {
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_description);
  }

  @override
  final String cycle;
  @override
  @JsonKey(name: 'is_main')
  final int isMain;
  @override
  final double price;
  @override
  final String brief;
  @override
  @JsonKey(name: 'validity_day', defaultValue: 0)
  final int? validityDay;
  @override
  @JsonKey(name: 'data_per_day')
  final double dataPerDay;
  @override
  @JsonKey(name: 'data_per_month')
  final double dataPerMonth;
  @override
  @JsonKey(name: 'is_outstanding')
  final int isOutstanding;
  @override
  @JsonKey(name: 'free_call_minute', defaultValue: 0)
  final int? freeCallMinute;
  @override
  @JsonKey(name: 'free_sms', defaultValue: 0)
  final int? freeSms;
  @override
  @JsonKey(name: 'discount_percent', defaultValue: 0)
  final double? discountPercent;
  @override
  final int index;
  @override
  @JsonKey(name: 'sale_price')
  final double salePrice;
  @override
  final int id;
  @override
  @JsonKey(name: 'is_default')
  final int? isDefault;

  @override
  String toString() {
    return 'Package(code: $code, name: $name, description: $description, cycle: $cycle, isMain: $isMain, price: $price, brief: $brief, validityDay: $validityDay, dataPerDay: $dataPerDay, dataPerMonth: $dataPerMonth, isOutstanding: $isOutstanding, freeCallMinute: $freeCallMinute, freeSms: $freeSms, discountPercent: $discountPercent, index: $index, salePrice: $salePrice, id: $id, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.brief, brief) || other.brief == brief) &&
            (identical(other.validityDay, validityDay) ||
                other.validityDay == validityDay) &&
            (identical(other.dataPerDay, dataPerDay) ||
                other.dataPerDay == dataPerDay) &&
            (identical(other.dataPerMonth, dataPerMonth) ||
                other.dataPerMonth == dataPerMonth) &&
            (identical(other.isOutstanding, isOutstanding) ||
                other.isOutstanding == isOutstanding) &&
            (identical(other.freeCallMinute, freeCallMinute) ||
                other.freeCallMinute == freeCallMinute) &&
            (identical(other.freeSms, freeSms) || other.freeSms == freeSms) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      const DeepCollectionEquality().hash(_description),
      cycle,
      isMain,
      price,
      brief,
      validityDay,
      dataPerDay,
      dataPerMonth,
      isOutstanding,
      freeCallMinute,
      freeSms,
      discountPercent,
      index,
      salePrice,
      id,
      isDefault);

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      __$$PackageImplCopyWithImpl<_$PackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageImplToJson(
      this,
    );
  }
}

abstract class _Package implements Package {
  factory _Package(
      {required final String code,
      required final String name,
      required final List<String> description,
      required final String cycle,
      @JsonKey(name: 'is_main') required final int isMain,
      required final double price,
      required final String brief,
      @JsonKey(name: 'validity_day', defaultValue: 0) final int? validityDay,
      @JsonKey(name: 'data_per_day') required final double dataPerDay,
      @JsonKey(name: 'data_per_month') required final double dataPerMonth,
      @JsonKey(name: 'is_outstanding') required final int isOutstanding,
      @JsonKey(name: 'free_call_minute', defaultValue: 0)
      final int? freeCallMinute,
      @JsonKey(name: 'free_sms', defaultValue: 0) required final int? freeSms,
      @JsonKey(name: 'discount_percent', defaultValue: 0)
      final double? discountPercent,
      required final int index,
      @JsonKey(name: 'sale_price') required final double salePrice,
      required final int id,
      @JsonKey(name: 'is_default') final int? isDefault}) = _$PackageImpl;

  factory _Package.fromJson(Map<String, dynamic> json) = _$PackageImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  List<String> get description;
  @override
  String get cycle;
  @override
  @JsonKey(name: 'is_main')
  int get isMain;
  @override
  double get price;
  @override
  String get brief;
  @override
  @JsonKey(name: 'validity_day', defaultValue: 0)
  int? get validityDay;
  @override
  @JsonKey(name: 'data_per_day')
  double get dataPerDay;
  @override
  @JsonKey(name: 'data_per_month')
  double get dataPerMonth;
  @override
  @JsonKey(name: 'is_outstanding')
  int get isOutstanding;
  @override
  @JsonKey(name: 'free_call_minute', defaultValue: 0)
  int? get freeCallMinute;
  @override
  @JsonKey(name: 'free_sms', defaultValue: 0)
  int? get freeSms;
  @override
  @JsonKey(name: 'discount_percent', defaultValue: 0)
  double? get discountPercent;
  @override
  int get index;
  @override
  @JsonKey(name: 'sale_price')
  double get salePrice;
  @override
  int get id;
  @override
  @JsonKey(name: 'is_default')
  int? get isDefault;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
