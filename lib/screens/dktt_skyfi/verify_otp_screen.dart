import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';
import 'package:skyfi_sdk/network/api.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/models/save_log_respone/save_log_respone.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/provider/save_log_dktt_provider.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/outline_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../routers/routers.dart';
import 'widgets/item_send_otp.dart';
import 'widgets/step_indicator.dart';

class VerifyOtpScreen extends HookConsumerWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final phones = useState<List<dynamic>>([]);
    API api = API();

    void saveLog() async {
      try {
        Common.startLoadingDialog(context, 'Đang lưu thông tin...');
        isLoading.value = true;
        final response = await api.post(
          '/bss/videocall/save-log-video-call',
          data: ref.read(saveLogDkttNotifierProvider).toJson(),
        );
        final data = SaveLogRespone.fromJson(response.data);
        if (data.code == 200) {
          context.pushNamed(AppRouter.startVideoCall, extra: {
            'id': data.result?.id,
            'phone': data.result?.phone,
          });
          return;
        } else {
          // SnackBarApp.showError(context, message: data.message ?? '');
          throw Exception(data.message ?? 'Lỗi');
        }
      } catch (e) {
        print("error: $e");
        SnackBarApp.showError(context, message: e.toString());
      } finally {
        isLoading.value = false;
        Common.stopLoadingDialog(context);
      }
    }

    void onGetPhoneId() async {
      final idNumber = ref.read(saveLogDkttNotifierProvider).idNumber;
      print('idNumber: $idNumber');
      try {
        final response =
            await api.get('/bss/videocall/get-phone-in-idNumber/${idNumber}');
        final data = response.data;
        phones.value = data['result'];
        print('data: $data');
      } catch (e) {
        print("error: $e");
      }
    }

    ///api/bss/videocall/check-otp-dktt-update/{phone}/{otp}
    void checkOtpDkttUpdate(String otp, String phoneNumber) async {
      try {
        final response = await api
            .post('/bss/videocall/check-otp-dktt-update/$phoneNumber/$otp');
        final data = response.data;
        print('data check otp:  $data');
        if (data['code'] == 200) {
          print('data check otp:  $data');
          saveLog();
          return;
        } else {
          SnackBarApp.showError(context, message: data['message']);
        }
      } catch (e) {
        print("error: $e");
      }
    }

    void onShowAlert() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColors.white,
                insetPadding: const EdgeInsets.all(8),
                title: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Text(
                        'Thông báo',
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'Bạn xác nhận KHÔNG SỬ DỤNG Số TB SkyFi nào trong danh sách. Nếu chọn "Đồng ý" các số thuê bao gợi ý sẽ được đưa vào danh sách cần cập nhật lại TTTB.',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.cardPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlineButton(
                            height: 50,
                            width: 140,
                            text: 'Hủy bỏ',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            textStyle: AppTextStyles.button.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          GradientButton(
                            height: 50,
                            width: 140,
                            text: 'Đồng ý',
                            onPressed: () {
                              Navigator.pop(context);
                              saveLog();
                            },
                            textStyle: AppTextStyles.button.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
    }

    Future<String?> onPressedContinue(String phoneNumber) async {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxl,
                vertical: AppSpacing.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xác nhận OTP',
                    style: AppTextStyles.heading.copyWith(
                      color: AppColors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    'Vui lòng nhập mã OTP được gửi',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  OtpTextField(
                    onSubmit: (value) {
                      if (value.length == 6) {
                        Navigator.pop(context, value);
                      }
                    },
                    showFieldAsBox: true,
                    numberOfFields: 6,
                    autoFocus: true,
                    fieldWidth: 44,
                    mainAxisAlignment: MainAxisAlignment.center,
                    borderColor: AppColors.border,
                    focusedBorderColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).then((value) {
        if (value != null) {
          return checkOtpDkttUpdate(value, phoneNumber);
        }
        return;
      });
      return null;
    }

    void onSendOtp(String phoneNumber) async {
      try {
        final response =
            await api.get('/bss/videocall/send-otp-dktt-update/$phoneNumber');
        final data = response.data;
        if (data['code'] == 200) {
          onPressedContinue(phoneNumber);
          return;
        } else {
          SnackBarApp.showError(context, message: data['message']);
        }
        print('data: $data');
      } catch (e) {
        print("error: $e");
      }
    }

    useEffect(() {
      onGetPhoneId();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const StepIndicator(
          total: 4,
          current: 4,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xác thực OTP đăng ký/ cập nhật thông tin',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Lưu ý: Giấy tờ Bạn đang sử dụng để Đăng ký/Cập nhật thông tin thuê bao đang đứng tên cho từ 02 số thuê bao SkyFi trở lên. Vui lòng chọn 1 trong 2 trường hợp sau:',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Trường hợp 1: ',
                              style: AppTextStyles.title.copyWith(
                                color: AppColors.text,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Chọn 1 số thuê bao Bạn đang sử dụng, bấm nút "Gửi OTP"',
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      if (phones.value.isNotEmpty)
                        ...phones.value.map((phone) => ItemSendOtp(
                              phone: phone,
                              onPressed: () {
                                if (phone.startsWith('0')) {
                                  onSendOtp(phone);
                                } else {
                                  onSendOtp('0$phone');
                                }
                              },
                            )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Trường hợp 2: ',
                                style: AppTextStyles.title.copyWith(
                                  color: AppColors.text,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Nếu Bạn không sở hữu số thuê bao nào ở Trường hợp bên trên, bấm “Tiếp tục"',
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      GradientButton(
                        width: 100,
                        text: 'Tiếp tục',
                        onPressed: () {
                          onShowAlert();
                        },
                        textStyle: AppTextStyles.button.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(AppSpacing.md),
      //   child: BottomButton(
      //     onPressed: () {
      //       // onPressedContinue();
      //     },
      //     text: 'Tiếp tục',
      //     textStyle: AppTextStyles.button.copyWith(
      //       color: AppColors.text,
      //     ),
      //   ),
      // ),
    );
  }
}
