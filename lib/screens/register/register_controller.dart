import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skyfi_sdk/screens/register/register_state.dart';
import 'package:flutter/material.dart';
part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  RegisterState build() => const RegisterState();
  // handle onchange username
  void updateUsername(String value) {
    state = state.copyWith(
      username: value,
      usernameError: value.isEmpty ? 'Vui lòng nhập tên tài khoản' : '',
    );
  }

  void updateNickname(String value) {
    state = state.copyWith(
      nickname: value,
      nicknameError: value.isEmpty ? 'Vui lòng nhập biệt danh' : '',
    );
  }

  void updateEmail(String value) {
    final bool emailValid = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    ).hasMatch(value);

    state = state.copyWith(
      email: value,
      emailError: value.isEmpty
          ? 'Vui lòng nhập email'
          : !emailValid
              ? 'Email không hợp lệ'
              : '',
    );
  }

  void updatePassword(String value) {
    state = state.copyWith(
      password: value,
      passwordError: value.isEmpty
          ? 'Vui lòng nhập mật khẩu'
          : value.length < 6
              ? 'Mật khẩu phải có ít nhất 6 ký tự'
              : '',
    );
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(
      confirmPassword: value,
      confirmPasswordError: value.isEmpty
          ? 'Vui lòng xác nhận mật khẩu'
          : value != state.password
              ? 'Mật khẩu không khớp'
              : '',
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  // async function to simulate register process
  Future<void> register() async {
    if (isFormValid) {
      state = state.copyWith(isLoading: true);
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false);
    }
  }

  bool get isFormValid =>
      state.username.isNotEmpty &&
      state.nickname.isNotEmpty &&
      state.email.isNotEmpty &&
      state.password.isNotEmpty &&
      state.confirmPassword.isNotEmpty &&
      state.usernameError.isEmpty &&
      state.nicknameError.isEmpty &&
      state.emailError.isEmpty &&
      state.passwordError.isEmpty &&
      state.confirmPasswordError.isEmpty;
}
