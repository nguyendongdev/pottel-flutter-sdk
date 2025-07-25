import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../l10n/localization_extension.dart';

class ModalInputMoneyFail extends HookConsumerWidget {
  ModalInputMoneyFail({
    super.key,
    required this.onPressedContinue,
  });

  final Function() onPressedContinue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 241,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text(context.l10n.translate('notification'),
              style: AppTextStyles.title.copyWith(fontSize: AppSpacing.xl)),
          const SizedBox(height: AppSpacing.sm),
          Text(context.l10n.translate('insufficient_balance_message'),
              style: AppTextStyles.label.copyWith(
                color: AppColors.text,
              )),
          const SizedBox(height: AppSpacing.sm),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  height: 48,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: context.l10n.translate('cancel'),
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
                    onPressedContinue();
                  },
                  text: context.l10n.translate('topup_money_action'),
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
