// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MrzImpl _$$MrzImplFromJson(Map<String, dynamic> json) => _$MrzImpl(
      checkComposite: json['check_composite'] as String?,
      checkDateOfBirth: json['check_date_of_birth'] as String?,
      checkExpirationDate: json['check_expiration_date'] as String?,
      checkNumber: json['check_number'] as String?,
      country: json['country'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      expirationDate: json['expiration_date'] as String?,
      mrzType: json['mrz_type'] as String?,
      names: json['names'] as String?,
      nationality: json['nationality'] as String?,
      number: json['number'] as String?,
      optional1: json['optional1'] as String?,
      optional2: json['optional2'] as String?,
      rawText: json['raw_text'] as String?,
      sex: json['sex'] as String?,
      surname: json['surname'] as String?,
      type: json['type'] as String?,
      validComposite: json['valid_composite'] as bool?,
      validDateOfBirth: json['valid_date_of_birth'] as bool?,
      validExpirationDate: json['valid_expiration_date'] as bool?,
      validNumber: json['valid_number'] as bool?,
      validScore: (json['valid_score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MrzImplToJson(_$MrzImpl instance) => <String, dynamic>{
      'check_composite': instance.checkComposite,
      'check_date_of_birth': instance.checkDateOfBirth,
      'check_expiration_date': instance.checkExpirationDate,
      'check_number': instance.checkNumber,
      'country': instance.country,
      'date_of_birth': instance.dateOfBirth,
      'expiration_date': instance.expirationDate,
      'mrz_type': instance.mrzType,
      'names': instance.names,
      'nationality': instance.nationality,
      'number': instance.number,
      'optional1': instance.optional1,
      'optional2': instance.optional2,
      'raw_text': instance.rawText,
      'sex': instance.sex,
      'surname': instance.surname,
      'type': instance.type,
      'valid_composite': instance.validComposite,
      'valid_date_of_birth': instance.validDateOfBirth,
      'valid_expiration_date': instance.validExpirationDate,
      'valid_number': instance.validNumber,
      'valid_score': instance.validScore,
    };
