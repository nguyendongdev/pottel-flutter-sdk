import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../themes/colors.dart';
import '../../widgets/core/input/BaseInput.dart';
import '../../widgets/core/button/BaseElevatedButton.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final emailController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quên mật khẩu',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primary500,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
        child: Column(
          children: [
            BaseInput(
              isRequired: true,
              label: 'Số điện thoại',
              hint: 'Nhập số điện thoại',
              controller: phoneController,
            ),
            const SizedBox(height: 16.0),
            BaseInput(
              isRequired: true,
              label: 'Email',
              hint: 'Nhập email',
              controller: emailController,
            ),
            const SizedBox(height: 50.0),
            BaseGradientButton(
              width: double.infinity,
              height: 50,
              borderRadius: BorderRadius.circular(16),
              onPressed: () {},
              child: const Text(
                'Gửi yêu cầu',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
