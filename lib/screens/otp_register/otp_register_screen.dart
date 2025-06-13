import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../themes/colors.dart';
import '../../widgets/core/button/BaseElevatedButton.dart';

class OtpRegisterScreen extends ConsumerWidget {
  const OtpRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary500,
        title: const Text(
          'Thông báo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
        child: Column(
          children: [
            // bold number
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Skyfi đã gửi một mã xác thực OTP đến số điện thoại ',
                  ),
                  TextSpan(
                    text: '087 576 2296',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            OtpTextField(
              showFieldAsBox: true,
              numberOfFields: 4,
              borderColor: neutral400,
              fieldWidth: 50.0,
              focusedBorderColor: primary500,
              borderRadius: BorderRadius.circular(8),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Nhập mã OTP để xác thực',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            //Gửi lại mã (48s)
            const Text(
              'Gửi lại mã (48s)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            BaseGradientButton(
              width: double.infinity,
              height: 50,
              borderRadius: BorderRadius.circular(16),
              onPressed: () {},
              child: const Text(
                'Xác nhận',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
