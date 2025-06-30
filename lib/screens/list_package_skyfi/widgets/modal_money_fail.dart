import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';

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
          Text('Thông báo',
              style: AppTextStyles.title.copyWith(fontSize: AppSpacing.xl)),
          const SizedBox(height: AppSpacing.sm),
          Text(
              'Tài khoản chính của Bạn không đủ tiền để đăng ký gói cước này .Vui lòng nạp thêm tiền để đăng ký gói cước.',
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
                  text: 'Hủy',
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
                  text: 'Nạp tiền',
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
