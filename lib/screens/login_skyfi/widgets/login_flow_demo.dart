import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../repository/auth_service.dart';
import 'popup_input_pass.dart';
import 'popup_setting_pass.dart';

class LoginFlowDemo extends StatefulWidget {
  const LoginFlowDemo({super.key});

  @override
  State<LoginFlowDemo> createState() => _LoginFlowDemoState();
}

class _LoginFlowDemoState extends State<LoginFlowDemo> {
  final TextEditingController _phoneController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
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

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Thành công',
          style: AppTextStyles.heading.copyWith(color: AppColors.text),
        ),
        content: Text(
          message,
          style: AppTextStyles.body.copyWith(color: AppColors.green),
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

  void _showPopupInputPass() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      _showErrorDialog('Vui lòng nhập số điện thoại trước');
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopupInputPass(
          phone: phone,
          onLoginOTP: () {
            Navigator.of(context).pop();
            _showSuccessDialog('Chuyển sang đăng nhập bằng OTP!');
          },
          onClose: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _showPopupSettingPass() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopupSettingPass(
          onSkip: () {
            Navigator.of(context).pop();
            _showSuccessDialog('Bỏ qua cài đặt mật khẩu!');
          },
          onSetPassword: (String password) {
            Navigator.of(context).pop();
            _showSuccessDialog('Đã cài đặt mật khẩu: $password');
          },
        );
      },
    );
  }

  void _checkUserPassword() async {
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      _showErrorDialog('Vui lòng nhập số điện thoại');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authService.checkUserPassword(phone);

      if (response.code == 200 && response.result != null) {
        if (response.result!.isSetPassword) {
          // User has password, show password input popup
          _showPopupInputPass();
        } else {
          // User doesn't have password, show setting password popup
          _showPopupSettingPass();
        }
      } else {
        _showErrorDialog(response.message);
      }
    } catch (e) {
      String errorMessage = 'Có lỗi xảy ra khi kiểm tra thông tin';
      if (e is Exception) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      }
      _showErrorDialog(errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Flow Demo'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Demo Login Flow với API',
              style: AppTextStyles.heading.copyWith(
                fontSize: 24,
                color: AppColors.text,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),

            Text(
              'Flow hoạt động:',
              style: AppTextStyles.title.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              '1. Nhập số điện thoại\n'
              '2. Gọi API check-user-password\n'
              '3. Nếu is_set_password = true → Hiển thị popup nhập mật khẩu\n'
              '4. Nếu is_set_password = false → Hiển thị popup cài đặt mật khẩu',
              style: AppTextStyles.body.copyWith(color: AppColors.textGrey),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Phone input
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                border: Border.all(color: AppColors.border),
              ),
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: AppTextStyles.body,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
                  border: InputBorder.none,
                  hintText: 'Nhập số điện thoại (VD: 0772574115)',
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.placeholder,
                  ),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.placeholder,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Check button
            ElevatedButton(
              onPressed: _isLoading ? null : _checkUserPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.white),
                      ),
                    )
                  : Text(
                      'Kiểm tra & Đăng nhập',
                      style: AppTextStyles.button.copyWith(fontSize: 16),
                    ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Manual test buttons
            Text(
              'Test thủ công các popup:',
              style: AppTextStyles.title.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: AppSpacing.md),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _showPopupInputPass,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    ),
                    child: Text(
                      'Popup Input Pass',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _showPopupSettingPass,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.strongSecondary,
                      side: const BorderSide(color: AppColors.strongSecondary),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    ),
                    child: Text(
                      'Popup Setting Pass',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.strongSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
