import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'district.dart';
import 'ward.dart';

part 'place_of_origin_detail.freezed.dart';
part 'place_of_origin_detail.g.dart';

@freezed
class PlaceOfOriginDetail with _$PlaceOfOriginDetail {
  factory PlaceOfOriginDetail({
    String? address,
    City? city,
    District? district,
    @JsonKey(name: 'full_address') String? fullAddress,
    Ward? ward,
  }) = _PlaceOfOriginDetail;

  factory PlaceOfOriginDetail.fromJson(Map<String, dynamic> json) =>
      _$PlaceOfOriginDetailFromJson(json);
}
