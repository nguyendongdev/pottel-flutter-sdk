import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/topup_response/result.dart';
import '../repositorty/topup_repository.dart';

part 'topup_provider.g.dart';

@riverpod
class TopupNotifier extends AutoDisposeAsyncNotifier<List<Result>?> {
  @override
  FutureOr<List<Result>?> build() async {
    final topupRepository = ref.watch(topupRepositoryProvider);
    final response = await topupRepository.getTopupAmounts();
    return response.result;
  }
}

// Provider for selected amount
@riverpod
class SelectedAmountNotifier extends AutoDisposeNotifier<Result?> {
  @override
  Result? build() => null;

  void selectAmount(Result item) {
    state = item;
  }

  void clearSelection() {
    state = null;
  }

  int? get selectedValue => state?.value;
  int? get selectedId => state?.id;
}

// Provider for order creation loading state
@riverpod
class OrderTopupNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  Future<Map<String, dynamic>?> createOrder({
    required String contactPhone,
  }) async {
    state = true;
    try {
      final selectedItem = ref.read(selectedAmountNotifierProvider);
      if (selectedItem == null) {
        state = false;
        return {
          'success': false,
          'error': 'Vui lòng chọn mệnh giá',
        };
      }

      final topupRepository = ref.watch(topupRepositoryProvider);
      final response = await topupRepository.createOrderTopup(
        selectedItem.id?.toString() ?? '1',
        selectedItem.value?.toString() ?? '0',
        contactPhone,
      );
      state = false;
      return {
        'success': true,
        'data': response.result?.orderNumber,
      };
    } catch (e) {
      state = false;
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}
