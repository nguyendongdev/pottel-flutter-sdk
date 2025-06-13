// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      address: json['address'] as String?,
      addressDetail: json['address_detail'] == null
          ? null
          : AddressDetail.fromJson(
              json['address_detail'] as Map<String, dynamic>),
      addressScore: json['address_score'] as String?,
      backCardType: json['back_card_type'] as String?,
      backFakeClass: json['back_fake_class'] as String?,
      backFakeScore: json['back_fake_score'] as String?,
      dob: json['dob'] as String?,
      dobScore: json['dob_score'] as String?,
      expiredDate: json['expired_date'] as String?,
      expiredDateScore: json['expired_date_score'] as String?,
      faceCount: json['face_count'] as String?,
      faceMatch: json['face_match'] as String?,
      faceScore: (json['face_score'] as num?)?.toDouble(),
      frontCardType: json['front_card_type'] as String?,
      frontFaceCount: json['front_face_count'] as String?,
      frontFakeClass: json['front_fake_class'] as String?,
      frontFakeScore: json['front_fake_score'] as String?,
      gender: json['gender'] as String?,
      genderScore: json['gender_score'] as String?,
      idnumber: json['idnumber'] as String?,
      idnumberScore: json['idnumber_score'] as String?,
      imgSizeValid: json['img_size_valid'] as bool?,
      issueDate: json['issue_date'] as String?,
      issueDateScore: json['issue_date_score'] as String?,
      issuedPlace: json['issued_place'] as String?,
      issuedPlaceScore: json['issued_place_score'] as String?,
      mrz: json['mrz'] == null
          ? null
          : Mrz.fromJson(json['mrz'] as Map<String, dynamic>),
      name: json['name'] as String?,
      nameScore: json['name_score'] as String?,
      nationality: json['nationality'] as String?,
      nationalityScore: json['nationality_score'] as String?,
      placeOfOrigin: json['place_of_origin'] as String?,
      placeOfOriginDetail: json['place_of_origin_detail'] == null
          ? null
          : PlaceOfOriginDetail.fromJson(
              json['place_of_origin_detail'] as Map<String, dynamic>),
      placeOfOriginScore: json['place_of_origin_score'] as String?,
      spoofClass: json['spoof_class'] as String?,
      spoofScore: json['spoof_score'] as String?,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'address_score': instance.addressScore,
      'back_card_type': instance.backCardType,
      'back_fake_class': instance.backFakeClass,
      'back_fake_score': instance.backFakeScore,
      'dob': instance.dob,
      'dob_score': instance.dobScore,
      'expired_date': instance.expiredDate,
      'expired_date_score': instance.expiredDateScore,
      'face_count': instance.faceCount,
      'face_match': instance.faceMatch,
      'face_score': instance.faceScore,
      'front_card_type': instance.frontCardType,
      'front_face_count': instance.frontFaceCount,
      'front_fake_class': instance.frontFakeClass,
      'front_fake_score': instance.frontFakeScore,
      'gender': instance.gender,
      'gender_score': instance.genderScore,
      'idnumber': instance.idnumber,
      'idnumber_score': instance.idnumberScore,
      'img_size_valid': instance.imgSizeValid,
      'issue_date': instance.issueDate,
      'issue_date_score': instance.issueDateScore,
      'issued_place': instance.issuedPlace,
      'issued_place_score': instance.issuedPlaceScore,
      'mrz': instance.mrz,
      'name': instance.name,
      'name_score': instance.nameScore,
      'nationality': instance.nationality,
      'nationality_score': instance.nationalityScore,
      'place_of_origin': instance.placeOfOrigin,
      'place_of_origin_detail': instance.placeOfOriginDetail,
      'place_of_origin_score': instance.placeOfOriginScore,
      'spoof_class': instance.spoofClass,
      'spoof_score': instance.spoofScore,
    };
