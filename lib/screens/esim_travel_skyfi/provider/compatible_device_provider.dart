import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/compatible_device_response.dart';
import '../repository/compatible_device_repository.dart';
import '../../../network/api.dart';

part 'compatible_device_provider.g.dart';

@riverpod
CompatibleDeviceRepository compatibleDeviceRepository(
    CompatibleDeviceRepositoryRef ref) {
  return CompatibleDeviceRepository(api: API());
}

@riverpod
Future<CompatibleDeviceResponse> compatibleDevices(
    CompatibleDevicesRef ref) async {
  final repository = ref.watch(compatibleDeviceRepositoryProvider);
  return repository.getCompatibleDevices();
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

@riverpod
List<BrandDevices> filteredDevices(FilteredDevicesRef ref) {
  final devicesAsync = ref.watch(compatibleDevicesProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  return devicesAsync.when(
    data: (data) {
      if (searchQuery.isEmpty) return data.result;

      return data.result
          .map((brand) {
            final filteredDevices = brand.devices
                .where(
                    (device) => device.name.toLowerCase().contains(searchQuery))
                .toList();

            if (filteredDevices.isEmpty) return null;

            return BrandDevices(
              brand: brand.brand,
              devices: filteredDevices,
            );
          })
          .whereType<BrandDevices>()
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
}
