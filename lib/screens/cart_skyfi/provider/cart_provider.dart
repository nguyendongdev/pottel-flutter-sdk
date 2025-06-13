import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utilities/common.dart';
import '../../home_skyfi/provider/login_provider.dart';
import '../models/cart_response.dart';
import '../repository/cart_repository.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  Future<CartResult> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    var customerId = ref.read(currentPhoneProvider);
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    print('customerId: $customerId');
    final response = await repository.getCart(customerId);
    return response.result;
  }

  // refetch cart
  Future<void> refetchCart() async {
    ref.invalidateSelf();
  }

  Future<void> updateQuantity(int itemId, int incrementBy) async {
    final repository = ref.read(cartRepositoryProvider);
    final customerId = ref.read(currentPhoneProvider);

    await repository.updateQuantity(customerId, itemId, incrementBy);
    ref.invalidateSelf();
  }

  Future<void> updateQuantityInput(
    int itemId,
    int quantity,
  ) async {
    final repository = ref.read(cartRepositoryProvider);
    final customerId = ref.read(currentPhoneProvider);

    await repository.updateQuantityInput(customerId, itemId, quantity);
    ref.invalidateSelf();
  }

  Future<void> addToCart({
    required int productId,
    required int variantId,
    required int msisdnId,
    required int quantity,
    required String packCode,
    required String simType,
  }) async {
    final repository = ref.read(cartRepositoryProvider);
    var customerId = ref.read(currentPhoneProvider);
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    await repository.addToCart(
      customerId,
      productId,
      variantId,
      msisdnId,
      quantity,
      packCode,
      simType,
    );
    ref.invalidateSelf();
  }

  Future<void> removeFromCart(int itemId) async {
    final repository = ref.read(cartRepositoryProvider);
    var customerId = ref.read(currentPhoneProvider);
    final deviceId = await Common.getDeviceId();
    if (customerId.isEmpty) {
      customerId = deviceId;
    }
    await repository.removeFromCart(customerId, itemId);
    ref.invalidateSelf();
  }

  double get totalAmount {
    final cart = state.valueOrNull;
    if (cart == null) return 0;

    return cart.items.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  int get itemCount {
    final cart = state.valueOrNull;
    if (cart == null) return 0;
    return cart.items.length;
  }
}
