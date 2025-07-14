import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_input.dart';
import '../provider/payment_order_provider.dart';

class ContactForm extends HookConsumerWidget {
  final String modeUI;
  const ContactForm({super.key, required this.modeUI});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String contactLabel = '';
    if (modeUI == 'USIM') {
      contactLabel =
          'Chúng tôi sẽ gửi chi tiết đơn hàng đến bạn theo thông tin liên hệ ở trên.';
    }
    if (modeUI == 'ESIM') {
      contactLabel =
          'Chúng tôi sẽ liên hệ và gửi thông tin kích hoạt eSIM đến bạn qua thông tin liên hệ đã cung cấp ở trên.';
    }

    if (modeUI == 'ALL') {
      contactLabel =
          'Chúng tôi sẽ liên hệ và gửi thông tin kích hoạt eSIM đến bạn qua thông tin liên hệ đã cung cấp ở trên.';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thông tin liên lạc',
          style: AppTextStyles.title,
        ),
        const SizedBox(height: AppSpacing.md),
        AppInput(
          label: 'Email',
          hintText: 'Nhập email',
          isRequired: true,
          onChanged: (value) {
            print('value: $value');
            ref.read(paymentOrderProvider.notifier).changeEmail(value);
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        if (modeUI == 'USIM' || modeUI == 'ALL')
          AppInput(
            label: 'Số điện thoại',
            hintText: 'Nhập số điện thoại',
            isRequired: true,
            onChanged: (value) {
              ref.read(paymentOrderProvider.notifier).changePhone(value);
            },
          ),
        const SizedBox(height: AppSpacing.sm),
        AppInput(
          label: 'Tên',
          hintText: 'Nhập tên',
          initialValue: '',
          isRequired: true,
          onChanged: (value) {
            ref.read(paymentOrderProvider.notifier).changeCustomerName(value);
          },
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          contactLabel,
          style: AppTextStyles.label.copyWith(
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
