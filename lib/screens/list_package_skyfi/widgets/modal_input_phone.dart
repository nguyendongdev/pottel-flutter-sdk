import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';

class ModalInputPhone extends HookConsumerWidget {
  const ModalInputPhone({
    super.key,
    required this.onPressedContinue,
    this.phone = "",
  });

  final Function(String) onPressedContinue;
  final String phone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: phone);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text('Thông báo',
              style: AppTextStyles.title.copyWith(fontSize: AppSpacing.xl)),
          const SizedBox(height: AppSpacing.sm),
          const Text('Vui lòng nhập số điện thoại muốn đăng ký gói cước.',
              style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.sm),
          // TEXT LEFT
          Row(
            children: [
              const Text("Số điện thoại ", style: AppTextStyles.title),
              Text("*",
                  style: AppTextStyles.title.copyWith(color: AppColors.red)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            textAlign: TextAlign.center,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.sm),
                borderSide: const BorderSide(
                  color: AppColors.border,
                ),
              ),
              hintText: 'Nhập số điện thoại',
            ),
            keyboardType: TextInputType.phone,
          ),
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
                    if (controller.text.isEmpty) {
                      Common.showToast('Vui lòng nhập số điện thoại', context);
                    } else {
                      onPressedContinue(
                        controller.text,
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  text: 'Tiếp tục',
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
