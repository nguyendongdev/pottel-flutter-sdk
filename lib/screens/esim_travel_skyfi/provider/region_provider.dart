import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../network/api.dart';
import '../models/region_model.dart';
import '../repository/region_repository.dart';

final apiProvider = Provider<API>((ref) {
  return API();
});

final regionRepositoryProvider = Provider<RegionRepository>((ref) {
  final api = ref.watch(apiProvider);
  return RegionRepository(api: api);
});

final selectedTabProvider = StateProvider<int>((ref) => 0);

final searchQueryProvider = StateProvider<String>((ref) => '');

final regionsProvider =
    FutureProvider.family<List<RegionModel>, String>((ref, type) async {
  final repository = ref.watch(regionRepositoryProvider);
  final response = await repository.getRegionsByType(type);
  return response.result;
});

final filteredRegionsProvider =
    Provider.family<List<RegionModel>, String>((ref, type) {
  final regions = ref.watch(regionsProvider(type));
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase().trim();

  return regions.when(
    data: (regions) {
      if (searchQuery.isEmpty) return regions;
      return regions.where((region) {
        final name = region.name.toLowerCase();
        final code = region.code.toLowerCase();
        final description = region.description?.toLowerCase() ?? '';
        return name.contains(searchQuery) ||
            code.contains(searchQuery) ||
            description.contains(searchQuery);
      }).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
