import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/esim_package_model.dart';
import '../repository/esim_package_repository.dart';
import 'region_provider.dart';

final esimPackageRepositoryProvider = Provider<EsimPackageRepository>((ref) {
  final api = ref.watch(apiProvider);
  return EsimPackageRepository(api: api);
});

// Create a notifier to handle region ID state
class SelectedRegionNotifier extends StateNotifier<int?> {
  SelectedRegionNotifier() : super(null);

  void setRegionId(int? id) {
    if (mounted) {
      state = id;
    }
  }

  void clearRegionId() {
    if (mounted) {
      state = null;
    }
  }
}

// Provide the notifier
final selectedRegionIdProvider =
    StateNotifierProvider<SelectedRegionNotifier, int?>((ref) {
  return SelectedRegionNotifier();
});

// Provide packages based on selected region
final esimPackagesProvider =
    FutureProvider<List<EsimPackageModel>>((ref) async {
  final repository = ref.watch(esimPackageRepositoryProvider);
  final regionId = ref.watch(selectedRegionIdProvider);

  if (regionId == null) return [];

  final response = await repository.getEsimPackagesByRegion(regionId);
  return response.result;
});
