import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'district.dart';
import 'ward.dart';

part 'address_detail.freezed.dart';
part 'address_detail.g.dart';

@freezed
class AddressDetail with _$AddressDetail {
  factory AddressDetail({
    String? address,
    City? city,
    District? district,
    Ward? ward,
  }) = _AddressDetail;

  factory AddressDetail.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailFromJson(json);
}
