// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mrz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mrz _$MrzFromJson(Map<String, dynamic> json) {
  return _Mrz.fromJson(json);
}

/// @nodoc
mixin _$Mrz {
  @JsonKey(name: 'check_composite')
  String? get checkComposite => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_date_of_birth')
  String? get checkDateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_expiration_date')
  String? get checkExpirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_number')
  String? get checkNumber => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date')
  String? get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'mrz_type')
  String? get mrzType => throw _privateConstructorUsedError;
  String? get names => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get optional1 => throw _privateConstructorUsedError;
  String? get optional2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'raw_text')
  String? get rawText => throw _privateConstructorUsedError;
  String? get sex => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_composite')
  bool? get validComposite => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_date_of_birth')
  bool? get validDateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_expiration_date')
  bool? get validExpirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_number')
  bool? get validNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_score')
  int? get validScore => throw _privateConstructorUsedError;

  /// Serializes this Mrz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mrz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MrzCopyWith<Mrz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MrzCopyWith<$Res> {
  factory $MrzCopyWith(Mrz value, $Res Function(Mrz) then) =
      _$MrzCopyWithImpl<$Res, Mrz>;
  @useResult
  $Res call(
      {@JsonKey(name: 'check_composite') String? checkComposite,
      @JsonKey(name: 'check_date_of_birth') String? checkDateOfBirth,
      @JsonKey(name: 'check_expiration_date') String? checkExpirationDate,
      @JsonKey(name: 'check_number') String? checkNumber,
      String? country,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      @JsonKey(name: 'expiration_date') String? expirationDate,
      @JsonKey(name: 'mrz_type') String? mrzType,
      String? names,
      String? nationality,
      String? number,
      String? optional1,
      String? optional2,
      @JsonKey(name: 'raw_text') String? rawText,
      String? sex,
      String? surname,
      String? type,
      @JsonKey(name: 'valid_composite') bool? validComposite,
      @JsonKey(name: 'valid_date_of_birth') bool? validDateOfBirth,
      @JsonKey(name: 'valid_expiration_date') bool? validExpirationDate,
      @JsonKey(name: 'valid_number') bool? validNumber,
      @JsonKey(name: 'valid_score') int? validScore});
}

/// @nodoc
class _$MrzCopyWithImpl<$Res, $Val extends Mrz> implements $MrzCopyWith<$Res> {
  _$MrzCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mrz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkComposite = freezed,
    Object? checkDateOfBirth = freezed,
    Object? checkExpirationDate = freezed,
    Object? checkNumber = freezed,
    Object? country = freezed,
    Object? dateOfBirth = freezed,
    Object? expirationDate = freezed,
    Object? mrzType = freezed,
    Object? names = freezed,
    Object? nationality = freezed,
    Object? number = freezed,
    Object? optional1 = freezed,
    Object? optional2 = freezed,
    Object? rawText = freezed,
    Object? sex = freezed,
    Object? surname = freezed,
    Object? type = freezed,
    Object? validComposite = freezed,
    Object? validDateOfBirth = freezed,
    Object? validExpirationDate = freezed,
    Object? validNumber = freezed,
    Object? validScore = freezed,
  }) {
    return _then(_value.copyWith(
      checkComposite: freezed == checkComposite
          ? _value.checkComposite
          : checkComposite // ignore: cast_nullable_to_non_nullable
              as String?,
      checkDateOfBirth: freezed == checkDateOfBirth
          ? _value.checkDateOfBirth
          : checkDateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      checkExpirationDate: freezed == checkExpirationDate
          ? _value.checkExpirationDate
          : checkExpirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      checkNumber: freezed == checkNumber
          ? _value.checkNumber
          : checkNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mrzType: freezed == mrzType
          ? _value.mrzType
          : mrzType // ignore: cast_nullable_to_non_nullable
              as String?,
      names: freezed == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      optional1: freezed == optional1
          ? _value.optional1
          : optional1 // ignore: cast_nullable_to_non_nullable
              as String?,
      optional2: freezed == optional2
          ? _value.optional2
          : optional2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rawText: freezed == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      validComposite: freezed == validComposite
          ? _value.validComposite
          : validComposite // ignore: cast_nullable_to_non_nullable
              as bool?,
      validDateOfBirth: freezed == validDateOfBirth
          ? _value.validDateOfBirth
          : validDateOfBirth // ignore: cast_nullable_to_non_nullable
              as bool?,
      validExpirationDate: freezed == validExpirationDate
          ? _value.validExpirationDate
          : validExpirationDate // ignore: cast_nullable_to_non_nullable
              as bool?,
      validNumber: freezed == validNumber
          ? _value.validNumber
          : validNumber // ignore: cast_nullable_to_non_nullable
              as bool?,
      validScore: freezed == validScore
          ? _value.validScore
          : validScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MrzImplCopyWith<$Res> implements $MrzCopyWith<$Res> {
  factory _$$MrzImplCopyWith(_$MrzImpl value, $Res Function(_$MrzImpl) then) =
      __$$MrzImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'check_composite') String? checkComposite,
      @JsonKey(name: 'check_date_of_birth') String? checkDateOfBirth,
      @JsonKey(name: 'check_expiration_date') String? checkExpirationDate,
      @JsonKey(name: 'check_number') String? checkNumber,
      String? country,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      @JsonKey(name: 'expiration_date') String? expirationDate,
      @JsonKey(name: 'mrz_type') String? mrzType,
      String? names,
      String? nationality,
      String? number,
      String? optional1,
      String? optional2,
      @JsonKey(name: 'raw_text') String? rawText,
      String? sex,
      String? surname,
      String? type,
      @JsonKey(name: 'valid_composite') bool? validComposite,
      @JsonKey(name: 'valid_date_of_birth') bool? validDateOfBirth,
      @JsonKey(name: 'valid_expiration_date') bool? validExpirationDate,
      @JsonKey(name: 'valid_number') bool? validNumber,
      @JsonKey(name: 'valid_score') int? validScore});
}

