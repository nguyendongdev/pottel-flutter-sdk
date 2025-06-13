import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/cart_response.dart';
import '../../../utilities/common.dart';
part 'cart_repository.g.dart';

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository(API());
}

class CartRepository {
  final API _api;

  CartRepository(this._api);

  Future<CartResponse> getCart(String customerId) async {
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    try {
      final response = await _api.post('/bss/app/get-cart', data: {
        'customer_id': customerId,
      });

      if (response.data == null) {
        // Return empty cart response if data is null
        final now = DateTime.now();
        return CartResponse(
          requestId: null,
          code: 200,
          message: 'Success',
          totalRecords: 0,
          result: CartResult(
            cartId: 0,
            createdAt: now,
            updatedAt: now,
            expiresAt: now.add(const Duration(days: 1)),
            items: const [],
          ),
          extra: null,
        );
      }

      return CartResponse.fromJson(response.data);
    } catch (e) {
      // Return empty cart response on error
      final now = DateTime.now();
      return CartResponse(
        requestId: null,
        code: 500,
        message: e.toString(),
        totalRecords: 0,
        result: CartResult(
          cartId: 0,
          createdAt: now,
          updatedAt: now,
          expiresAt: now.add(const Duration(days: 1)),
          items: const [],
        ),
        extra: null,
      );
    }
  }

  Future<void> updateQuantity(
    String customerId,
    int itemId,
    int incrementBy,
  ) async {
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    await _api.post('/bss/app/increase-quantity', data: {
      'customer_id': customerId,
      'item_id': itemId,
      'increment_by': incrementBy,
    });
  }

  Future<void> updateQuantityInput(
    String customerId,
    int itemId,
    int incrementBy,
  ) async {
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    await _api.post('/bss/app/update-quantity', data: {
      'customer_id': customerId,
      'item_id': itemId,
      'increment_by': incrementBy,
    });
  }

  Future<void> addToCart(
    String customerId,
    int productId,
    int variantId,
    int msisdnId,
    int quantity,
    String packCode,
    String simType,
  ) async {
    await _api.post('/bss/app/add-to-cart', data: {
      'customer_id': customerId,
      'product_id': productId,
      'variant_id': variantId,
      'msisdn_id': msisdnId,
      'quantity': quantity,
      'pack_code': packCode,
      'sim_type': simType,
    });
  }

  // delete to cart
  Future<void> removeFromCart(String customerId, int itemId) async {
    await _api.delete('/bss/app/remove-from-cart', data: {
      'customer_id': customerId,
      'item_id': itemId,
    });
  }
}
