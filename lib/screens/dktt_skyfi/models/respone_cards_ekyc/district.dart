import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
part 'district.g.dart';

@freezed
class District with _$District {
  factory District({
    @JsonKey(name: 'district_code') String? districtCode,
    @JsonKey(name: 'district_name') String? districtName,
    @JsonKey(name: 'original_district') String? originalDistrict,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
