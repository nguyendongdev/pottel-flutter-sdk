import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../routers/routers.dart';
import 'register_controller.dart';
import '../../themes/colors.dart';
import '../../widgets/core/button/BaseElevatedButton.dart';
import '../../widgets/core/input/BaseInput.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary500,
        title: const Text(
          'Đăng ký',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Username field
              BaseInput(
                label: 'Tên tài khoản',
                hint: 'Nhập tên tài khoản',
                onChanged: (value) {
                  ref
                      .read(registerControllerProvider.notifier)
                      .updateUsername(value);
                },
                errorText:
                    state.usernameError.isEmpty ? null : state.usernameError,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Nickname field
              BaseInput(
                label: 'Biệt danh',
                hint: 'Nhập biệt danh',
                errorText:
                    state.nicknameError.isEmpty ? null : state.nicknameError,
                isRequired: true,
                onChanged: (value) {
                  ref
                      .read(registerControllerProvider.notifier)
                      .updateNickname(value);
                },
              ),
              const SizedBox(height: 16),

              // Email field
              BaseInput(
                label: 'Email',
                hint: 'abcconde@gmail.com',
                errorText: state.emailError.isEmpty ? null : state.emailError,
                onChanged: (value) {
                  ref
                      .read(registerControllerProvider.notifier)
                      .updateEmail(value);
                },
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Password field
              BaseInput(
                label: 'Mật khẩu',
                hint: 'Nhập mật khẩu (tối thiểu 6 ký tự)',
                errorText:
                    state.passwordError.isEmpty ? null : state.passwordError,
                onChanged: (value) {
                  ref
                      .read(registerControllerProvider.notifier)
                      .updatePassword(value);
                },
                isRequired: true,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Color(0xFFB1B1B3),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password field
              BaseInput(
                label: 'Xác nhận mật khẩu',
                hint: 'Nhập lại mật khẩu',
                errorText: state.confirmPasswordError.isEmpty
                    ? null
                    : state.confirmPasswordError,
                onChanged: (value) {
                  ref
                      .read(registerControllerProvider.notifier)
                      .updateConfirmPassword(value);
                },
                obscureText: true,
                isRequired: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Color(0xFFB1B1B3),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),

              // Register Button
              BaseGradientButton(
                onPressed: state.isLoading
                    ? null
                    : () async {
                        await controller.register();
                        context.pushNamed(AppRouter.otpRegister);
                      },
                borderRadius: BorderRadius.circular(16),
                child: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Đăng ký',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(height: 16),

              // Login Link
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Text(
                  'Đã có tài khoản? Đăng nhập ngay!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF040415),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
