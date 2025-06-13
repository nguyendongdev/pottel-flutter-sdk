// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatible_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$compatibleDeviceRepositoryHash() =>
    r'01bac01d167ba8ae3e76e966f18c5ff1ef458a44';

/// See also [compatibleDeviceRepository].
@ProviderFor(compatibleDeviceRepository)
final compatibleDeviceRepositoryProvider =
    AutoDisposeProvider<CompatibleDeviceRepository>.internal(
  compatibleDeviceRepository,
  name: r'compatibleDeviceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$compatibleDeviceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompatibleDeviceRepositoryRef
    = AutoDisposeProviderRef<CompatibleDeviceRepository>;
String _$compatibleDevicesHash() => r'1f2d8974064cbdf11973c1379e817740f666a1de';

/// See also [compatibleDevices].
@ProviderFor(compatibleDevices)
final compatibleDevicesProvider =
    AutoDisposeFutureProvider<CompatibleDeviceResponse>.internal(
  compatibleDevices,
  name: r'compatibleDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$compatibleDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompatibleDevicesRef
    = AutoDisposeFutureProviderRef<CompatibleDeviceResponse>;
String _$filteredDevicesHash() => r'91e2c786f747b81c5bdfe0d796dd3c2bd8b2aa9b';

/// See also [filteredDevices].
@ProviderFor(filteredDevices)
final filteredDevicesProvider =
    AutoDisposeProvider<List<BrandDevices>>.internal(
  filteredDevices,
  name: r'filteredDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredDevicesRef = AutoDisposeProviderRef<List<BrandDevices>>;
String _$searchQueryHash() => r'286abcff51dc844febe02639bb2e883ccab22cfd';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
