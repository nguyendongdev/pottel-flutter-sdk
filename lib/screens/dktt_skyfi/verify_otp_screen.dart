import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/outline_button.dart';
import '../../routers/routers.dart';
import 'widgets/item_send_otp.dart';
import 'widgets/step_indicator.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: 230,
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
                          GradientButton(
                            width: 120,
                            height: 50,
                            text: 'Đồng ý',
                            onPressed: () {
                              context.pushNamed(AppRouter.startVideoCall);
                            },
                            textStyle: AppTextStyles.button.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          OutlineButton(
                            width: 120,
                            height: 50,
                            text: 'Hủy bỏ',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            textStyle: AppTextStyles.button.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
    }

    void onPressedContinue() {
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
            height: 230,
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
                      // close dialog
                      Navigator.pop(context);
                      onShowAlert();
                    },
                    onCodeChanged: (value) => print(value),
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
      );
    }

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
      body: Padding(
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
              'Lưu ý: Giấy tờ Bạn đang sử dụng để Đăng ký/Cập nhật thông tin thuê bao đang đứng tên cho từ 02 số thuê bao SkyFi trờ lên. Vui lòng chọn 1 trong 2 trường hợp sau:',
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
                    const ItemSendOtp(),
                    const SizedBox(height: AppSpacing.md),
                    const ItemSendOtp(),
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
                      onPressed: onPressedContinue,
                      textStyle: AppTextStyles.button.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: BottomButton(
          onPressed: () {
            onPressedContinue();
          },
          text: 'Tiếp tục',
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
