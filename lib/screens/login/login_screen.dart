import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../routers/routers.dart';
import '../../themes/colors.dart';
import '../../widgets/core/button/BaseElevatedButton.dart';
import '../../widgets/core/button/BaseOutlineButton.dart';
import '../../widgets/core/button/SocialButton.dart';
import '../../widgets/core/input/BaseInput.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final isRememberMe = useState(false);
    final isLoading = useState(false);

    final login = useCallback(() async {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      context.pushReplacementNamed(AppRouter.homeMain);
    }, []);

    final forgotPassword = useCallback(() {
      context.pushNamed(AppRouter.forgotPassword);
    }, [context]);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF7E5E6)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/images/logo_white.png',
                      height: 120,
                      package: 'skyfi_sdk',
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Phone number input
                  BaseInput(
                    label: 'Tài khoản',
                    hint: 'Nhập SĐT',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    errorText: null,
                  ),
                  const SizedBox(height: 16),
                  // Password input
                  BaseInput(
                    label: 'Mật khẩu',
                    hint: '*********',
                    controller: passwordController,
                    obscureText: !isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF929292),
                      ),
                      onPressed: () =>
                          isPasswordVisible.value = !isPasswordVisible.value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Remember me & Forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isRememberMe.value,
                            onChanged: (value) =>
                                isRememberMe.value = value ?? false,
                            activeColor: primary500,
                          ),
                          const Text(
                            'Lưu thông tin đăng nhập',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF040415),
                              fontFamily: 'DM SansVN',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: BaseGradientButton(
                          onPressed: isLoading.value ? null : login,
                          borderRadius: BorderRadius.circular(16),
                          child: isLoading.value
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: BaseOutlineButton(
                          borderRadius: BorderRadius.circular(16),
                          onPressed: () {
                            context.pushNamed(AppRouter.register);
                          },
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEA0029),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: forgotPassword,
                    child: const Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontFamily: 'DM SansVN',
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Color(0xFF040415),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  // Social login
                  const Text(
                    'Hoặc đăng nhập bằng:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DM SansVN',
                      fontSize: 17,
                      color: Color(0xFF333341),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: Icons.facebook,
                        color: const Color(0xFF1877F2),
                        onPressed: () {
                          // TODO: Implement Facebook login
                        },
                      ),
                      const SizedBox(width: 23),
                      SocialButton(
                        icon: Icons.apple,
                        color: const Color(0xFF797979),
                        onPressed: () {
                          // TODO: Implement Apple login
                        },
                      ),
                      const SizedBox(width: 23),
                      SocialButton(
                        icon: Icons.g_mobiledata,
                        color: const Color(0xFF1976D2),
                        onPressed: () {
                          // TODO: Implement Google login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