/// @nodoc
class __$$MrzImplCopyWithImpl<$Res> extends _$MrzCopyWithImpl<$Res, _$MrzImpl>
    implements _$$MrzImplCopyWith<$Res> {
  __$$MrzImplCopyWithImpl(_$MrzImpl _value, $Res Function(_$MrzImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mrz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkComposite = freezed,
    Object? checkDateOfBirth = freezed,
    Object? checkExpirationDate = freezed,
    Object? checkNumber = freezed,
    Object? country = freezed,
    Object? dateOfBirth = freezed,
    Object? expirationDate = freezed,
    Object? mrzType = freezed,
    Object? names = freezed,
    Object? nationality = freezed,
    Object? number = freezed,
    Object? optional1 = freezed,
    Object? optional2 = freezed,
    Object? rawText = freezed,
    Object? sex = freezed,
    Object? surname = freezed,
    Object? type = freezed,
    Object? validComposite = freezed,
    Object? validDateOfBirth = freezed,
    Object? validExpirationDate = freezed,
    Object? validNumber = freezed,
    Object? validScore = freezed,
  }) {
    return _then(_$MrzImpl(
      checkComposite: freezed == checkComposite
          ? _value.checkComposite
          : checkComposite // ignore: cast_nullable_to_non_nullable
              as String?,
      checkDateOfBirth: freezed == checkDateOfBirth
          ? _value.checkDateOfBirth
          : checkDateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      checkExpirationDate: freezed == checkExpirationDate
          ? _value.checkExpirationDate
          : checkExpirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      checkNumber: freezed == checkNumber
          ? _value.checkNumber
          : checkNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mrzType: freezed == mrzType
          ? _value.mrzType
          : mrzType // ignore: cast_nullable_to_non_nullable
              as String?,
      names: freezed == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      optional1: freezed == optional1
          ? _value.optional1
          : optional1 // ignore: cast_nullable_to_non_nullable
              as String?,
      optional2: freezed == optional2
          ? _value.optional2
          : optional2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rawText: freezed == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      validComposite: freezed == validComposite
          ? _value.validComposite
          : validComposite // ignore: cast_nullable_to_non_nullable
              as bool?,
      validDateOfBirth: freezed == validDateOfBirth
          ? _value.validDateOfBirth
          : validDateOfBirth // ignore: cast_nullable_to_non_nullable
              as bool?,
      validExpirationDate: freezed == validExpirationDate
          ? _value.validExpirationDate
          : validExpirationDate // ignore: cast_nullable_to_non_nullable
              as bool?,
      validNumber: freezed == validNumber
          ? _value.validNumber
          : validNumber // ignore: cast_nullable_to_non_nullable
              as bool?,
      validScore: freezed == validScore
          ? _value.validScore
          : validScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MrzImpl implements _Mrz {
  _$MrzImpl(
      {@JsonKey(name: 'check_composite') this.checkComposite,
      @JsonKey(name: 'check_date_of_birth') this.checkDateOfBirth,
      @JsonKey(name: 'check_expiration_date') this.checkExpirationDate,
      @JsonKey(name: 'check_number') this.checkNumber,
      this.country,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      @JsonKey(name: 'expiration_date') this.expirationDate,
      @JsonKey(name: 'mrz_type') this.mrzType,
      this.names,
      this.nationality,
      this.number,
      this.optional1,
      this.optional2,
      @JsonKey(name: 'raw_text') this.rawText,
      this.sex,
      this.surname,
      this.type,
      @JsonKey(name: 'valid_composite') this.validComposite,
      @JsonKey(name: 'valid_date_of_birth') this.validDateOfBirth,
      @JsonKey(name: 'valid_expiration_date') this.validExpirationDate,
      @JsonKey(name: 'valid_number') this.validNumber,
      @JsonKey(name: 'valid_score') this.validScore});

  factory _$MrzImpl.fromJson(Map<String, dynamic> json) =>
      _$$MrzImplFromJson(json);

  @override
  @JsonKey(name: 'check_composite')
  final String? checkComposite;
  @override
  @JsonKey(name: 'check_date_of_birth')
  final String? checkDateOfBirth;
  @override
  @JsonKey(name: 'check_expiration_date')
  final String? checkExpirationDate;
  @override
  @JsonKey(name: 'check_number')
  final String? checkNumber;
  @override
  final String? country;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'expiration_date')
  final String? expirationDate;
  @override
  @JsonKey(name: 'mrz_type')
  final String? mrzType;
  @override
  final String? names;
  @override
  final String? nationality;
  @override
  final String? number;
  @override
  final String? optional1;
  @override
  final String? optional2;
  @override
  @JsonKey(name: 'raw_text')
  final String? rawText;
  @override
  final String? sex;
  @override
  final String? surname;
  @override
  final String? type;
  @override
  @JsonKey(name: 'valid_composite')
  final bool? validComposite;
  @override
  @JsonKey(name: 'valid_date_of_birth')
  final bool? validDateOfBirth;
  @override
  @JsonKey(name: 'valid_expiration_date')
  final bool? validExpirationDate;
  @override
  @JsonKey(name: 'valid_number')
  final bool? validNumber;
  @override
  @JsonKey(name: 'valid_score')
  final int? validScore;

  @override
  String toString() {
    return 'Mrz(checkComposite: $checkComposite, checkDateOfBirth: $checkDateOfBirth, checkExpirationDate: $checkExpirationDate, checkNumber: $checkNumber, country: $country, dateOfBirth: $dateOfBirth, expirationDate: $expirationDate, mrzType: $mrzType, names: $names, nationality: $nationality, number: $number, optional1: $optional1, optional2: $optional2, rawText: $rawText, sex: $sex, surname: $surname, type: $type, validComposite: $validComposite, validDateOfBirth: $validDateOfBirth, validExpirationDate: $validExpirationDate, validNumber: $validNumber, validScore: $validScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MrzImpl &&
            (identical(other.checkComposite, checkComposite) ||
                other.checkComposite == checkComposite) &&
            (identical(other.checkDateOfBirth, checkDateOfBirth) ||
                other.checkDateOfBirth == checkDateOfBirth) &&
            (identical(other.checkExpirationDate, checkExpirationDate) ||
                other.checkExpirationDate == checkExpirationDate) &&
            (identical(other.checkNumber, checkNumber) ||
                other.checkNumber == checkNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.mrzType, mrzType) || other.mrzType == mrzType) &&
            (identical(other.names, names) || other.names == names) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.optional1, optional1) ||
                other.optional1 == optional1) &&
            (identical(other.optional2, optional2) ||
                other.optional2 == optional2) &&
            (identical(other.rawText, rawText) || other.rawText == rawText) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.validComposite, validComposite) ||
                other.validComposite == validComposite) &&
            (identical(other.validDateOfBirth, validDateOfBirth) ||
                other.validDateOfBirth == validDateOfBirth) &&
            (identical(other.validExpirationDate, validExpirationDate) ||
                other.validExpirationDate == validExpirationDate) &&
            (identical(other.validNumber, validNumber) ||
                other.validNumber == validNumber) &&
            (identical(other.validScore, validScore) ||
                other.validScore == validScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        checkComposite,
        checkDateOfBirth,
        checkExpirationDate,
        checkNumber,
        country,
        dateOfBirth,
        expirationDate,
        mrzType,
        names,
        nationality,
        number,
        optional1,
        optional2,
        rawText,
        sex,
        surname,
        type,
        validComposite,
        validDateOfBirth,
        validExpirationDate,
        validNumber,
        validScore
      ]);

  /// Create a copy of Mrz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MrzImplCopyWith<_$MrzImpl> get copyWith =>
      __$$MrzImplCopyWithImpl<_$MrzImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MrzImplToJson(
      this,
    );
  }
}

