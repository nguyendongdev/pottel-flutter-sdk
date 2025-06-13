import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/store.dart';
import '../models/package_model.dart';
import '../repository/package_repository.dart';

part 'package_provider.g.dart';

@riverpod
class PackageNotifier extends AutoDisposeAsyncNotifier<List<PackageModel>> {
  @override
  Future<List<PackageModel>> build() async {
    final repository = ref.watch(packageRepositoryProvider);
    final phone = await StoreClient.getPhone() ?? '';
    final response = await repository.getAvailablePackages(phone);
    return response.result;
  }

  Future<void> selectPackage(String code) async {
    final currentState = state;
    if (!currentState.hasValue) return;

    state = AsyncData(
      currentState.value!.map((package) {
        return package.copyWith(isSelected: package.code == code);
      }).toList(),
    );
  }

  PackageModel? get selectedPackage {
    final currentState = state;
    if (!currentState.hasValue) return null;

    return currentState.value!.firstWhere(
      (package) => package.isSelected,
      orElse: () => currentState.value!.first,
    );
  }
}
