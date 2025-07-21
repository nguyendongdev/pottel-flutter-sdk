import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';
import '../../../core/widgets/app_input.dart';
import '../provider/payment_order_provider.dart';

class ContactForm extends HookConsumerWidget {
  final String modeUI;
  const ContactForm({super.key, required this.modeUI});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String contactLabel = '';
    if (modeUI == 'USIM') {
      contactLabel = context.l10n.translate('usim_contact_message');
    }
    if (modeUI == 'ESIM') {
      contactLabel = context.l10n.translate('esim_contact_message');
    }

    if (modeUI == 'ALL') {
      contactLabel = context.l10n.translate('all_contact_message');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.translate('contact_information'),
          style: AppTextStyles.title,
        ),
        const SizedBox(height: AppSpacing.md),
        AppInput(
          label: context.l10n.translate('email_payment'),
          hintText: context.l10n.translate('enter_email'),
          isRequired: true,
          onChanged: (value) {
            print('value: $value');
            ref.read(paymentOrderProvider.notifier).changeEmail(value);
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        if (modeUI == 'USIM' || modeUI == 'ALL')
          AppInput(
            label: context.l10n.translate('phone_number_payment'),
            hintText: context.l10n.translate('enter_phone_number_payment'),
            isRequired: true,
            onChanged: (value) {
              ref.read(paymentOrderProvider.notifier).changePhone(value);
            },
          ),
        const SizedBox(height: AppSpacing.sm),
        AppInput(
          label: context.l10n.translate('name_payment'),
          hintText: context.l10n.translate('enter_name'),
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
