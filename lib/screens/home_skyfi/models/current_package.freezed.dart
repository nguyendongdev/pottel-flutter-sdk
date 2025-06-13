// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrentPackageResponse _$CurrentPackageResponseFromJson(
    Map<String, dynamic> json) {
  return _CurrentPackageResponse.fromJson(json);
}

/// @nodoc
mixin _$CurrentPackageResponse {
  String? get requestId => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalRecords => throw _privateConstructorUsedError;
  List<CurrentPackage>? get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this CurrentPackageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentPackageResponseCopyWith<CurrentPackageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPackageResponseCopyWith<$Res> {
  factory $CurrentPackageResponseCopyWith(CurrentPackageResponse value,
          $Res Function(CurrentPackageResponse) then) =
      _$CurrentPackageResponseCopyWithImpl<$Res, CurrentPackageResponse>;
  @useResult
  $Res call(
      {String? requestId,
      int? code,
      String? message,
      int? totalRecords,
      List<CurrentPackage>? result,
      dynamic extra});
}

/// @nodoc
class _$CurrentPackageResponseCopyWithImpl<$Res,
        $Val extends CurrentPackageResponse>
    implements $CurrentPackageResponseCopyWith<$Res> {
  _$CurrentPackageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CurrentPackage>?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentPackageResponseImplCopyWith<$Res>
    implements $CurrentPackageResponseCopyWith<$Res> {
  factory _$$CurrentPackageResponseImplCopyWith(
          _$CurrentPackageResponseImpl value,
          $Res Function(_$CurrentPackageResponseImpl) then) =
      __$$CurrentPackageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      int? code,
      String? message,
      int? totalRecords,
      List<CurrentPackage>? result,
      dynamic extra});
}

