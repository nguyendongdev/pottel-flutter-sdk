import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'variant_id') int? variantId,
    @JsonKey(name: 'msisdn_id') int? msisdnId,
    @JsonKey(name: 'pack_price') int? packPrice,
    @JsonKey(name: 'sim_price') int? simPrice,
    @JsonKey(name: 'sale_price') int? salePrice,
    int? quantity,
    @JsonKey(name: 'sim_type') String? simType,
    @JsonKey(name: 'pack_code') String? packCode,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
