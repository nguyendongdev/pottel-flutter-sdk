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
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_detail')
  AddressDetail? get addressDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_score')
  String? get addressScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_card_type')
  String? get backCardType => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_fake_class')
  String? get backFakeClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_fake_score')
  String? get backFakeScore => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'dob_score')
  String? get dobScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  String? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date_score')
  String? get expiredDateScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'face_count')
  String? get faceCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'face_match')
  String? get faceMatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'face_score')
  double? get faceScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_card_type')
  String? get frontCardType => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_face_count')
  String? get frontFaceCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_fake_class')
  String? get frontFakeClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_fake_score')
  String? get frontFakeScore => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_score')
  String? get genderScore => throw _privateConstructorUsedError;
  String? get idnumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'idnumber_score')
  String? get idnumberScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'img_size_valid')
  bool? get imgSizeValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date')
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date_score')
  String? get issueDateScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_place')
  String? get issuedPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_place_score')
  String? get issuedPlaceScore => throw _privateConstructorUsedError;
  Mrz? get mrz => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_score')
  String? get nameScore => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  @JsonKey(name: 'nationality_score')
  String? get nationalityScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_origin')
  String? get placeOfOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_origin_detail')
  PlaceOfOriginDetail? get placeOfOriginDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_origin_score')
  String? get placeOfOriginScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoof_class')
  String? get spoofClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoof_score')
  String? get spoofScore => throw _privateConstructorUsedError;

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
      {String? address,
      @JsonKey(name: 'address_detail') AddressDetail? addressDetail,
      @JsonKey(name: 'address_score') String? addressScore,
      @JsonKey(name: 'back_card_type') String? backCardType,
      @JsonKey(name: 'back_fake_class') String? backFakeClass,
      @JsonKey(name: 'back_fake_score') String? backFakeScore,
      String? dob,
      @JsonKey(name: 'dob_score') String? dobScore,
      @JsonKey(name: 'expired_date') String? expiredDate,
      @JsonKey(name: 'expired_date_score') String? expiredDateScore,
      @JsonKey(name: 'face_count') String? faceCount,
      @JsonKey(name: 'face_match') String? faceMatch,
      @JsonKey(name: 'face_score') double? faceScore,
      @JsonKey(name: 'front_card_type') String? frontCardType,
      @JsonKey(name: 'front_face_count') String? frontFaceCount,
      @JsonKey(name: 'front_fake_class') String? frontFakeClass,
      @JsonKey(name: 'front_fake_score') String? frontFakeScore,
      String? gender,
      @JsonKey(name: 'gender_score') String? genderScore,
      String? idnumber,
      @JsonKey(name: 'idnumber_score') String? idnumberScore,
      @JsonKey(name: 'img_size_valid') bool? imgSizeValid,
      @JsonKey(name: 'issue_date') String? issueDate,
      @JsonKey(name: 'issue_date_score') String? issueDateScore,
      @JsonKey(name: 'issued_place') String? issuedPlace,
      @JsonKey(name: 'issued_place_score') String? issuedPlaceScore,
      Mrz? mrz,
      String? name,
      @JsonKey(name: 'name_score') String? nameScore,
      String? nationality,
      @JsonKey(name: 'nationality_score') String? nationalityScore,
      @JsonKey(name: 'place_of_origin') String? placeOfOrigin,
      @JsonKey(name: 'place_of_origin_detail')
      PlaceOfOriginDetail? placeOfOriginDetail,
      @JsonKey(name: 'place_of_origin_score') String? placeOfOriginScore,
      @JsonKey(name: 'spoof_class') String? spoofClass,
      @JsonKey(name: 'spoof_score') String? spoofScore});

  $AddressDetailCopyWith<$Res>? get addressDetail;
  $MrzCopyWith<$Res>? get mrz;
  $PlaceOfOriginDetailCopyWith<$Res>? get placeOfOriginDetail;
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
    Object? address = freezed,
    Object? addressDetail = freezed,
    Object? addressScore = freezed,
    Object? backCardType = freezed,
    Object? backFakeClass = freezed,
    Object? backFakeScore = freezed,
    Object? dob = freezed,
    Object? dobScore = freezed,
    Object? expiredDate = freezed,
    Object? expiredDateScore = freezed,
    Object? faceCount = freezed,
    Object? faceMatch = freezed,
    Object? faceScore = freezed,
    Object? frontCardType = freezed,
    Object? frontFaceCount = freezed,
    Object? frontFakeClass = freezed,
    Object? frontFakeScore = freezed,
    Object? gender = freezed,
    Object? genderScore = freezed,
    Object? idnumber = freezed,
    Object? idnumberScore = freezed,
    Object? imgSizeValid = freezed,
    Object? issueDate = freezed,
    Object? issueDateScore = freezed,
    Object? issuedPlace = freezed,
    Object? issuedPlaceScore = freezed,
    Object? mrz = freezed,
    Object? name = freezed,
    Object? nameScore = freezed,
    Object? nationality = freezed,
    Object? nationalityScore = freezed,
    Object? placeOfOrigin = freezed,
    Object? placeOfOriginDetail = freezed,
    Object? placeOfOriginScore = freezed,
    Object? spoofClass = freezed,
    Object? spoofScore = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetail: freezed == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as AddressDetail?,
      addressScore: freezed == addressScore
          ? _value.addressScore
          : addressScore // ignore: cast_nullable_to_non_nullable
              as String?,
      backCardType: freezed == backCardType
          ? _value.backCardType
          : backCardType // ignore: cast_nullable_to_non_nullable
              as String?,
      backFakeClass: freezed == backFakeClass
          ? _value.backFakeClass
          : backFakeClass // ignore: cast_nullable_to_non_nullable
              as String?,
      backFakeScore: freezed == backFakeScore
          ? _value.backFakeScore
          : backFakeScore // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      dobScore: freezed == dobScore
          ? _value.dobScore
          : dobScore // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDateScore: freezed == expiredDateScore
          ? _value.expiredDateScore
          : expiredDateScore // ignore: cast_nullable_to_non_nullable
              as String?,
      faceCount: freezed == faceCount
          ? _value.faceCount
          : faceCount // ignore: cast_nullable_to_non_nullable
              as String?,
      faceMatch: freezed == faceMatch
          ? _value.faceMatch
          : faceMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      faceScore: freezed == faceScore
          ? _value.faceScore
          : faceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      frontCardType: freezed == frontCardType
          ? _value.frontCardType
          : frontCardType // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFaceCount: freezed == frontFaceCount
          ? _value.frontFaceCount
          : frontFaceCount // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFakeClass: freezed == frontFakeClass
          ? _value.frontFakeClass
          : frontFakeClass // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFakeScore: freezed == frontFakeScore
          ? _value.frontFakeScore
          : frontFakeScore // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderScore: freezed == genderScore
          ? _value.genderScore
          : genderScore // ignore: cast_nullable_to_non_nullable
              as String?,
      idnumber: freezed == idnumber
          ? _value.idnumber
          : idnumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idnumberScore: freezed == idnumberScore
          ? _value.idnumberScore
          : idnumberScore // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSizeValid: freezed == imgSizeValid
          ? _value.imgSizeValid
          : imgSizeValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDateScore: freezed == issueDateScore
          ? _value.issueDateScore
          : issueDateScore // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlaceScore: freezed == issuedPlaceScore
          ? _value.issuedPlaceScore
          : issuedPlaceScore // ignore: cast_nullable_to_non_nullable
              as String?,
      mrz: freezed == mrz
          ? _value.mrz
          : mrz // ignore: cast_nullable_to_non_nullable
              as Mrz?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameScore: freezed == nameScore
          ? _value.nameScore
          : nameScore // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityScore: freezed == nationalityScore
          ? _value.nationalityScore
          : nationalityScore // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfOrigin: freezed == placeOfOrigin
          ? _value.placeOfOrigin
          : placeOfOrigin // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfOriginDetail: freezed == placeOfOriginDetail
          ? _value.placeOfOriginDetail
          : placeOfOriginDetail // ignore: cast_nullable_to_non_nullable
              as PlaceOfOriginDetail?,
      placeOfOriginScore: freezed == placeOfOriginScore
          ? _value.placeOfOriginScore
          : placeOfOriginScore // ignore: cast_nullable_to_non_nullable
              as String?,
      spoofClass: freezed == spoofClass
          ? _value.spoofClass
          : spoofClass // ignore: cast_nullable_to_non_nullable
              as String?,
      spoofScore: freezed == spoofScore
          ? _value.spoofScore
          : spoofScore // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressDetailCopyWith<$Res>? get addressDetail {
    if (_value.addressDetail == null) {
      return null;
    }

    return $AddressDetailCopyWith<$Res>(_value.addressDetail!, (value) {
      return _then(_value.copyWith(addressDetail: value) as $Val);
    });
  }

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MrzCopyWith<$Res>? get mrz {
    if (_value.mrz == null) {
      return null;
    }

    return $MrzCopyWith<$Res>(_value.mrz!, (value) {
      return _then(_value.copyWith(mrz: value) as $Val);
    });
  }

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceOfOriginDetailCopyWith<$Res>? get placeOfOriginDetail {
    if (_value.placeOfOriginDetail == null) {
      return null;
    }

    return $PlaceOfOriginDetailCopyWith<$Res>(_value.placeOfOriginDetail!,
        (value) {
      return _then(_value.copyWith(placeOfOriginDetail: value) as $Val);
    });
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
      {String? address,
      @JsonKey(name: 'address_detail') AddressDetail? addressDetail,
      @JsonKey(name: 'address_score') String? addressScore,
      @JsonKey(name: 'back_card_type') String? backCardType,
      @JsonKey(name: 'back_fake_class') String? backFakeClass,
      @JsonKey(name: 'back_fake_score') String? backFakeScore,
      String? dob,
      @JsonKey(name: 'dob_score') String? dobScore,
      @JsonKey(name: 'expired_date') String? expiredDate,
      @JsonKey(name: 'expired_date_score') String? expiredDateScore,
      @JsonKey(name: 'face_count') String? faceCount,
      @JsonKey(name: 'face_match') String? faceMatch,
      @JsonKey(name: 'face_score') double? faceScore,
      @JsonKey(name: 'front_card_type') String? frontCardType,
      @JsonKey(name: 'front_face_count') String? frontFaceCount,
      @JsonKey(name: 'front_fake_class') String? frontFakeClass,
      @JsonKey(name: 'front_fake_score') String? frontFakeScore,
      String? gender,
      @JsonKey(name: 'gender_score') String? genderScore,
      String? idnumber,
      @JsonKey(name: 'idnumber_score') String? idnumberScore,
      @JsonKey(name: 'img_size_valid') bool? imgSizeValid,
      @JsonKey(name: 'issue_date') String? issueDate,
      @JsonKey(name: 'issue_date_score') String? issueDateScore,
      @JsonKey(name: 'issued_place') String? issuedPlace,
      @JsonKey(name: 'issued_place_score') String? issuedPlaceScore,
      Mrz? mrz,
      String? name,
      @JsonKey(name: 'name_score') String? nameScore,
      String? nationality,
      @JsonKey(name: 'nationality_score') String? nationalityScore,
      @JsonKey(name: 'place_of_origin') String? placeOfOrigin,
      @JsonKey(name: 'place_of_origin_detail')
      PlaceOfOriginDetail? placeOfOriginDetail,
      @JsonKey(name: 'place_of_origin_score') String? placeOfOriginScore,
      @JsonKey(name: 'spoof_class') String? spoofClass,
      @JsonKey(name: 'spoof_score') String? spoofScore});

  @override
  $AddressDetailCopyWith<$Res>? get addressDetail;
  @override
  $MrzCopyWith<$Res>? get mrz;
  @override
  $PlaceOfOriginDetailCopyWith<$Res>? get placeOfOriginDetail;
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
    Object? address = freezed,
    Object? addressDetail = freezed,
    Object? addressScore = freezed,
    Object? backCardType = freezed,
    Object? backFakeClass = freezed,
    Object? backFakeScore = freezed,
    Object? dob = freezed,
    Object? dobScore = freezed,
    Object? expiredDate = freezed,
    Object? expiredDateScore = freezed,
    Object? faceCount = freezed,
    Object? faceMatch = freezed,
    Object? faceScore = freezed,
    Object? frontCardType = freezed,
    Object? frontFaceCount = freezed,
    Object? frontFakeClass = freezed,
    Object? frontFakeScore = freezed,
    Object? gender = freezed,
    Object? genderScore = freezed,
    Object? idnumber = freezed,
    Object? idnumberScore = freezed,
    Object? imgSizeValid = freezed,
    Object? issueDate = freezed,
    Object? issueDateScore = freezed,
    Object? issuedPlace = freezed,
    Object? issuedPlaceScore = freezed,
    Object? mrz = freezed,
    Object? name = freezed,
    Object? nameScore = freezed,
    Object? nationality = freezed,
    Object? nationalityScore = freezed,
    Object? placeOfOrigin = freezed,
    Object? placeOfOriginDetail = freezed,
    Object? placeOfOriginScore = freezed,
    Object? spoofClass = freezed,
    Object? spoofScore = freezed,
  }) {
    return _then(_$ResultImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetail: freezed == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as AddressDetail?,
      addressScore: freezed == addressScore
          ? _value.addressScore
          : addressScore // ignore: cast_nullable_to_non_nullable
              as String?,
      backCardType: freezed == backCardType
          ? _value.backCardType
          : backCardType // ignore: cast_nullable_to_non_nullable
              as String?,
      backFakeClass: freezed == backFakeClass
          ? _value.backFakeClass
          : backFakeClass // ignore: cast_nullable_to_non_nullable
              as String?,
      backFakeScore: freezed == backFakeScore
          ? _value.backFakeScore
          : backFakeScore // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      dobScore: freezed == dobScore
          ? _value.dobScore
          : dobScore // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDateScore: freezed == expiredDateScore
          ? _value.expiredDateScore
          : expiredDateScore // ignore: cast_nullable_to_non_nullable
              as String?,
      faceCount: freezed == faceCount
          ? _value.faceCount
          : faceCount // ignore: cast_nullable_to_non_nullable
              as String?,
      faceMatch: freezed == faceMatch
          ? _value.faceMatch
          : faceMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      faceScore: freezed == faceScore
          ? _value.faceScore
          : faceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      frontCardType: freezed == frontCardType
          ? _value.frontCardType
          : frontCardType // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFaceCount: freezed == frontFaceCount
          ? _value.frontFaceCount
          : frontFaceCount // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFakeClass: freezed == frontFakeClass
          ? _value.frontFakeClass
          : frontFakeClass // ignore: cast_nullable_to_non_nullable
              as String?,
      frontFakeScore: freezed == frontFakeScore
          ? _value.frontFakeScore
          : frontFakeScore // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderScore: freezed == genderScore
          ? _value.genderScore
          : genderScore // ignore: cast_nullable_to_non_nullable
              as String?,
      idnumber: freezed == idnumber
          ? _value.idnumber
          : idnumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idnumberScore: freezed == idnumberScore
          ? _value.idnumberScore
          : idnumberScore // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSizeValid: freezed == imgSizeValid
          ? _value.imgSizeValid
          : imgSizeValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDateScore: freezed == issueDateScore
          ? _value.issueDateScore
          : issueDateScore // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlace: freezed == issuedPlace
          ? _value.issuedPlace
          : issuedPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedPlaceScore: freezed == issuedPlaceScore
          ? _value.issuedPlaceScore
          : issuedPlaceScore // ignore: cast_nullable_to_non_nullable
              as String?,
      mrz: freezed == mrz
          ? _value.mrz
          : mrz // ignore: cast_nullable_to_non_nullable
              as Mrz?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameScore: freezed == nameScore
          ? _value.nameScore
          : nameScore // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityScore: freezed == nationalityScore
          ? _value.nationalityScore
          : nationalityScore // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfOrigin: freezed == placeOfOrigin
          ? _value.placeOfOrigin
          : placeOfOrigin // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfOriginDetail: freezed == placeOfOriginDetail
          ? _value.placeOfOriginDetail
          : placeOfOriginDetail // ignore: cast_nullable_to_non_nullable
              as PlaceOfOriginDetail?,
      placeOfOriginScore: freezed == placeOfOriginScore
          ? _value.placeOfOriginScore
          : placeOfOriginScore // ignore: cast_nullable_to_non_nullable
              as String?,
      spoofClass: freezed == spoofClass
          ? _value.spoofClass
          : spoofClass // ignore: cast_nullable_to_non_nullable
              as String?,
      spoofScore: freezed == spoofScore
          ? _value.spoofScore
          : spoofScore // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  _$ResultImpl(
      {this.address,
      @JsonKey(name: 'address_detail') this.addressDetail,
      @JsonKey(name: 'address_score') this.addressScore,
      @JsonKey(name: 'back_card_type') this.backCardType,
      @JsonKey(name: 'back_fake_class') this.backFakeClass,
      @JsonKey(name: 'back_fake_score') this.backFakeScore,
      this.dob,
      @JsonKey(name: 'dob_score') this.dobScore,
      @JsonKey(name: 'expired_date') this.expiredDate,
      @JsonKey(name: 'expired_date_score') this.expiredDateScore,
      @JsonKey(name: 'face_count') this.faceCount,
      @JsonKey(name: 'face_match') this.faceMatch,
      @JsonKey(name: 'face_score') this.faceScore,
      @JsonKey(name: 'front_card_type') this.frontCardType,
      @JsonKey(name: 'front_face_count') this.frontFaceCount,
      @JsonKey(name: 'front_fake_class') this.frontFakeClass,
      @JsonKey(name: 'front_fake_score') this.frontFakeScore,
      this.gender,
      @JsonKey(name: 'gender_score') this.genderScore,
      this.idnumber,
      @JsonKey(name: 'idnumber_score') this.idnumberScore,
      @JsonKey(name: 'img_size_valid') this.imgSizeValid,
      @JsonKey(name: 'issue_date') this.issueDate,
      @JsonKey(name: 'issue_date_score') this.issueDateScore,
      @JsonKey(name: 'issued_place') this.issuedPlace,
      @JsonKey(name: 'issued_place_score') this.issuedPlaceScore,
      this.mrz,
      this.name,
      @JsonKey(name: 'name_score') this.nameScore,
      this.nationality,
      @JsonKey(name: 'nationality_score') this.nationalityScore,
      @JsonKey(name: 'place_of_origin') this.placeOfOrigin,
      @JsonKey(name: 'place_of_origin_detail') this.placeOfOriginDetail,
      @JsonKey(name: 'place_of_origin_score') this.placeOfOriginScore,
      @JsonKey(name: 'spoof_class') this.spoofClass,
      @JsonKey(name: 'spoof_score') this.spoofScore});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final String? address;
  @override
  @JsonKey(name: 'address_detail')
  final AddressDetail? addressDetail;
  @override
  @JsonKey(name: 'address_score')
  final String? addressScore;
  @override
  @JsonKey(name: 'back_card_type')
  final String? backCardType;
  @override
  @JsonKey(name: 'back_fake_class')
  final String? backFakeClass;
  @override
  @JsonKey(name: 'back_fake_score')
  final String? backFakeScore;
  @override
  final String? dob;
  @override
  @JsonKey(name: 'dob_score')
  final String? dobScore;
  @override
  @JsonKey(name: 'expired_date')
  final String? expiredDate;
  @override
  @JsonKey(name: 'expired_date_score')
  final String? expiredDateScore;
  @override
  @JsonKey(name: 'face_count')
  final String? faceCount;
  @override
  @JsonKey(name: 'face_match')
  final String? faceMatch;
  @override
  @JsonKey(name: 'face_score')
  final double? faceScore;
  @override
  @JsonKey(name: 'front_card_type')
  final String? frontCardType;
  @override
  @JsonKey(name: 'front_face_count')
  final String? frontFaceCount;
  @override
  @JsonKey(name: 'front_fake_class')
  final String? frontFakeClass;
  @override
  @JsonKey(name: 'front_fake_score')
  final String? frontFakeScore;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'gender_score')
  final String? genderScore;
  @override
  final String? idnumber;
  @override
  @JsonKey(name: 'idnumber_score')
  final String? idnumberScore;
  @override
  @JsonKey(name: 'img_size_valid')
  final bool? imgSizeValid;
  @override
  @JsonKey(name: 'issue_date')
  final String? issueDate;
  @override
  @JsonKey(name: 'issue_date_score')
  final String? issueDateScore;
  @override
  @JsonKey(name: 'issued_place')
  final String? issuedPlace;
  @override
  @JsonKey(name: 'issued_place_score')
  final String? issuedPlaceScore;
  @override
  final Mrz? mrz;
  @override
  final String? name;
  @override
  @JsonKey(name: 'name_score')
  final String? nameScore;
  @override
  final String? nationality;
  @override
  @JsonKey(name: 'nationality_score')
  final String? nationalityScore;
  @override
  @JsonKey(name: 'place_of_origin')
  final String? placeOfOrigin;
  @override
  @JsonKey(name: 'place_of_origin_detail')
  final PlaceOfOriginDetail? placeOfOriginDetail;
  @override
  @JsonKey(name: 'place_of_origin_score')
  final String? placeOfOriginScore;
  @override
  @JsonKey(name: 'spoof_class')
  final String? spoofClass;
  @override
  @JsonKey(name: 'spoof_score')
  final String? spoofScore;

  @override
  String toString() {
    return 'Result(address: $address, addressDetail: $addressDetail, addressScore: $addressScore, backCardType: $backCardType, backFakeClass: $backFakeClass, backFakeScore: $backFakeScore, dob: $dob, dobScore: $dobScore, expiredDate: $expiredDate, expiredDateScore: $expiredDateScore, faceCount: $faceCount, faceMatch: $faceMatch, faceScore: $faceScore, frontCardType: $frontCardType, frontFaceCount: $frontFaceCount, frontFakeClass: $frontFakeClass, frontFakeScore: $frontFakeScore, gender: $gender, genderScore: $genderScore, idnumber: $idnumber, idnumberScore: $idnumberScore, imgSizeValid: $imgSizeValid, issueDate: $issueDate, issueDateScore: $issueDateScore, issuedPlace: $issuedPlace, issuedPlaceScore: $issuedPlaceScore, mrz: $mrz, name: $name, nameScore: $nameScore, nationality: $nationality, nationalityScore: $nationalityScore, placeOfOrigin: $placeOfOrigin, placeOfOriginDetail: $placeOfOriginDetail, placeOfOriginScore: $placeOfOriginScore, spoofClass: $spoofClass, spoofScore: $spoofScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressDetail, addressDetail) ||
                other.addressDetail == addressDetail) &&
            (identical(other.addressScore, addressScore) ||
                other.addressScore == addressScore) &&
            (identical(other.backCardType, backCardType) ||
                other.backCardType == backCardType) &&
            (identical(other.backFakeClass, backFakeClass) ||
                other.backFakeClass == backFakeClass) &&
            (identical(other.backFakeScore, backFakeScore) ||
                other.backFakeScore == backFakeScore) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.dobScore, dobScore) ||
                other.dobScore == dobScore) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.expiredDateScore, expiredDateScore) ||
                other.expiredDateScore == expiredDateScore) &&
            (identical(other.faceCount, faceCount) ||
                other.faceCount == faceCount) &&
            (identical(other.faceMatch, faceMatch) ||
                other.faceMatch == faceMatch) &&
            (identical(other.faceScore, faceScore) ||
                other.faceScore == faceScore) &&
            (identical(other.frontCardType, frontCardType) ||
                other.frontCardType == frontCardType) &&
            (identical(other.frontFaceCount, frontFaceCount) ||
                other.frontFaceCount == frontFaceCount) &&
            (identical(other.frontFakeClass, frontFakeClass) ||
                other.frontFakeClass == frontFakeClass) &&
            (identical(other.frontFakeScore, frontFakeScore) ||
                other.frontFakeScore == frontFakeScore) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.genderScore, genderScore) ||
                other.genderScore == genderScore) &&
            (identical(other.idnumber, idnumber) ||
                other.idnumber == idnumber) &&
            (identical(other.idnumberScore, idnumberScore) ||
                other.idnumberScore == idnumberScore) &&
            (identical(other.imgSizeValid, imgSizeValid) ||
                other.imgSizeValid == imgSizeValid) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.issueDateScore, issueDateScore) ||
                other.issueDateScore == issueDateScore) &&
            (identical(other.issuedPlace, issuedPlace) ||
                other.issuedPlace == issuedPlace) &&
            (identical(other.issuedPlaceScore, issuedPlaceScore) ||
                other.issuedPlaceScore == issuedPlaceScore) &&
            (identical(other.mrz, mrz) || other.mrz == mrz) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameScore, nameScore) ||
                other.nameScore == nameScore) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.nationalityScore, nationalityScore) ||
                other.nationalityScore == nationalityScore) &&
            (identical(other.placeOfOrigin, placeOfOrigin) ||
                other.placeOfOrigin == placeOfOrigin) &&
            (identical(other.placeOfOriginDetail, placeOfOriginDetail) ||
                other.placeOfOriginDetail == placeOfOriginDetail) &&
            (identical(other.placeOfOriginScore, placeOfOriginScore) ||
                other.placeOfOriginScore == placeOfOriginScore) &&
            (identical(other.spoofClass, spoofClass) ||
                other.spoofClass == spoofClass) &&
            (identical(other.spoofScore, spoofScore) ||
                other.spoofScore == spoofScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        address,
        addressDetail,
        addressScore,
        backCardType,
        backFakeClass,
        backFakeScore,
        dob,
        dobScore,
        expiredDate,
        expiredDateScore,
        faceCount,
        faceMatch,
        faceScore,
        frontCardType,
        frontFaceCount,
        frontFakeClass,
        frontFakeScore,
        gender,
        genderScore,
        idnumber,
        idnumberScore,
        imgSizeValid,
        issueDate,
        issueDateScore,
        issuedPlace,
        issuedPlaceScore,
        mrz,
        name,
        nameScore,
        nationality,
        nationalityScore,
        placeOfOrigin,
        placeOfOriginDetail,
        placeOfOriginScore,
        spoofClass,
        spoofScore
      ]);

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
      {final String? address,
      @JsonKey(name: 'address_detail') final AddressDetail? addressDetail,
      @JsonKey(name: 'address_score') final String? addressScore,
      @JsonKey(name: 'back_card_type') final String? backCardType,
      @JsonKey(name: 'back_fake_class') final String? backFakeClass,
      @JsonKey(name: 'back_fake_score') final String? backFakeScore,
      final String? dob,
      @JsonKey(name: 'dob_score') final String? dobScore,
      @JsonKey(name: 'expired_date') final String? expiredDate,
      @JsonKey(name: 'expired_date_score') final String? expiredDateScore,
      @JsonKey(name: 'face_count') final String? faceCount,
      @JsonKey(name: 'face_match') final String? faceMatch,
      @JsonKey(name: 'face_score') final double? faceScore,
      @JsonKey(name: 'front_card_type') final String? frontCardType,
      @JsonKey(name: 'front_face_count') final String? frontFaceCount,
      @JsonKey(name: 'front_fake_class') final String? frontFakeClass,
      @JsonKey(name: 'front_fake_score') final String? frontFakeScore,
      final String? gender,
      @JsonKey(name: 'gender_score') final String? genderScore,
      final String? idnumber,
      @JsonKey(name: 'idnumber_score') final String? idnumberScore,
      @JsonKey(name: 'img_size_valid') final bool? imgSizeValid,
      @JsonKey(name: 'issue_date') final String? issueDate,
      @JsonKey(name: 'issue_date_score') final String? issueDateScore,
      @JsonKey(name: 'issued_place') final String? issuedPlace,
      @JsonKey(name: 'issued_place_score') final String? issuedPlaceScore,
      final Mrz? mrz,
      final String? name,
      @JsonKey(name: 'name_score') final String? nameScore,
      final String? nationality,
      @JsonKey(name: 'nationality_score') final String? nationalityScore,
      @JsonKey(name: 'place_of_origin') final String? placeOfOrigin,
      @JsonKey(name: 'place_of_origin_detail')
      final PlaceOfOriginDetail? placeOfOriginDetail,
      @JsonKey(name: 'place_of_origin_score') final String? placeOfOriginScore,
      @JsonKey(name: 'spoof_class') final String? spoofClass,
      @JsonKey(name: 'spoof_score') final String? spoofScore}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String? get address;
  @override
  @JsonKey(name: 'address_detail')
  AddressDetail? get addressDetail;
  @override
  @JsonKey(name: 'address_score')
  String? get addressScore;
  @override
  @JsonKey(name: 'back_card_type')
  String? get backCardType;
  @override
  @JsonKey(name: 'back_fake_class')
  String? get backFakeClass;
  @override
  @JsonKey(name: 'back_fake_score')
  String? get backFakeScore;
  @override
  String? get dob;
  @override
  @JsonKey(name: 'dob_score')
  String? get dobScore;
  @override
  @JsonKey(name: 'expired_date')
  String? get expiredDate;
  @override
  @JsonKey(name: 'expired_date_score')
  String? get expiredDateScore;
  @override
  @JsonKey(name: 'face_count')
  String? get faceCount;
  @override
  @JsonKey(name: 'face_match')
  String? get faceMatch;
  @override
  @JsonKey(name: 'face_score')
  double? get faceScore;
  @override
  @JsonKey(name: 'front_card_type')
  String? get frontCardType;
  @override
  @JsonKey(name: 'front_face_count')
  String? get frontFaceCount;
  @override
  @JsonKey(name: 'front_fake_class')
  String? get frontFakeClass;
  @override
  @JsonKey(name: 'front_fake_score')
  String? get frontFakeScore;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'gender_score')
  String? get genderScore;
  @override
  String? get idnumber;
  @override
  @JsonKey(name: 'idnumber_score')
  String? get idnumberScore;
  @override
  @JsonKey(name: 'img_size_valid')
  bool? get imgSizeValid;
  @override
  @JsonKey(name: 'issue_date')
  String? get issueDate;
  @override
  @JsonKey(name: 'issue_date_score')
  String? get issueDateScore;
  @override
  @JsonKey(name: 'issued_place')
  String? get issuedPlace;
  @override
  @JsonKey(name: 'issued_place_score')
  String? get issuedPlaceScore;
  @override
  Mrz? get mrz;
  @override
  String? get name;
  @override
  @JsonKey(name: 'name_score')
  String? get nameScore;
  @override
  String? get nationality;
  @override
  @JsonKey(name: 'nationality_score')
  String? get nationalityScore;
  @override
  @JsonKey(name: 'place_of_origin')
  String? get placeOfOrigin;
  @override
  @JsonKey(name: 'place_of_origin_detail')
  PlaceOfOriginDetail? get placeOfOriginDetail;
  @override
  @JsonKey(name: 'place_of_origin_score')
  String? get placeOfOriginScore;
  @override
  @JsonKey(name: 'spoof_class')
  String? get spoofClass;
  @override
  @JsonKey(name: 'spoof_score')
  String? get spoofScore;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
