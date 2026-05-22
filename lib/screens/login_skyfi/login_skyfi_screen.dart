import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/spacing.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/screens/login_skyfi/repository/auth_service.dart';
import 'package:pottel_sdk/screens/login_skyfi/repository/login_repository.dart';
import 'package:pottel_sdk/screens/login_skyfi/widgets/popup_input_pass.dart';
import 'package:pottel_sdk/screens/login_skyfi/widgets/popup_setting_pass.dart';
import 'package:pottel_sdk/utilities/modal.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/outline_button.dart';
import '../../l10n/localization_extension.dart';
import '../../network/api.dart';
import '../../utilities/common.dart';
import '../cart_skyfi/provider/cart_provider.dart';
import '../home_skyfi/provider/login_provider.dart';
import '../home_skyfi/provider/user_info_provider.dart';
import 'widgets/input_phone.dart';

class LoginSkyFiScreen extends HookConsumerWidget {
  const LoginSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = useState('');
    final otp = useState('');
    final loginRepository = LoginRepository(API());
    final authService = AuthService();

    final countdown = useState(0);
    final countdownTimer = useRef<Timer?>(null);

    // Start countdown function
    void startCountdown() {
      countdown.value = 180; // 1 second
      countdownTimer.value =
          Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          timer.cancel();
          countdownTimer.value = null;
        }
      });
    }

    // Format countdown display
    String formatCountdown(int seconds) {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }

    void navigateToHome() {
      context.goNamed(AppRouter.homeSkyFiNew);
    }

    void showPasswordSettingPopup(String phone) {
      // show dialog custom width and height
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopupSettingPass(
            onSkip: () {
              // Close all dialogs and navigate to home
              Navigator.of(context).popUntil((route) => route.isFirst);
              navigateToHome();
            },
            onSetPassword: (String password) async {
              try {
                Common.startLoading(context);
                final response = await authService.updatePassword(password);

                if (response.code == 200) {
                  // Close all dialogs and navigate to home
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response.message),
                      backgroundColor: Colors.green,
                    ),
                  );
                  navigateToHome();
                } else {
                  Modal.showError(
                      title: "Thông báo", message: response.message);
                }
              } catch (e) {
                String errorMessage = 'Có lỗi xảy ra khi cập nhật mật khẩu';
                if (e is Exception) {
                  errorMessage = e.toString().replaceFirst('Exception: ', '');
                }
                Modal.showError(
                    title: context.l10n.translate('notification'),
                    message: errorMessage);
              } finally {
                Common.stopLoading();
              }
            },
          );
        },
      );
    }

    void onVerifyOtp({required String phone, required String otp}) async {
      try {
        Common.startLoading(context);
        final resLogin = await loginRepository.verifyOtp(
          phone: phone,
          otp: otp,
        );
        Common.stopLoading();
        if (resLogin.code == 200) {
          ref.read(isLoginProvider.notifier).setIsLogin(true);
          ref.read(currentPhoneProvider.notifier).setCurrentPhone(phone);

          // Fetch user info after successful OTP login
          try {
            Common.startLoading(context);
            final userInfoResponse = await authService.fetchUserInfo(phone);
            if (userInfoResponse.code == 200 &&
                userInfoResponse.result != null) {
              ref
                  .read(userInfoProviderProvider.notifier)
                  .setUserInfo(userInfoResponse.result!);
            }
          } catch (e) {
            // Don't block login if user info fetch fails
            debugPrint('Error fetching user info: $e');
          } finally {
            Common.stopLoading();
          }

          // Refetch cart
          try {
            ref.read(cartProvider.notifier).refetchCart();
          } catch (e) {
            debugPrint('Error refetching cart: $e');
          }

          debugPrint('resLogin: ${resLogin.result?.isSetPassword}');

          // Close OTP dialog first
          Navigator.of(context).pop();

          // Check if user needs to set password
          if (resLogin.result?.isSetPassword == false) {
            showPasswordSettingPopup(phone);
          } else {
            navigateToHome();
          }
        } else {
          Modal.showError(
              title: "Thông báo",
              message: resLogin.message ?? 'Xác thực OTP thất bại');
        }
      } catch (e) {
        Common.stopLoading();
        String errorMessage = 'Đã có lỗi xảy ra';

        if (e is DioException) {
          switch (e.response?.statusCode) {
            case 404:
              errorMessage = 'Mã OTP không hợp lệ hoặc đã hết hạn';
              break;
            case 401:
              errorMessage = 'Không có quyền truy cập';
              break;
            case 400:
              errorMessage =
                  e.response?.data['message'] ?? 'Yêu cầu không hợp lệ';
              break;
            default:
              errorMessage = 'Lỗi kết nối máy chủ';
          }
        }

        Modal.showError(
            title: context.l10n.translate('notification'),
            message: errorMessage);
      }
    }

    void onSubmitOTP({required String phone, required String otp}) async {
      if (otp.length != 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              context.l10n.translate('please_enter_6_digit_otp'),
              style: AppTextStyles.body.copyWith(color: AppColors.white),
            ),
          ),
        );
        return;
      }
      onVerifyOtp(phone: phone, otp: otp);
    }

    void onShowPopupOTP({required String phone}) {
      void onResendOTP() async {
        try {
          final response = await loginRepository.resendOtp(phone);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //       content: Text(response['message'] ?? 'OTP đã được gửi lại')),
          // );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(context.l10n.translate('error_resending_otp'))),
          );
        }
      }

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                insetPadding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 350,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xxl,
                      vertical: AppSpacing.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.l10n.translate('confirm_otp_title'),
                                style: AppTextStyles.heading.copyWith(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(_);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          context.l10n
                              .translate('otp_sent_message')
                              .replaceAll('{0}', phone),
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        OtpTextField(
                          onSubmit: (value) => otp.value = value,
                          showFieldAsBox: true,
                          numberOfFields: 6,
                          autoFocus: true,
                          fieldWidth: 44,
                          mainAxisAlignment: MainAxisAlignment.center,
                          borderColor: AppColors.border,
                          focusedBorderColor: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          context.l10n.translate('enter_otp_to_verify_login'),
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        // button send otp
                        ValueListenableBuilder<int>(
                          valueListenable: countdown,
                          builder: (_, countdownValue, child) {
                            return TextButton(
                              onPressed: countdownValue > 0
                                  ? null
                                  : () {
                                      onResendOTP();
                                      startCountdown();
                                    },
                              child: Text(
                                countdownValue > 0
                                    ? context.l10n
                                        .translate('resend_otp_countdown')
                                        .replaceAll('{0}',
                                            formatCountdown(countdownValue))
                                    : context.l10n.translate('resend_otp'),
                                style: AppTextStyles.body.copyWith(
                                  color: countdownValue > 0
                                      ? AppColors.placeholder
                                      : AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  decoration: countdownValue > 0
                                      ? TextDecoration.none
                                      : TextDecoration.underline,
                                  decorationColor: countdownValue > 0
                                      ? AppColors.placeholder
                                      : AppColors.primary,
                                ),
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlineButton(
                                width: MediaQuery.of(context).size.width - 40,
                                height: 48,
                                onPressed: () async {
                                  // close dialog
                                  Navigator.pop(context);
                                },
                                text: context.l10n.translate('close_dialog'),
                                textStyle: AppTextStyles.body.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: GradientButton(
                                width: double.infinity,
                                height: 48,
                                onPressed: () {
                                  onSubmitOTP(
                                    phone: phone,
                                    otp: otp.value,
                                  );
                                },
                                text: context.l10n.translate('verify_button'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          });
    }

    void onSendOtp() async {
      try {
        // Common.startLoading(context);
        final resLogin = await loginRepository.sendOtp(phone.value);

        if (resLogin.code == 200) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(resLogin.message ?? 'OTP đã được gửi')),
          // );
          onShowPopupOTP(phone: phone.value);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resLogin.message ?? 'Có lỗi xảy ra')),
          );
        }
        startCountdown();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(context.l10n.translate('error_resending_otp'))),
        );
      } finally {
        // Common.stopLoading();
      }
    }

    void onShowPopupInputPass({required String phone}) {
      showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return PopupInputPass(
            phone: phone,
            onLoginOTP: () {
              Navigator.of(context).pop();
              // Send OTP instead
              onSendOtp();
            },
            onClose: () {
              Navigator.of(context).pop();
            },
            onLoginSuccess: () async {
              // Update providers when login is successful
              ref.read(isLoginProvider.notifier).setIsLogin(true);
              ref.read(currentPhoneProvider.notifier).setCurrentPhone(phone);

              // Fetch user info after successful login
              try {
                final userInfoResponse = await authService.fetchUserInfo(phone);
                if (userInfoResponse.code == 200 &&
                    userInfoResponse.result != null) {
                  ref
                      .read(userInfoProviderProvider.notifier)
                      .setUserInfo(userInfoResponse.result!);
                }
              } catch (e) {
                // Don't block login if user info fetch fails
                debugPrint('Error fetching user info: $e');
              }

              // Refetch cart
              try {
                ref.read(cartProvider.notifier).refetchCart();
              } catch (e) {
                debugPrint('Error refetching cart: $e');
              }
            },
          );
        },
      );
    }

    void onLogInPressed(String phone) async {
      if (phone.isEmpty) {
        Modal.showInfo(
          title: context.l10n.translate('notification'),
          message: context.l10n.translate('please_enter_phone_number_login'),
        );
        return;
      }
      // phone start with 077 and length 10
      if (phone.length != 10) {
        Modal.showInfo(
          title: context.l10n.translate('notification'),
          message: context.l10n.translate('invalid_phone_number'),
        );
        return;
      }

      try {
        // Check if user has password set
        final checkPasswordResponse =
            await authService.checkUserPassword(phone);

        if (checkPasswordResponse.code == 200 &&
            checkPasswordResponse.result != null) {
          // print("checkPasswordResponse ${checkPasswordResponse.result.isSetPassword}");
          if (checkPasswordResponse.result!.isSetPassword) {
            print("User has password set, showing input password popup");
            onShowPopupInputPass(phone: phone);
          } else {
            print("User does not have password set, sending OTP");
            // User doesn't have password, send OTP
            onSendOtp();
          }
        } else {
          Modal.showError(
              title: context.l10n.translate('notification'),
              message: checkPasswordResponse.message);
        }
      } catch (e) {
        String errorMessage = context.l10n.translate('error_occurred_login');
        if (e is Exception) {
          errorMessage = e.toString().replaceFirst('Exception: ', '');
        }
        Modal.showError(
            title: context.l10n.translate('notification'),
            message: errorMessage);
      } finally {
        Common.stopLoading();
      }
    }

    Widget buildAppBar() {
      return AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, color: AppColors.text),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildAppBar(),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/logo_skyfi_red.png',
                width: 118,
                height: 70,
                fit: BoxFit.contain,
                package: 'pottel_sdk',
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.translate('welcome_to_skyfi'),
                style: AppTextStyles.title.copyWith(
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                context.l10n.translate('please_login_to_explore'),
                style: AppTextStyles.body.copyWith(
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 36),
              InputPhone(
                label: context.l10n.translate('phone_number_login'),
                onChanged: (value) {
                  phone.value = value;
                },
                phoneNumber: phone.value,
              ),
              const SizedBox(height: 30),
              GradientButton(
                width: MediaQuery.of(context).size.width - 40,
                height: 48,
                onPressed: () {
                  onLogInPressed(phone.value);
                },
                text: context.l10n.translate('login_button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
