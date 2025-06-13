// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginNotifierHash() => r'7bc2d437ea8287bbb500b0149ce505f1effcd832';

/// See also [LoginNotifier].
@ProviderFor(LoginNotifier)
final loginNotifierProvider = AutoDisposeNotifierProvider<LoginNotifier,
    AsyncValue<LoginResponse?>>.internal(
  LoginNotifier.new,
  name: r'loginNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginNotifier = AutoDisposeNotifier<AsyncValue<LoginResponse?>>;
String _$verifyOtpNotifierHash() => r'0dd2e890d9ec5dfd18c1a9a05688b3cb1779b84c';

/// See also [VerifyOtpNotifier].
@ProviderFor(VerifyOtpNotifier)
final verifyOtpNotifierProvider = AutoDisposeNotifierProvider<VerifyOtpNotifier,
    AsyncValue<VerifyOtpResponse?>>.internal(
  VerifyOtpNotifier.new,
  name: r'verifyOtpNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$verifyOtpNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VerifyOtpNotifier
    = AutoDisposeNotifier<AsyncValue<VerifyOtpResponse?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
