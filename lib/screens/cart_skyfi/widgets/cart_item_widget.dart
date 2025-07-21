import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/utilities/modal.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../utilities/common.dart';
import '../models/cart_response.dart';
import '../provider/cart_provider.dart';

// Custom useDebounce hook
String useDebounce(String value, Duration delay) {
  final debouncedValue = useState(value);

  useEffect(() {
    final timer = Timer(delay, () {
      debouncedValue.value = value;
    });

    return timer.cancel;
  }, [value]);

  return debouncedValue.value;
}

class CartItemWidget extends HookConsumerWidget {
  final CartItem item;

  const CartItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTravel = item.simType == 'ESIM_TRAVEL';
    final uri = isTravel
        ? 'assets/images/global_flag.png'
        : 'assets/images/sim_logo.png';
    final quantity = useState(1);

    final textController =
        useTextEditingController(text: quantity.value.toString());

    final debouncedText =
        useDebounce(textController.text, const Duration(milliseconds: 800));

    useEffect(() {
      quantity.value = item.quantity;
      textController.text = quantity.value.toString();
      return null;
    }, [item.quantity]);

    updateQuantity() {
      ref.read(cartProvider.notifier).updateQuantityInput(
            item.id,
            quantity.value,
          );
    }

    useEffect(() {
      if (debouncedText.isNotEmpty) {
        updateQuantity();
      }
      return null;
    }, [debouncedText]);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: isTravel
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      item.icon,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    width: 40,
                    height: 40,
                    uri,
                    fit: BoxFit.cover,
                    package: 'skyfi_sdk',
                  ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.productName,
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  Common.getSimTypeName(item.simType),
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                if (item.packCode.isNotEmpty)
                  Text(
                    '${isTravel ? item.packCode : item.packCode.isEmpty ? '' : context.l10n.translate('package_prefix').replaceAll('{0}', item.packCode)} ',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                const SizedBox(height: AppSpacing.sm),
                if (item.simType == 'ESIM_TRAVEL')
                  Row(
                    children: [
                      IconButton(
                        disabledColor: AppColors.textLight,
                        onPressed: () {
                          if (quantity.value <= 1) {
                            return;
                          }
                          quantity.value--;
                          textController.text = quantity.value.toString();
                        },
                        icon: Icon(Icons.remove_circle_outline,
                            color: item.quantity > 1
                                ? AppColors.primary
                                : AppColors.textLight),
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
                              title: context.l10n.translate('invalid_quantity_title'),
                              message: context.l10n.translate('invalid_quantity_message'),
                            );
                          }
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          if (quantity.value >= 50) {
                            return;
                          }
                          quantity.value++;
                          textController.text = quantity.value.toString();
                        },
                        icon: Icon(Icons.add_circle_outline,
                            color: item.quantity < 50
                                ? AppColors.primary
                                : AppColors.textLight),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.md),
              Text(
                '${Common.formatCurrency(item.totalPrice.toInt().toString())} VND',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              // if (item.salePrice > 0) ...[
              //   const SizedBox(height: AppSpacing.xs),
              //   Text(
              //     '${Common.formatCurrency(item.toString())} VND',
              //     style: AppTextStyles.body.copyWith(
              //       color: AppColors.text,
              //       decoration: TextDecoration.lineThrough,
              //     ),
              //   ),
              // ],
              IconButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).removeFromCart(item.id);
                },
                icon: const Icon(Icons.delete_outline,
                    color: AppColors.textLight),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
