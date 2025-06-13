import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_log_dktt.freezed.dart';
part 'save_log_dktt.g.dart';

@freezed
class SaveLogDktt with _$SaveLogDktt {
  factory SaveLogDktt({
    String? phone,
    int? isUpdate,
    String? agentCode,
    String? videoSource,
    String? img1,
    String? img2,
    String? img3,
    String? img4,
    String? seri,
    String? object,
    @JsonKey(name: 'card_type') String? cardType,
    @JsonKey(name: 'expired_date') String? expireDate,
    String? idNumber,
    String? passport,
    String? fullName,
    String? birthDay,
    String? gender,
    String? address,
    String? issueDate,
    String? issuePlace,
    String? international,
    String? contactPhone,
    String? homeTown,
    @JsonKey(name: 'city_code') String? cityCode,
    int? faceMatching,
    String? imsi,
    String? sob,
    @JsonKey(name: 'district_code') String? districtCode,
    @JsonKey(name: 'ward_code') String? wardCode,
  }) = _SaveLogDktt;

  factory SaveLogDktt.fromJson(Map<String, dynamic> json) =>
      _$SaveLogDkttFromJson(json);
}
