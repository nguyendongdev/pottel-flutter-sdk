// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedHistoryTabHash() =>
    r'ab1534a15d1f376629d7fc48523a214e50df36cd';

/// See also [SelectedHistoryTab].
@ProviderFor(SelectedHistoryTab)
final selectedHistoryTabProvider =
    AutoDisposeNotifierProvider<SelectedHistoryTab, HistoryTab>.internal(
  SelectedHistoryTab.new,
  name: r'selectedHistoryTabProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedHistoryTabHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedHistoryTab = AutoDisposeNotifier<HistoryTab>;
String _$topupHistoryHash() => r'2d30448309c160a124cf99f190f94e0dfd659a9f';

/// See also [TopupHistory].
@ProviderFor(TopupHistory)
final topupHistoryProvider =
    AutoDisposeNotifierProvider<TopupHistory, List<HistoryItem>>.internal(
  TopupHistory.new,
  name: r'topupHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$topupHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TopupHistory = AutoDisposeNotifier<List<HistoryItem>>;
String _$serviceHistoryHash() => r'3f94dcc7eb7f82cfef328e91179664d370c87626';

/// See also [ServiceHistory].
@ProviderFor(ServiceHistory)
final serviceHistoryProvider =
    AutoDisposeNotifierProvider<ServiceHistory, List<HistoryItem>>.internal(
  ServiceHistory.new,
  name: r'serviceHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServiceHistory = AutoDisposeNotifier<List<HistoryItem>>;
String _$callHistoryHash() => r'b8a39dfd7d9c54e458daf546a24a118fda7bb66f';

/// See also [CallHistory].
@ProviderFor(CallHistory)
final callHistoryProvider =
    AutoDisposeNotifierProvider<CallHistory, List<HistoryItem>>.internal(
  CallHistory.new,
  name: r'callHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$callHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CallHistory = AutoDisposeNotifier<List<HistoryItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
