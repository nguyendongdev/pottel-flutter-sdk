import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';

class ModalInputOtp extends HookConsumerWidget {
  const ModalInputOtp({
    super.key,
    required this.onPressedContinue,
    required this.onPressedResendOtp,
    this.phone = "",
  });

  final Function(String) onPressedContinue;
  final Function() onPressedResendOtp;
  final String phone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: phone);
    final otp = useState<String>('');
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      width: MediaQuery.of(context).size.width,
      height: 280,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text(context.l10n.translate('notification'),
              style: AppTextStyles.title.copyWith(fontSize: AppSpacing.xl)),
          const SizedBox(height: AppSpacing.sm),
          Text(
              context.l10n.translate('otp_verification_message').replaceAll('{0}', phone),
              style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.sm),
          const SizedBox(height: AppSpacing.sm),
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
          const SizedBox(height: AppSpacing.sm),
          Text(
            context.l10n.translate('enter_otp_to_verify'),
            style: AppTextStyles.label.copyWith(
              color: AppColors.text,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  height: 48,
                  onPressed: () {
                    onPressedResendOtp();
                     Navigator.of(context).pop();
                  },
                  text: context.l10n.translate('resend_code'),
                  textStyle: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: GradientButton(
                  height: 48,
                  onPressed: () {
                    if (otp.value.isEmpty || otp.value.length != 6) {
                      Common.showToast(context.l10n.translate('please_enter_otp'), context);
                    } else {
                      onPressedContinue(otp.value);
                       Navigator.of(context).pop();
                    }
                  },
                  text: context.l10n.translate('confirm'),
                  textStyle: AppTextStyles.button.copyWith(
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
