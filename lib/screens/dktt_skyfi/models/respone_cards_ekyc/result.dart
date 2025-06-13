import 'package:freezed_annotation/freezed_annotation.dart';

import 'address_detail.dart';
import 'mrz.dart';
import 'place_of_origin_detail.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    String? address,
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
    @JsonKey(name: 'spoof_score') String? spoofScore,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
