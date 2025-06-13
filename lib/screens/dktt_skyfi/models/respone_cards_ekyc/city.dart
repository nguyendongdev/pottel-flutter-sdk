import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {
  factory City({
    @JsonKey(name: 'city_code') String? cityCode,
    @JsonKey(name: 'city_name') String? cityName,
    @JsonKey(name: 'original_city') String? originalCity,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
