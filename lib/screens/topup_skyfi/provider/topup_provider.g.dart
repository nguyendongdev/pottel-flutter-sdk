// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topupNotifierHash() => r'56d0e2f6a879dfa4964565b5410a11f645b2ea45';

/// See also [TopupNotifier].
@ProviderFor(TopupNotifier)
final topupNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TopupNotifier, List<Result>?>.internal(
  TopupNotifier.new,
  name: r'topupNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topupNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TopupNotifier = AutoDisposeAsyncNotifier<List<Result>?>;
String _$selectedAmountNotifierHash() =>
    r'51503ae49843c3eef08b82fda466fda2a2db34ee';

/// See also [SelectedAmountNotifier].
@ProviderFor(SelectedAmountNotifier)
final selectedAmountNotifierProvider =
    AutoDisposeNotifierProvider<SelectedAmountNotifier, Result?>.internal(
  SelectedAmountNotifier.new,
  name: r'selectedAmountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedAmountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedAmountNotifier = AutoDisposeNotifier<Result?>;
String _$orderTopupNotifierHash() =>
    r'1b5b5676f0491b541e9349334bd0aeb77b2a3c0f';

/// See also [OrderTopupNotifier].
@ProviderFor(OrderTopupNotifier)
final orderTopupNotifierProvider =
    AutoDisposeNotifierProvider<OrderTopupNotifier, bool>.internal(
  OrderTopupNotifier.new,
  name: r'orderTopupNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderTopupNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderTopupNotifier = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