/// @nodoc
class __$$CurrentPackageResponseImplCopyWithImpl<$Res>
    extends _$CurrentPackageResponseCopyWithImpl<$Res,
        _$CurrentPackageResponseImpl>
    implements _$$CurrentPackageResponseImplCopyWith<$Res> {
  __$$CurrentPackageResponseImplCopyWithImpl(
      _$CurrentPackageResponseImpl _value,
      $Res Function(_$CurrentPackageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? totalRecords = freezed,
    Object? result = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$CurrentPackageResponseImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRecords: freezed == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CurrentPackage>?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentPackageResponseImpl implements _CurrentPackageResponse {
  const _$CurrentPackageResponseImpl(
      {this.requestId,
      this.code,
      this.message,
      this.totalRecords,
      final List<CurrentPackage>? result,
      this.extra})
      : _result = result;

  factory _$CurrentPackageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentPackageResponseImplFromJson(json);

  @override
  final String? requestId;
  @override
  final int? code;
  @override
  final String? message;
  @override
  final int? totalRecords;
  final List<CurrentPackage>? _result;
  @override
  List<CurrentPackage>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic extra;

  @override
  String toString() {
    return 'CurrentPackageResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPackageResponseImpl &&
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

  /// Create a copy of CurrentPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPackageResponseImplCopyWith<_$CurrentPackageResponseImpl>
      get copyWith => __$$CurrentPackageResponseImplCopyWithImpl<
          _$CurrentPackageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentPackageResponseImplToJson(
      this,
    );
  }
}

abstract class _CurrentPackageResponse implements CurrentPackageResponse {
  const factory _CurrentPackageResponse(
      {final String? requestId,
      final int? code,
      final String? message,
      final int? totalRecords,
      final List<CurrentPackage>? result,
      final dynamic extra}) = _$CurrentPackageResponseImpl;

  factory _CurrentPackageResponse.fromJson(Map<String, dynamic> json) =
      _$CurrentPackageResponseImpl.fromJson;

  @override
  String? get requestId;
  @override
  int? get code;
  @override
  String? get message;
  @override
  int? get totalRecords;
  @override
  List<CurrentPackage>? get result;
  @override
  dynamic get extra;

  /// Create a copy of CurrentPackageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentPackageResponseImplCopyWith<_$CurrentPackageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurrentPackage _$CurrentPackageFromJson(Map<String, dynamic> json) {
  return _CurrentPackage.fromJson(json);
}

/// @nodoc
mixin _$CurrentPackage {
  String? get packageName => throw _privateConstructorUsedError;
  String? get fromDate => throw _privateConstructorUsedError;
  String? get toDate => throw _privateConstructorUsedError;
  String? get remainData => throw _privateConstructorUsedError;
  String? get totalData => throw _privateConstructorUsedError;
  String? get remainVoice => throw _privateConstructorUsedError;
  String? get totalVoice => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get cycle => throw _privateConstructorUsedError;
  String? get remainSms => throw _privateConstructorUsedError;
  String? get totalSms => throw _privateConstructorUsedError;
  @JsonKey(name: "is_main")
  int? get isMain => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get brief => throw _privateConstructorUsedError;
  @JsonKey(name: "data_per_day")
  int? get dataPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: "data_per_month")
  int? get dataPerMonth => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  @JsonKey(name: "sale_price")
  int? get salePrice => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "arr_reg_code")
  String? get arrRegCode => throw _privateConstructorUsedError;
  @JsonKey(name: "on_buy_sim")
  int? get onBuySim => throw _privateConstructorUsedError;
  @JsonKey(name: "reg_code_tkc")
  String? get regCodeTkc => throw _privateConstructorUsedError;
  @JsonKey(name: "reg_code_0d")
  String? get regCode0D => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_internal_package")
  int? get isInternalPackage => throw _privateConstructorUsedError;
  @JsonKey(name: "free_call_minute")
  int? get freeCallMinute => throw _privateConstructorUsedError;
  @JsonKey(name: "free_sms")
  int? get freeSms => throw _privateConstructorUsedError;
  @JsonKey(name: "validity_day")
  int? get validityDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_outstanding')
  int? get isOutstanding => throw _privateConstructorUsedError;
  List<String>? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_detail')
  List<String>? get descriptionDetail => throw _privateConstructorUsedError;

  /// Serializes this CurrentPackage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentPackageCopyWith<CurrentPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPackageCopyWith<$Res> {
  factory $CurrentPackageCopyWith(
          CurrentPackage value, $Res Function(CurrentPackage) then) =
      _$CurrentPackageCopyWithImpl<$Res, CurrentPackage>;
  @useResult
  $Res call(
      {String? packageName,
      String? fromDate,
      String? toDate,
      String? remainData,
      String? totalData,
      String? remainVoice,
      String? totalVoice,
      String? code,
      String? name,
      String? cycle,
      String? remainSms,
      String? totalSms,
      @JsonKey(name: "is_main") int? isMain,
      int? price,
      String? brief,
      @JsonKey(name: "data_per_day") int? dataPerDay,
      @JsonKey(name: "data_per_month") int? dataPerMonth,
      int? index,
      @JsonKey(name: "sale_price") int? salePrice,
      int? status,
      @JsonKey(name: "arr_reg_code") String? arrRegCode,
      @JsonKey(name: "on_buy_sim") int? onBuySim,
      @JsonKey(name: "reg_code_tkc") String? regCodeTkc,
      @JsonKey(name: "reg_code_0d") String? regCode0D,
      int? id,
      @JsonKey(name: "is_internal_package") int? isInternalPackage,
      @JsonKey(name: "free_call_minute") int? freeCallMinute,
      @JsonKey(name: "free_sms") int? freeSms,
      @JsonKey(name: "validity_day") int? validityDay,
      @JsonKey(name: 'is_outstanding') int? isOutstanding,
      List<String>? description,
      @JsonKey(name: 'description_detail') List<String>? descriptionDetail});
}

/// @nodoc
class _$CurrentPackageCopyWithImpl<$Res, $Val extends CurrentPackage>
    implements $CurrentPackageCopyWith<$Res> {
  _$CurrentPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentPackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? remainData = freezed,
    Object? totalData = freezed,
    Object? remainVoice = freezed,
    Object? totalVoice = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? cycle = freezed,
    Object? remainSms = freezed,
    Object? totalSms = freezed,
    Object? isMain = freezed,
    Object? price = freezed,
    Object? brief = freezed,
    Object? dataPerDay = freezed,
    Object? dataPerMonth = freezed,
    Object? index = freezed,
    Object? salePrice = freezed,
    Object? status = freezed,
    Object? arrRegCode = freezed,
    Object? onBuySim = freezed,
    Object? regCodeTkc = freezed,
    Object? regCode0D = freezed,
    Object? id = freezed,
    Object? isInternalPackage = freezed,
    Object? freeCallMinute = freezed,
    Object? freeSms = freezed,
    Object? validityDay = freezed,
    Object? isOutstanding = freezed,
    Object? description = freezed,
    Object? descriptionDetail = freezed,
  }) {
    return _then(_value.copyWith(
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remainData: freezed == remainData
          ? _value.remainData
          : remainData // ignore: cast_nullable_to_non_nullable
              as String?,
      totalData: freezed == totalData
          ? _value.totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as String?,
      remainVoice: freezed == remainVoice
          ? _value.remainVoice
          : remainVoice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVoice: freezed == totalVoice
          ? _value.totalVoice
          : totalVoice // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String?,
      remainSms: freezed == remainSms
          ? _value.remainSms
          : remainSms // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSms: freezed == totalSms
          ? _value.totalSms
          : totalSms // ignore: cast_nullable_to_non_nullable
              as String?,
      isMain: freezed == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      brief: freezed == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPerDay: freezed == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPerMonth: freezed == dataPerMonth
          ? _value.dataPerMonth
          : dataPerMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      arrRegCode: freezed == arrRegCode
          ? _value.arrRegCode
          : arrRegCode // ignore: cast_nullable_to_non_nullable
              as String?,
      onBuySim: freezed == onBuySim
          ? _value.onBuySim
          : onBuySim // ignore: cast_nullable_to_non_nullable
              as int?,
      regCodeTkc: freezed == regCodeTkc
          ? _value.regCodeTkc
          : regCodeTkc // ignore: cast_nullable_to_non_nullable
              as String?,
      regCode0D: freezed == regCode0D
          ? _value.regCode0D
          : regCode0D // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isInternalPackage: freezed == isInternalPackage
          ? _value.isInternalPackage
          : isInternalPackage // ignore: cast_nullable_to_non_nullable
              as int?,
      freeCallMinute: freezed == freeCallMinute
          ? _value.freeCallMinute
          : freeCallMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      freeSms: freezed == freeSms
          ? _value.freeSms
          : freeSms // ignore: cast_nullable_to_non_nullable
              as int?,
      validityDay: freezed == validityDay
          ? _value.validityDay
          : validityDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isOutstanding: freezed == isOutstanding
          ? _value.isOutstanding
          : isOutstanding // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      descriptionDetail: freezed == descriptionDetail
          ? _value.descriptionDetail
          : descriptionDetail // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentPackageImplCopyWith<$Res>
    implements $CurrentPackageCopyWith<$Res> {
  factory _$$CurrentPackageImplCopyWith(_$CurrentPackageImpl value,
          $Res Function(_$CurrentPackageImpl) then) =
      __$$CurrentPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? packageName,
      String? fromDate,
      String? toDate,
      String? remainData,
      String? totalData,
      String? remainVoice,
      String? totalVoice,
      String? code,
      String? name,
      String? cycle,
      String? remainSms,
      String? totalSms,
      @JsonKey(name: "is_main") int? isMain,
      int? price,
      String? brief,
      @JsonKey(name: "data_per_day") int? dataPerDay,
      @JsonKey(name: "data_per_month") int? dataPerMonth,
      int? index,
      @JsonKey(name: "sale_price") int? salePrice,
      int? status,
      @JsonKey(name: "arr_reg_code") String? arrRegCode,
      @JsonKey(name: "on_buy_sim") int? onBuySim,
      @JsonKey(name: "reg_code_tkc") String? regCodeTkc,
      @JsonKey(name: "reg_code_0d") String? regCode0D,
      int? id,
      @JsonKey(name: "is_internal_package") int? isInternalPackage,
      @JsonKey(name: "free_call_minute") int? freeCallMinute,
      @JsonKey(name: "free_sms") int? freeSms,
      @JsonKey(name: "validity_day") int? validityDay,
      @JsonKey(name: 'is_outstanding') int? isOutstanding,
      List<String>? description,
      @JsonKey(name: 'description_detail') List<String>? descriptionDetail});
}

/// @nodoc
class __$$CurrentPackageImplCopyWithImpl<$Res>
    extends _$CurrentPackageCopyWithImpl<$Res, _$CurrentPackageImpl>
    implements _$$CurrentPackageImplCopyWith<$Res> {
  __$$CurrentPackageImplCopyWithImpl(
      _$CurrentPackageImpl _value, $Res Function(_$CurrentPackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentPackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? remainData = freezed,
    Object? totalData = freezed,
    Object? remainVoice = freezed,
    Object? totalVoice = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? cycle = freezed,
    Object? remainSms = freezed,
    Object? totalSms = freezed,
    Object? isMain = freezed,
    Object? price = freezed,
    Object? brief = freezed,
    Object? dataPerDay = freezed,
    Object? dataPerMonth = freezed,
    Object? index = freezed,
    Object? salePrice = freezed,
    Object? status = freezed,
    Object? arrRegCode = freezed,
    Object? onBuySim = freezed,
    Object? regCodeTkc = freezed,
    Object? regCode0D = freezed,
    Object? id = freezed,
    Object? isInternalPackage = freezed,
    Object? freeCallMinute = freezed,
    Object? freeSms = freezed,
    Object? validityDay = freezed,
    Object? isOutstanding = freezed,
    Object? description = freezed,
    Object? descriptionDetail = freezed,
  }) {
    return _then(_$CurrentPackageImpl(
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remainData: freezed == remainData
          ? _value.remainData
          : remainData // ignore: cast_nullable_to_non_nullable
              as String?,
      totalData: freezed == totalData
          ? _value.totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as String?,
      remainVoice: freezed == remainVoice
          ? _value.remainVoice
          : remainVoice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVoice: freezed == totalVoice
          ? _value.totalVoice
          : totalVoice // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cycle: freezed == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String?,
      remainSms: freezed == remainSms
          ? _value.remainSms
          : remainSms // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSms: freezed == totalSms
          ? _value.totalSms
          : totalSms // ignore: cast_nullable_to_non_nullable
              as String?,
      isMain: freezed == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      brief: freezed == brief
          ? _value.brief
          : brief // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPerDay: freezed == dataPerDay
          ? _value.dataPerDay
          : dataPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPerMonth: freezed == dataPerMonth
          ? _value.dataPerMonth
          : dataPerMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      arrRegCode: freezed == arrRegCode
          ? _value.arrRegCode
          : arrRegCode // ignore: cast_nullable_to_non_nullable
              as String?,
      onBuySim: freezed == onBuySim
          ? _value.onBuySim
          : onBuySim // ignore: cast_nullable_to_non_nullable
              as int?,
      regCodeTkc: freezed == regCodeTkc
          ? _value.regCodeTkc
          : regCodeTkc // ignore: cast_nullable_to_non_nullable
              as String?,
      regCode0D: freezed == regCode0D
          ? _value.regCode0D
          : regCode0D // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isInternalPackage: freezed == isInternalPackage
          ? _value.isInternalPackage
          : isInternalPackage // ignore: cast_nullable_to_non_nullable
              as int?,
      freeCallMinute: freezed == freeCallMinute
          ? _value.freeCallMinute
          : freeCallMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      freeSms: freezed == freeSms
          ? _value.freeSms
          : freeSms // ignore: cast_nullable_to_non_nullable
              as int?,
      validityDay: freezed == validityDay
          ? _value.validityDay
          : validityDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isOutstanding: freezed == isOutstanding
          ? _value.isOutstanding
          : isOutstanding // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      descriptionDetail: freezed == descriptionDetail
          ? _value._descriptionDetail
          : descriptionDetail // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentPackageImpl implements _CurrentPackage {
  const _$CurrentPackageImpl(
      {this.packageName,
      this.fromDate,
      this.toDate,
      this.remainData,
      this.totalData,
      this.remainVoice,
      this.totalVoice,
      this.code,
      this.name,
      this.cycle,
      this.remainSms,
      this.totalSms,
      @JsonKey(name: "is_main") this.isMain,
      this.price,
      this.brief,
      @JsonKey(name: "data_per_day") this.dataPerDay,
      @JsonKey(name: "data_per_month") this.dataPerMonth,
      this.index,
      @JsonKey(name: "sale_price") this.salePrice,
      this.status,
      @JsonKey(name: "arr_reg_code") this.arrRegCode,
      @JsonKey(name: "on_buy_sim") this.onBuySim,
      @JsonKey(name: "reg_code_tkc") this.regCodeTkc,
      @JsonKey(name: "reg_code_0d") this.regCode0D,
      this.id,
      @JsonKey(name: "is_internal_package") this.isInternalPackage,
      @JsonKey(name: "free_call_minute") this.freeCallMinute,
      @JsonKey(name: "free_sms") this.freeSms,
      @JsonKey(name: "validity_day") this.validityDay,
      @JsonKey(name: 'is_outstanding') this.isOutstanding,
      final List<String>? description,
      @JsonKey(name: 'description_detail')
      final List<String>? descriptionDetail})
      : _description = description,
        _descriptionDetail = descriptionDetail;

  factory _$CurrentPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentPackageImplFromJson(json);

  @override
  final String? packageName;
  @override
  final String? fromDate;
  @override
  final String? toDate;
  @override
  final String? remainData;
  @override
  final String? totalData;
  @override
  final String? remainVoice;
  @override
  final String? totalVoice;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? cycle;
  @override
  final String? remainSms;
  @override
  final String? totalSms;
  @override
  @JsonKey(name: "is_main")
  final int? isMain;
  @override
  final int? price;
  @override
  final String? brief;
  @override
  @JsonKey(name: "data_per_day")
  final int? dataPerDay;
  @override
  @JsonKey(name: "data_per_month")
  final int? dataPerMonth;
  @override
  final int? index;
  @override
  @JsonKey(name: "sale_price")
  final int? salePrice;
  @override
  final int? status;
  @override
  @JsonKey(name: "arr_reg_code")
  final String? arrRegCode;
  @override
  @JsonKey(name: "on_buy_sim")
  final int? onBuySim;
  @override
  @JsonKey(name: "reg_code_tkc")
  final String? regCodeTkc;
  @override
  @JsonKey(name: "reg_code_0d")
  final String? regCode0D;
  @override
  final int? id;
  @override
  @JsonKey(name: "is_internal_package")
  final int? isInternalPackage;
  @override
  @JsonKey(name: "free_call_minute")
  final int? freeCallMinute;
  @override
  @JsonKey(name: "free_sms")
  final int? freeSms;
  @override
  @JsonKey(name: "validity_day")
  final int? validityDay;
  @override
  @JsonKey(name: 'is_outstanding')
  final int? isOutstanding;
  final List<String>? _description;
  @override
  List<String>? get description {
    final value = _description;
    if (value == null) return null;
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _descriptionDetail;
  @override
  @JsonKey(name: 'description_detail')
  List<String>? get descriptionDetail {
    final value = _descriptionDetail;
    if (value == null) return null;
    if (_descriptionDetail is EqualUnmodifiableListView)
      return _descriptionDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurrentPackage(packageName: $packageName, fromDate: $fromDate, toDate: $toDate, remainData: $remainData, totalData: $totalData, remainVoice: $remainVoice, totalVoice: $totalVoice, code: $code, name: $name, cycle: $cycle, remainSms: $remainSms, totalSms: $totalSms, isMain: $isMain, price: $price, brief: $brief, dataPerDay: $dataPerDay, dataPerMonth: $dataPerMonth, index: $index, salePrice: $salePrice, status: $status, arrRegCode: $arrRegCode, onBuySim: $onBuySim, regCodeTkc: $regCodeTkc, regCode0D: $regCode0D, id: $id, isInternalPackage: $isInternalPackage, freeCallMinute: $freeCallMinute, freeSms: $freeSms, validityDay: $validityDay, isOutstanding: $isOutstanding, description: $description, descriptionDetail: $descriptionDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPackageImpl &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.remainData, remainData) ||
                other.remainData == remainData) &&
            (identical(other.totalData, totalData) ||
                other.totalData == totalData) &&
            (identical(other.remainVoice, remainVoice) ||
                other.remainVoice == remainVoice) &&
            (identical(other.totalVoice, totalVoice) ||
                other.totalVoice == totalVoice) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.remainSms, remainSms) ||
                other.remainSms == remainSms) &&
            (identical(other.totalSms, totalSms) ||
                other.totalSms == totalSms) &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.brief, brief) || other.brief == brief) &&
            (identical(other.dataPerDay, dataPerDay) ||
                other.dataPerDay == dataPerDay) &&
            (identical(other.dataPerMonth, dataPerMonth) ||
                other.dataPerMonth == dataPerMonth) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.arrRegCode, arrRegCode) ||
                other.arrRegCode == arrRegCode) &&
            (identical(other.onBuySim, onBuySim) ||
                other.onBuySim == onBuySim) &&
            (identical(other.regCodeTkc, regCodeTkc) ||
                other.regCodeTkc == regCodeTkc) &&
            (identical(other.regCode0D, regCode0D) ||
                other.regCode0D == regCode0D) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isInternalPackage, isInternalPackage) ||
                other.isInternalPackage == isInternalPackage) &&
            (identical(other.freeCallMinute, freeCallMinute) ||
                other.freeCallMinute == freeCallMinute) &&
            (identical(other.freeSms, freeSms) || other.freeSms == freeSms) &&
            (identical(other.validityDay, validityDay) ||
                other.validityDay == validityDay) &&
            (identical(other.isOutstanding, isOutstanding) ||
                other.isOutstanding == isOutstanding) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            const DeepCollectionEquality()
                .equals(other._descriptionDetail, _descriptionDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        packageName,
        fromDate,
        toDate,
        remainData,
        totalData,
        remainVoice,
        totalVoice,
        code,
        name,
        cycle,
        remainSms,
        totalSms,
        isMain,
        price,
        brief,
        dataPerDay,
        dataPerMonth,
        index,
        salePrice,
        status,
        arrRegCode,
        onBuySim,
        regCodeTkc,
        regCode0D,
        id,
        isInternalPackage,
        freeCallMinute,
        freeSms,
        validityDay,
        isOutstanding,
        const DeepCollectionEquality().hash(_description),
        const DeepCollectionEquality().hash(_descriptionDetail)
      ]);

  /// Create a copy of CurrentPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPackageImplCopyWith<_$CurrentPackageImpl> get copyWith =>
      __$$CurrentPackageImplCopyWithImpl<_$CurrentPackageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentPackageImplToJson(
      this,
    );
  }
}

