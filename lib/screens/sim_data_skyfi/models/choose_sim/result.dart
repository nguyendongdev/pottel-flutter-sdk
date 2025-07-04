import 'package:freezed_annotation/freezed_annotation.dart';

import 'package.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: 'msisdn_id') int? msisdnId,
    String? msisdn,
    String? name,
    @JsonKey(name: 'base_price') int? basePrice,
    @JsonKey(name: 'sale_price') int? salePrice,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'variant_id') int? variantId,
    @JsonKey(name: 'usim_price') int? usimPrice,
    @JsonKey(name: 'esim_price') int? esimPrice,
    @JsonKey(name: 'network_price') int? networkPrice,
    List<Package>? packages,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