abstract class _Mrz implements Mrz {
  factory _Mrz(
      {@JsonKey(name: 'check_composite') final String? checkComposite,
      @JsonKey(name: 'check_date_of_birth') final String? checkDateOfBirth,
      @JsonKey(name: 'check_expiration_date') final String? checkExpirationDate,
      @JsonKey(name: 'check_number') final String? checkNumber,
      final String? country,
      @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
      @JsonKey(name: 'expiration_date') final String? expirationDate,
      @JsonKey(name: 'mrz_type') final String? mrzType,
      final String? names,
      final String? nationality,
      final String? number,
      final String? optional1,
      final String? optional2,
      @JsonKey(name: 'raw_text') final String? rawText,
      final String? sex,
      final String? surname,
      final String? type,
      @JsonKey(name: 'valid_composite') final bool? validComposite,
      @JsonKey(name: 'valid_date_of_birth') final bool? validDateOfBirth,
      @JsonKey(name: 'valid_expiration_date') final bool? validExpirationDate,
      @JsonKey(name: 'valid_number') final bool? validNumber,
      @JsonKey(name: 'valid_score') final int? validScore}) = _$MrzImpl;

  factory _Mrz.fromJson(Map<String, dynamic> json) = _$MrzImpl.fromJson;

  @override
  @JsonKey(name: 'check_composite')
  String? get checkComposite;
  @override
  @JsonKey(name: 'check_date_of_birth')
  String? get checkDateOfBirth;
  @override
  @JsonKey(name: 'check_expiration_date')
  String? get checkExpirationDate;
  @override
  @JsonKey(name: 'check_number')
  String? get checkNumber;
  @override
  String? get country;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'expiration_date')
  String? get expirationDate;
  @override
  @JsonKey(name: 'mrz_type')
  String? get mrzType;
  @override
  String? get names;
  @override
  String? get nationality;
  @override
  String? get number;
  @override
  String? get optional1;
  @override
  String? get optional2;
  @override
  @JsonKey(name: 'raw_text')
  String? get rawText;
  @override
  String? get sex;
  @override
  String? get surname;
  @override
  String? get type;
  @override
  @JsonKey(name: 'valid_composite')
  bool? get validComposite;
  @override
  @JsonKey(name: 'valid_date_of_birth')
  bool? get validDateOfBirth;
  @override
  @JsonKey(name: 'valid_expiration_date')
  bool? get validExpirationDate;
  @override
  @JsonKey(name: 'valid_number')
  bool? get validNumber;
  @override
  @JsonKey(name: 'valid_score')
  int? get validScore;

  /// Create a copy of Mrz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MrzImplCopyWith<_$MrzImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