abstract class _CurrentPackage implements CurrentPackage {
  const factory _CurrentPackage(
      {final String? packageName,
      final String? fromDate,
      final String? toDate,
      final String? remainData,
      final String? totalData,
      final String? remainVoice,
      final String? totalVoice,
      final String? code,
      final String? name,
      final String? cycle,
      final String? remainSms,
      final String? totalSms,
      @JsonKey(name: "is_main") final int? isMain,
      final int? price,
      final String? brief,
      @JsonKey(name: "data_per_day") final int? dataPerDay,
      @JsonKey(name: "data_per_month") final int? dataPerMonth,
      final int? index,
      @JsonKey(name: "sale_price") final int? salePrice,
      final int? status,
      @JsonKey(name: "arr_reg_code") final String? arrRegCode,
      @JsonKey(name: "on_buy_sim") final int? onBuySim,
      @JsonKey(name: "reg_code_tkc") final String? regCodeTkc,
      @JsonKey(name: "reg_code_0d") final String? regCode0D,
      final int? id,
      @JsonKey(name: "is_internal_package") final int? isInternalPackage,
      @JsonKey(name: "free_call_minute") final int? freeCallMinute,
      @JsonKey(name: "free_sms") final int? freeSms,
      @JsonKey(name: "validity_day") final int? validityDay,
      @JsonKey(name: 'is_outstanding') final int? isOutstanding,
      final List<String>? description,
      @JsonKey(name: 'description_detail')
      final List<String>? descriptionDetail}) = _$CurrentPackageImpl;

