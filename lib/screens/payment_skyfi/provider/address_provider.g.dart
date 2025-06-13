// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$provincesHash() => r'053a7957b75a5a73f64483843749a1bb836e6ec1';

/// See also [provinces].
@ProviderFor(provinces)
final provincesProvider =
    AutoDisposeFutureProvider<List<AddressModel>>.internal(
  provinces,
  name: r'provincesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$provincesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProvincesRef = AutoDisposeFutureProviderRef<List<AddressModel>>;
String _$districtsHash() => r'c0989ab85a91a813c77b40d2ef611d3ec844d1ec';

/// See also [districts].
@ProviderFor(districts)
final districtsProvider =
    AutoDisposeFutureProvider<List<AddressModel>>.internal(
  districts,
  name: r'districtsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$districtsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DistrictsRef = AutoDisposeFutureProviderRef<List<AddressModel>>;
String _$wardsHash() => r'2163e9fb19fa7a4e105a6d0c0f11b87cd18d8b75';

/// See also [wards].
@ProviderFor(wards)
final wardsProvider = AutoDisposeFutureProvider<List<AddressModel>>.internal(
  wards,
  name: r'wardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$wardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WardsRef = AutoDisposeFutureProviderRef<List<AddressModel>>;
String _$addressSelectionHash() => r'627691a5cd2dd5eead8ed0f2eb32f4137aee3b65';

/// See also [AddressSelection].
@ProviderFor(AddressSelection)
final addressSelectionProvider =
    AutoDisposeNotifierProvider<AddressSelection, SelectedAddress>.internal(
  AddressSelection.new,
  name: r'addressSelectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressSelectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddressSelection = AutoDisposeNotifier<SelectedAddress>;
String _$addressStepHash() => r'8c4a8bc6e2aca90b220ff4e4eabda384ba1c9939';

/// See also [AddressStep].
@ProviderFor(AddressStep)
final addressStepProvider =
    AutoDisposeNotifierProvider<AddressStep, int>.internal(
  AddressStep.new,
  name: r'addressStepProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addressStepHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddressStep = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
