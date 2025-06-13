import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_user.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<LoginResponse?> build() => const AsyncValue.data(null);
}

@riverpod
class VerifyOtpNotifier extends _$VerifyOtpNotifier {
  @override
  AsyncValue<VerifyOtpResponse?> build() => const AsyncValue.data(null);
}