  factory _CurrentPackage.fromJson(Map<String, dynamic> json) =
      _$CurrentPackageImpl.fromJson;

  @override
  String? get packageName;
  @override
  String? get fromDate;
  @override
  String? get toDate;
  @override
  String? get remainData;
  @override
  String? get totalData;
  @override
  String? get remainVoice;
  @override
  String? get totalVoice;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get cycle;
  @override
  String? get remainSms;
  @override
  String? get totalSms;
  @override
  @JsonKey(name: "is_main")
  int? get isMain;
  @override
  int? get price;
  @override
  String? get brief;
  @override
  @JsonKey(name: "data_per_day")
  int? get dataPerDay;
  @override
  @JsonKey(name: "data_per_month")
  int? get dataPerMonth;
  @override
  int? get index;
  @override
  @JsonKey(name: "sale_price")
  int? get salePrice;
  @override
  int? get status;
  @override
  @JsonKey(name: "arr_reg_code")
  String? get arrRegCode;
  @override
  @JsonKey(name: "on_buy_sim")
  int? get onBuySim;
  @override
  @JsonKey(name: "reg_code_tkc")
  String? get regCodeTkc;
  @override
  @JsonKey(name: "reg_code_0d")
  String? get regCode0D;
  @override
  int? get id;
  @override
  @JsonKey(name: "is_internal_package")
  int? get isInternalPackage;
  @override
  @JsonKey(name: "free_call_minute")
  int? get freeCallMinute;
  @override
  @JsonKey(name: "free_sms")
  int? get freeSms;
  @override
  @JsonKey(name: "validity_day")
  int? get validityDay;
  @override
  @JsonKey(name: 'is_outstanding')
  int? get isOutstanding;
  @override
  List<String>? get description;
  @override
  @JsonKey(name: 'description_detail')
  List<String>? get descriptionDetail;

  /// Create a copy of CurrentPackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentPackageImplCopyWith<_$CurrentPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
