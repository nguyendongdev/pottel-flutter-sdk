import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    @JsonKey(name: 'requestId') String? requestId,
    required int code,
    required String message,
    @JsonKey(name: 'totalRecords') required int totalRecords,
    required CartResult result,
    dynamic extra,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@freezed
class CartResult with _$CartResult {
  const factory CartResult({
    @JsonKey(name: 'cart_id') required int cartId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
    required List<CartItem> items,
  }) = _CartResult;

  factory CartResult.fromJson(Map<String, dynamic> json) =>
      _$CartResultFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'cart_id') required int cartId,
    required int id,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'sim_type') required String simType,
    @JsonKey(name: 'region_id') required int regionId,
    @JsonKey(name: 'pack_code') required String packCode,
    @JsonKey(name: 'sale_price') required double salePrice,
    required int quantity,
    @JsonKey(name: 'pack_price') required double packPrice,
    @JsonKey(name: 'sim_price') required double simPrice,
    @JsonKey(name: 'msisdn_id') int? msisdnId,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'icon') required String icon,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
