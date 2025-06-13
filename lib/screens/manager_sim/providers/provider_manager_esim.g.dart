// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_manager_esim.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceManagerESimHash() =>
    r'f47e07f3785bc877338a864dab4d0d32a6f0699b';

/// See also [serviceManagerESim].
@ProviderFor(serviceManagerESim)
final serviceManagerESimProvider =
    AutoDisposeProvider<ServiceManagerESim>.internal(
  serviceManagerESim,
  name: r'serviceManagerESimProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceManagerESimHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServiceManagerESimRef = AutoDisposeProviderRef<ServiceManagerESim>;
String _$managerESimNotifierHash() =>
    r'0aeb496e34017c07477d63467dd60575e84a1831';

/// See also [ManagerESimNotifier].
@ProviderFor(ManagerESimNotifier)
final managerESimNotifierProvider = AutoDisposeAsyncNotifierProvider<
    ManagerESimNotifier, ResponseManagerEsim?>.internal(
  ManagerESimNotifier.new,
  name: r'managerESimNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$managerESimNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ManagerESimNotifier = AutoDisposeAsyncNotifier<ResponseManagerEsim?>;
String _$managerESimListDataHash() =>
    r'65b5b02e5b261a465f64a36bb1236859829fac92';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ManagerESimListData
    extends BuildlessAutoDisposeAsyncNotifier<ResponsePackage> {
  late final String iccid;

  FutureOr<ResponsePackage> build(
    String iccid,
  );
}

/// See also [ManagerESimListData].
@ProviderFor(ManagerESimListData)
const managerESimListDataProvider = ManagerESimListDataFamily();

/// See also [ManagerESimListData].
class ManagerESimListDataFamily extends Family<AsyncValue<ResponsePackage>> {
  /// See also [ManagerESimListData].
  const ManagerESimListDataFamily();

  /// See also [ManagerESimListData].
  ManagerESimListDataProvider call(
    String iccid,
  ) {
    return ManagerESimListDataProvider(
      iccid,
    );
  }

  @override
  ManagerESimListDataProvider getProviderOverride(
    covariant ManagerESimListDataProvider provider,
  ) {
    return call(
      provider.iccid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'managerESimListDataProvider';
}

/// See also [ManagerESimListData].
class ManagerESimListDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ManagerESimListData, ResponsePackage> {
  /// See also [ManagerESimListData].
  ManagerESimListDataProvider(
    String iccid,
  ) : this._internal(
          () => ManagerESimListData()..iccid = iccid,
          from: managerESimListDataProvider,
          name: r'managerESimListDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$managerESimListDataHash,
          dependencies: ManagerESimListDataFamily._dependencies,
          allTransitiveDependencies:
              ManagerESimListDataFamily._allTransitiveDependencies,
          iccid: iccid,
        );

  ManagerESimListDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.iccid,
  }) : super.internal();

  final String iccid;

  @override
  FutureOr<ResponsePackage> runNotifierBuild(
    covariant ManagerESimListData notifier,
  ) {
    return notifier.build(
      iccid,
    );
  }

  @override
  Override overrideWith(ManagerESimListData Function() create) {
    return ProviderOverride(
      origin: this,
      override: ManagerESimListDataProvider._internal(
        () => create()..iccid = iccid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        iccid: iccid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ManagerESimListData, ResponsePackage>
      createElement() {
    return _ManagerESimListDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ManagerESimListDataProvider && other.iccid == iccid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, iccid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ManagerESimListDataRef
    on AutoDisposeAsyncNotifierProviderRef<ResponsePackage> {
  /// The parameter `iccid` of this provider.
  String get iccid;
}

class _ManagerESimListDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ManagerESimListData,
        ResponsePackage> with ManagerESimListDataRef {
  _ManagerESimListDataProviderElement(super.provider);

  @override
  String get iccid => (origin as ManagerESimListDataProvider).iccid;
}

String _$tabManagerESimNotifierHash() =>
    r'628aeff9b531225d51f52b333e90813121822839';

/// See also [TabManagerESimNotifier].
@ProviderFor(TabManagerESimNotifier)
final tabManagerESimNotifierProvider = AutoDisposeNotifierProvider<
    TabManagerESimNotifier, TabManagerESim>.internal(
  TabManagerESimNotifier.new,
  name: r'tabManagerESimNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tabManagerESimNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TabManagerESimNotifier = AutoDisposeNotifier<TabManagerESim>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
