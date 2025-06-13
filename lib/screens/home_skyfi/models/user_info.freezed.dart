// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) {
  return _UserInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$UserInfoResponse {
  String? get requestId => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get totalRecords => throw _privateConstructorUsedError;
  UserInfo? get result => throw _privateConstructorUsedError;
  dynamic get extra => throw _privateConstructorUsedError;

  /// Serializes this UserInfoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoResponseCopyWith<UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResponseCopyWith<$Res> {
  factory $UserInfoResponseCopyWith(
          UserInfoResponse value, $Res Function(UserInfoResponse) then) =
      _$UserInfoResponseCopyWithImpl<$Res, UserInfoResponse>;
  @useResult
  $Res call(
      {String? requestId,
      int? code,
      String? message,
      int? totalRecords,
      UserInfo? result,
      dynamic extra});

  $UserInfoCopyWith<$Res>? get result;
}

/// @nodoc
class _$UserInfoResponseCopyWithImpl<$Res, $Val extends UserInfoResponse>
    implements $UserInfoResponseCopyWith<$Res> {
  _$UserInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoResponse
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
              as UserInfo?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoResponseImplCopyWith<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  factory _$$UserInfoResponseImplCopyWith(_$UserInfoResponseImpl value,
          $Res Function(_$UserInfoResponseImpl) then) =
      __$$UserInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? requestId,
      int? code,
      String? message,
      int? totalRecords,
      UserInfo? result,
      dynamic extra});

  @override
  $UserInfoCopyWith<$Res>? get result;
}

/// @nodoc
class __$$UserInfoResponseImplCopyWithImpl<$Res>
    extends _$UserInfoResponseCopyWithImpl<$Res, _$UserInfoResponseImpl>
    implements _$$UserInfoResponseImplCopyWith<$Res> {
  __$$UserInfoResponseImplCopyWithImpl(_$UserInfoResponseImpl _value,
      $Res Function(_$UserInfoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoResponse
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
    return _then(_$UserInfoResponseImpl(
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
              as UserInfo?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoResponseImpl implements _UserInfoResponse {
  const _$UserInfoResponseImpl(
      {this.requestId,
      this.code,
      this.message,
      this.totalRecords,
      this.result,
      this.extra});

  factory _$UserInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoResponseImplFromJson(json);

  @override
  final String? requestId;
  @override
  final int? code;
  @override
  final String? message;
  @override
  final int? totalRecords;
  @override
  final UserInfo? result;
  @override
  final dynamic extra;

  @override
  String toString() {
    return 'UserInfoResponse(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoResponseImpl &&
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

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoResponseImplCopyWith<_$UserInfoResponseImpl> get copyWith =>
      __$$UserInfoResponseImplCopyWithImpl<_$UserInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _UserInfoResponse implements UserInfoResponse {
  const factory _UserInfoResponse(
      {final String? requestId,
      final int? code,
      final String? message,
      final int? totalRecords,
      final UserInfo? result,
      final dynamic extra}) = _$UserInfoResponseImpl;

  factory _UserInfoResponse.fromJson(Map<String, dynamic> json) =
      _$UserInfoResponseImpl.fromJson;

  @override
  String? get requestId;
  @override
  int? get code;
  @override
  String? get message;
  @override
  int? get totalRecords;
  @override
  UserInfo? get result;
  @override
  dynamic get extra;

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoResponseImplCopyWith<_$UserInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: 'msisdn')
  String? get msisdn => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_date')
  String? get activeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'balace')
  String? get balace => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_number')
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_issue_place')
  String? get idIssuePlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_issue_date')
  String? get idIssueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'msisdn') String? msisdn,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'active_date') String? activeDate,
      @JsonKey(name: 'balace') String? balace,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'id_issue_place') String? idIssuePlace,
      @JsonKey(name: 'id_issue_date') String? idIssueDate,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = freezed,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? activeDate = freezed,
    Object? balace = freezed,
    Object? idNumber = freezed,
    Object? idIssuePlace = freezed,
    Object? idIssueDate = freezed,
    Object? gender = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      activeDate: freezed == activeDate
          ? _value.activeDate
          : activeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      balace: freezed == balace
          ? _value.balace
          : balace // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssuePlace: freezed == idIssuePlace
          ? _value.idIssuePlace
          : idIssuePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _value.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'msisdn') String? msisdn,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'active_date') String? activeDate,
      @JsonKey(name: 'balace') String? balace,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'id_issue_place') String? idIssuePlace,
      @JsonKey(name: 'id_issue_date') String? idIssueDate,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msisdn = freezed,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? activeDate = freezed,
    Object? balace = freezed,
    Object? idNumber = freezed,
    Object? idIssuePlace = freezed,
    Object? idIssueDate = freezed,
    Object? gender = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserInfoImpl(
      msisdn: freezed == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      activeDate: freezed == activeDate
          ? _value.activeDate
          : activeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      balace: freezed == balace
          ? _value.balace
          : balace // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssuePlace: freezed == idIssuePlace
          ? _value.idIssuePlace
          : idIssuePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _value.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {@JsonKey(name: 'msisdn') this.msisdn,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'active_date') this.activeDate,
      @JsonKey(name: 'balace') this.balace,
      @JsonKey(name: 'id_number') this.idNumber,
      @JsonKey(name: 'id_issue_place') this.idIssuePlace,
      @JsonKey(name: 'id_issue_date') this.idIssueDate,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'email') this.email});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  @JsonKey(name: 'msisdn')
  final String? msisdn;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'active_date')
  final String? activeDate;
  @override
  @JsonKey(name: 'balace')
  final String? balace;
  @override
  @JsonKey(name: 'id_number')
  final String? idNumber;
  @override
  @JsonKey(name: 'id_issue_place')
  final String? idIssuePlace;
  @override
  @JsonKey(name: 'id_issue_date')
  final String? idIssueDate;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString() {
    return 'UserInfo(msisdn: $msisdn, fullName: $fullName, address: $address, activeDate: $activeDate, balace: $balace, idNumber: $idNumber, idIssuePlace: $idIssuePlace, idIssueDate: $idIssueDate, gender: $gender, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.activeDate, activeDate) ||
                other.activeDate == activeDate) &&
            (identical(other.balace, balace) || other.balace == balace) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.idIssuePlace, idIssuePlace) ||
                other.idIssuePlace == idIssuePlace) &&
            (identical(other.idIssueDate, idIssueDate) ||
                other.idIssueDate == idIssueDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, msisdn, fullName, address,
      activeDate, balace, idNumber, idIssuePlace, idIssueDate, gender, email);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {@JsonKey(name: 'msisdn') final String? msisdn,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'active_date') final String? activeDate,
      @JsonKey(name: 'balace') final String? balace,
      @JsonKey(name: 'id_number') final String? idNumber,
      @JsonKey(name: 'id_issue_place') final String? idIssuePlace,
      @JsonKey(name: 'id_issue_date') final String? idIssueDate,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'email') final String? email}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  @JsonKey(name: 'msisdn')
  String? get msisdn;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'active_date')
  String? get activeDate;
  @override
  @JsonKey(name: 'balace')
  String? get balace;
  @override
  @JsonKey(name: 'id_number')
  String? get idNumber;
  @override
  @JsonKey(name: 'id_issue_place')
  String? get idIssuePlace;
  @override
  @JsonKey(name: 'id_issue_date')
  String? get idIssueDate;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'email')
  String? get email;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
