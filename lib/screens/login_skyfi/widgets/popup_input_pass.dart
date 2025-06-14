import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../network/store.dart';
import '../../../routers/routers.dart';
import '../../../utilities/common.dart';
import '../repository/auth_service.dart';

class PopupInputPass extends HookConsumerWidget {
  const PopupInputPass({
    super.key,
    required this.phone,
    required this.onLoginOTP,
    required this.onClose,
    this.onLoginSuccess,
  });

  final String phone;
  final VoidCallback onLoginOTP;
  final VoidCallback onClose;
  final VoidCallback? onLoginSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = useMemoized(() => List.generate(
          6,
          (index) => TextEditingController(),
        ));
    final focusNodes = useMemoized(() => List.generate(
          6,
          (index) => FocusNode(),
        ));
    final authService = useMemoized(() => AuthService());
    final isLoading = useState(false);

    useEffect(() {
      return () {
        for (var controller in controllers) {
          controller.dispose();
        }
        for (var focusNode in focusNodes) {
          focusNode.dispose();
        }
      };
    }, []);

    void onChanged(String value, int index) {
      if (value.isNotEmpty && index < 5) {
        focusNodes[index + 1].requestFocus();
      } else if (value.isEmpty && index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    void showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Thông báo',
            style: AppTextStyles.heading.copyWith(color: AppColors.text),
          ),
          content: Text(
            message,
            style: AppTextStyles.body.copyWith(color: AppColors.text),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Đóng',
                style: AppTextStyles.body.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      );
    }

    void onContinue() async {
      final password = controllers.map((controller) => controller.text).join();

      if (password.length != 6) {
        showErrorDialog('Vui lòng nhập đủ 6 số mật khẩu');
        return;
      }

      isLoading.value = true;

      try {
        Common.startLoading(context);

        final response = await authService.loginWithPassword(
          msisdn: phone,
          password: password,
        );

        if (response.code == 200) {
          // Check if result is not null before accessing its properties
          if (response.result == null) {
            showErrorDialog('Đăng nhập thất bại. Vui lòng thử lại.');
            return;
          }

          // Save token and phone like in verifyOtp
          await StoreClient.setToken(response.result!.token);
          await StoreClient.setPhone(phone);

          // Call the success callback which will handle provider updates
          if (onLoginSuccess != null) {
            onLoginSuccess!();
          }

          // Close popup and navigate
          Navigator.of(context).popUntil((route) => route.isFirst);
          context.goNamed(AppRouter.homeSkyFiNew);
        } else {
          // Handle API error response
          String errorMessage = response.message;
          if (errorMessage.isEmpty) {
            errorMessage =
                'Đăng nhập thất bại. Vui lòng kiểm tra lại mật khẩu.';
          }
          showErrorDialog(errorMessage);
        }
      } catch (e) {
        String errorMessage = 'Có lỗi xảy ra khi đăng nhập';

        // Handle specific error types
        if (e is Exception) {
          String exceptionMessage =
              e.toString().replaceFirst('Exception: ', '');

          // Check for specific error patterns
          if (exceptionMessage.contains('mật khẩu không đúng') ||
              exceptionMessage.contains('password') ||
              exceptionMessage.contains('401')) {
            errorMessage = 'Mật khẩu không đúng. Vui lòng thử lại.';
          } else if (exceptionMessage.contains('timeout') ||
              exceptionMessage.contains('connection')) {
            errorMessage = 'Kết nối không ổn định. Vui lòng thử lại.';
          } else if (exceptionMessage.contains('Server trả về dữ liệu')) {
            errorMessage = 'Lỗi server. Vui lòng thử lại sau.';
          } else if (exceptionMessage.isNotEmpty) {
            errorMessage = exceptionMessage;
          }
        }

        debugPrint('Login error: $e');
        showErrorDialog(errorMessage);
      } finally {
        Common.stopLoading();
        isLoading.value = false;
      }
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppSpacing.sm),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nhập mật khẩu',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Vui lòng nhập mật khẩu để đăng nhập',
                  style: AppTextStyles.label.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                    height: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return _PasswordInputField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      onChanged: (value) => onChanged(value, index),
                      isActive: focusNodes[index].hasPrimaryFocus,
                    );
                  }),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: OutlineButton(
                        height: 48,
                        text: 'Đăng nhập OTP',
                        textStyle: AppTextStyles.button.copyWith(
                          fontSize: 14,
                          color: AppColors.strongSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                        onPressed: onLoginOTP,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      flex: 2,
                      child: GradientButton(
                        height: 48,
                        text: 'Tiếp tục',
                        onPressed: onContinue,
                        disabled: isLoading.value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // close button
            Positioned(
              top: -15,
              right: -15,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: onClose,
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  const _PasswordInputField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.isActive,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: AppColors.primary,
          textAlign: TextAlign.center,
          obscureText: true,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: AppTextStyles.body.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.zero,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
