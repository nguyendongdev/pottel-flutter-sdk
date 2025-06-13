import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../provider/address_provider.dart';
import '../provider/payment_order_provider.dart';
import 'select_address_data.dart';

class AddressForm extends HookConsumerWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(addressSelectionProvider);

    String getSelectedAddressText() {
      final parts = [
        selectedAddress.province?.name,
        selectedAddress.district?.name,
        selectedAddress.ward?.name,
      ].where((e) => e != null).join(', ');
      return parts;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Địa chỉ nhận SIM',
          style: AppTextStyles.title,
        ),
        const SizedBox(height: AppSpacing.md),
        _buildDropdownField(
          label: 'Tỉnh/Thành phố, Quận/ Huyện, Phường/Xã',
          text: getSelectedAddressText(),
          isSelected: selectedAddress.province != null,
          isRequired: true,
          context: context,
        ),
        const SizedBox(height: AppSpacing.sm),
        _buildInputField(
          label: 'Địa chỉ chi tiết',
          isRequired: true,
          hintText: 'Nhập địa chỉ chi tiết',
          onChanged: (value) {
            // print('addrese->: $value');
            ref.read(paymentOrderProvider.notifier).changeAddress(value);
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String text,
    required bool isSelected,
    bool isRequired = false,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTextStyles.small,
            ),
            if (isRequired)
              Text(
                '*',
                style: AppTextStyles.small.copyWith(
                  color: AppColors.red,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: AppColors.white,
                isScrollControlled: true,
                context: context,
                builder: (context) => const SelectAddressData(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: text.isEmpty
                        ? Text(
                            'Chọn địa chỉ nhận SIM',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textLight,
                            ),
                          )
                        : Text(
                            text,
                            style: AppTextStyles.body.copyWith(
                              color:
                                  isSelected ? AppColors.text : AppColors.text,
                            ),
                          ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    bool isRequired = false,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTextStyles.small,
            ),
            if (isRequired)
              Text(
                '*',
                style: AppTextStyles.small.copyWith(
                  color: AppColors.red,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          child: TextFormField(
            style: AppTextStyles.body,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.body.copyWith(
                color: AppColors.textLight,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textLight),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xs,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
