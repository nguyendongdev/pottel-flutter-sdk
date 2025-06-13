import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String username,
    @Default('') String nickname,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default('') String usernameError,
    @Default('') String nicknameError,
    @Default('') String emailError,
    @Default('') String passwordError,
    @Default('') String confirmPasswordError,
    @Default(false) bool isLoading,
  }) = _RegisterState;
}
