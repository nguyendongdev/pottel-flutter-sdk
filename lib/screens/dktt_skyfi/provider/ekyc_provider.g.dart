// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekyc_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ekycHash() => r'b21c00ef6bb246507a1d70f2662f1fc067364e0d';

/// See also [Ekyc].
@ProviderFor(Ekyc)
final ekycProvider = AutoDisposeNotifierProvider<Ekyc, Ekyc>.internal(
  Ekyc.new,
  name: r'ekycProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ekycHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Ekyc = AutoDisposeNotifier<Ekyc>;
String _$typesScreenHash() => r'24d55e9fc8e42c6198116b243c5736c315620e69';

/// See also [TypesScreen].
@ProviderFor(TypesScreen)
final typesScreenProvider =
    AutoDisposeNotifierProvider<TypesScreen, EkycType>.internal(
  TypesScreen.new,
  name: r'typesScreenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$typesScreenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TypesScreen = AutoDisposeNotifier<EkycType>;
String _$numberIdRegisHash() => r'9f675a2b6529a1e318a59c48a91e50b4453c7701';

/// See also [NumberIdRegis].
@ProviderFor(NumberIdRegis)
final numberIdRegisProvider = NotifierProvider<NumberIdRegis, int>.internal(
  NumberIdRegis.new,
  name: r'numberIdRegisProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$numberIdRegisHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NumberIdRegis = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
