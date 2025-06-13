import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/utilities/common.dart';
import 'package:skyfi_sdk/utilities/modal.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../models/esim_package_model.dart';

class EsimPackageCard extends HookConsumerWidget {
  final EsimPackageModel package;

  final Function(int) onTap;
  final int quantity;

  const EsimPackageCard({
    super.key,
    required this.package,
    required this.onTap,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = useState(this.quantity);
    final textController =
        useTextEditingController(text: this.quantity.toString());
    return InkWell(
      onTap: () => onTap(quantity.value),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  package.name,
                  style: AppTextStyles.title,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dung lượng ',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                Text(
                  '${package.dataAmount.toInt()} ${package.dataUnit}',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hiệu lực ',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                Text(
                  '${package.validityDays} ngày',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giá: ',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                Text(
                  "${Common.formatCurrency(package.sellingPrice.toString())} ${package.currency}",
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            // số lượng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Số lượng: ',
                  style:
                      AppTextStyles.body.copyWith(color: AppColors.textLight),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        quantity.value--;
                        if (quantity.value < 1) {
                          quantity.value = 1;
                        }
                        textController.text = quantity.value.toString();
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: AppColors.textLight,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: textController,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          maxWidth: 30,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        counterText: '',
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle: AppTextStyles.body.copyWith(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w700),
                      ),
                      style: AppTextStyles.body.copyWith(
                          color: AppColors.text, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      onChanged: (value) {
                        final intValue = int.tryParse(value) ?? 1;
                        if (intValue > 0 && intValue <= 50) {
                          quantity.value = intValue;
                        } else {
                          quantity.value = 1;
                          textController.text = '1';
                          Modal.showError(
                            title: 'Số lượng không hợp lệ',
                            message: 'Số lượng phải từ 1 đến 50',
                          );
                        }
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        quantity.value++;
                        if (quantity.value > 50) {
                          quantity.value = 50;
                        }
                        textController.text = quantity.value.toString();
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            // Button Chọn mua
            GradientButton(
              height: 48,
              onPressed: () => onTap(quantity.value),
              text: 'Chọn mua',
              textStyle: AppTextStyles.body.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
