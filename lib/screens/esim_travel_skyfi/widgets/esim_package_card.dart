import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/widgets/gradient_button.dart';
import 'package:pottel_sdk/screens/esim_travel_skyfi/widgets/modalContris.dart';
import 'package:pottel_sdk/utilities/common.dart';
import 'package:pottel_sdk/utilities/modal.dart';

import '../../../l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../routers/routers.dart';
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
    return GestureDetector(
      onTap: () {
        final packageWithQuantity = package.copyWith(quantity: quantity.value);
        context.pushNamed(
          AppRouter.detailEsimContent,
          extra: packageWithQuantity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/bgcard.png',
                      package: 'pottel_sdk'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              ),
              child: Row(
                children: [
                  Text(
                    package.name,
                    style: AppTextStyles.title,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                ),
                child: Column(children: [
                  if (package.countriesArray != null &&
                      package.countriesArray!.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.translate('coverage_area_label'),
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textLight,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showBottomSheetListCountries(
                                package.countriesArray!);
                          },
                          child: Text(
                            context.l10n.translate('countries_count').replaceAll('{0}', package.countriesArray!.length.toString()),
                            style: AppTextStyles.body.copyWith(
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                decorationColor: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.translate('data_capacity_label'),
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
                        context.l10n.translate('validity_label'),
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                      Text(
                        '${package.validityDays} ${context.l10n.translate('days_unit')}',
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
                        context.l10n.translate('price_label'),
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
                        context.l10n.translate('quantity_label'),
                        style: AppTextStyles.body
                            .copyWith(color: AppColors.textLight),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              quantity.value--;
                              if (quantity.value <= 1) {
                                quantity.value = 1;
                              }
                              textController.text = quantity.value.toString();
                            },
                            icon: Icon(Icons.remove_circle_outline,
                                color: quantity.value > 1
                                    ? AppColors.primary
                                    : AppColors.textLight),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: textController,
                            decoration: InputDecoration(
                              constraints: const BoxConstraints(
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
                                color: AppColors.text,
                                fontWeight: FontWeight.w700),
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
                                  title: context.l10n.translate('invalid_quantity'),
                                  message: context.l10n.translate('quantity_range_error'),
                                );
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              quantity.value++;
                              if (quantity.value >= 50) {
                                quantity.value = 50;
                              }
                              textController.text = quantity.value.toString();
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: quantity.value < 50
                                  ? AppColors.primary
                                  : AppColors.textLight,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Button Chọn mua
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    decoration: const BoxDecoration(
                        border: Border(
                      top: BorderSide(
                        color: AppColors.border,
                        width: 1,
                      ),
                    )),
                    child: GradientButton(
                      height: 48,
                      onPressed: () {
                        onTap(quantity.value);
                      },
                      text: context.l10n.translate('choose_buy'),
                      textStyle: AppTextStyles.body.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
