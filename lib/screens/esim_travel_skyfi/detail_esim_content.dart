import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/screens/cart_skyfi/provider/cart_provider.dart';
import 'package:pottel_sdk/screens/esim_travel_skyfi/compatible_devices_screen.dart';
import 'package:pottel_sdk/screens/esim_travel_skyfi/widgets/modalContris.dart';
import 'package:pottel_sdk/screens/payment_skyfi/provider/payment_order_provider.dart';
import 'package:pottel_sdk/screens/sim_data_skyfi/models/create_order/item.dart';
import 'package:pottel_sdk/screens/sim_data_skyfi/widgets/preview_cart.dart';
import 'package:pottel_sdk/utilities/modal.dart';

import '../../l10n/localization_extension.dart';
import '../../themes/colors.dart';
import 'models/esim_package_model.dart';

class DetailEsimContent extends HookConsumerWidget {
  final EsimPackageModel package;

  const DetailEsimContent({
    super.key,
    required this.package,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = useState(package.quantity ?? 1);
    final textController =
        useTextEditingController(text: quantity.value.toString());
    onAddToCart(int quantity) async {
      try {
        await ref.read(cartProvider.notifier).addToCart(
              productId: package.productId,
              variantId: package.variantId,
              msisdnId: package.variantId,
              quantity: quantity,
              packCode: package.name,
              simType: "ESIM_TRAVEL",
            );
        //  show action sheet
        if (context.mounted) {
          showModalBottomSheet(
            backgroundColor: AppColors.white,
            isScrollControlled: true,
            context: context,
            builder: (context) => const PreviewCart(),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${context.l10n.translate('add_to_cart_failed')}${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    onCheckout(int quantity) {
      final paymentItems = [
        Item(
          productId: package.productId,
          variantId: package.variantId,
          packPrice: null,
          salePrice: package.sellingPrice.toInt(),
          quantity: quantity,
          simType: 'ESIM_TRAVEL',
          packCode: package.name,
        )
      ];
      ref.read(paymentOrderProvider.notifier).changeItems(paymentItems);
      ref.read(paymentOrderProvider.notifier).changeTotalAmount(
            quantity * package.sellingPrice.toInt(),
          );
      context.pushNamed(AppRouter.paymentSkyFi, extra: paymentItems);
    }

    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/bannerEsim.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                        package: 'pottel_sdk',
                        height: MediaQuery.of(context).size.height * 0.1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          _buildDiscoverTitle(context),
                          const SizedBox(height: 16),
                          _buildPackageCard(
                              textController: textController,
                              quantity: quantity,
                              context: context),
                          const SizedBox(height: 24),
                          _buildCountriesSection(context),
                          const SizedBox(height: 16),
                          _buildWarningAlert(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomActions(
              onAddToCart: () => onAddToCart(quantity.value),
              onCheckout: () => onCheckout(quantity.value),
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left, color: neutral0, size: 24),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        context.l10n.translate('package_details'),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: neutral0,
        ),
      ),
    );
  }

  Widget _buildDiscoverTitle(BuildContext context) {
    return Text(
      context.l10n.translate('discover'),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: neutral0,
      ),
    );
  }

  Widget _buildPackageCard({
    required TextEditingController textController,
    required ValueNotifier<int> quantity,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: neutral200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            package.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: neutral0,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context.l10n.translate('data_capacity_detail'),
            '${package.dataAmount.toStringAsFixed(0)} ${package.dataUnit}',
            icon: Icons.storage,
            context: context,
          ),
          _buildInfoRow(
            context.l10n.translate('validity_detail'),
            '${package.validityDays} ${context.l10n.translate('days_unit')}',
            icon: Icons.calendar_today,
            context: context,
          ),
          _buildPriceRow(context),
          _buildQuantityRow(
            textController: textController,
            quantity: quantity,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,
      {IconData? icon, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: neutral0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: neutral0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.translate('price'),
            style: const TextStyle(
              fontSize: 14,
              color: neutral0,
            ),
          ),
          Text(
            '${package.sellingPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} ${package.currency}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: neutral0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityRow({
    required TextEditingController textController,
    required ValueNotifier<int> quantity,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.translate('quantity'),
            style: const TextStyle(
              fontSize: 14,
              color: neutral0,
            ),
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
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: quantity.value > 1
                      ? AppColors.primary
                      : AppColors.textLight,
                ),
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
                      color: AppColors.textLight, fontWeight: FontWeight.w700),
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
    );
  }

  Widget _buildCountriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.translate('countries_list_detail'),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: neutral0,
          ),
        ),
        const SizedBox(height: 8),
        _buildCountryInfoCard(
          context.l10n.translate('coverage_area'),
          context.l10n
              .translate('countries_count')
              .replaceAll('{0}', '${package.countriesArray?.length ?? 0}'),
          onClick: () {
            showBottomSheetListCountries(
              package.countriesArray ?? [],
            );
          },
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('provided_by'),
          context.l10n.translate('singtel'),
          showInfo: true,
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('activation_policy'),
          context.l10n.translate('validity_starts_on_install'),
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('data_capacity_detail'),
          '${package.dataAmount.toStringAsFixed(0)} ${package.dataUnit}',
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('validity_detail'),
          '${package.validityDays} ${context.l10n.translate('days_unit')}',
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('package_type'),
          context.l10n.translate('data_only'),
          showInfo: true,
          context: context,
        ),
        _buildCountryInfoCard(
          context.l10n.translate('ekyc_verification'),
          context.l10n.translate('not_required'),
          context: context,
        ),
      ],
    );
  }

  Widget _buildCountryInfoCard(String label, String value,
      {VoidCallback? onClick, bool showInfo = false, BuildContext? context}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: neutral200, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: neutral0,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onClick,
                    child: Text(
                      value,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration:
                            onClick != null ? TextDecoration.underline : null,
                        decorationColor: Colors.blue,
                        color: onClick != null ? Colors.blue : neutral0,
                      ),
                    ),
                  ),
                ),
                if (showInfo) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.info_outline,
                    size: 20,
                    color: neutral0,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningAlert(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1E5),
        border: Border.all(color: const Color(0xFFFF831E)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF831E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning,
                  size: 12,
                  color: white,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                context.l10n.translate('note'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF831E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${context.l10n.translate('esim_device_support_note').split('. ')[0]}. ',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.text,
                  ),
                ),
                TextSpan(
                  text: context.l10n
                      .translate('esim_device_support_note')
                      .split('. ')[1],
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.white,
                        builder: (context) => const CompatibleDevicesScreen(),
                      );
                    },
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(
      {required VoidCallback onAddToCart,
      required VoidCallback onCheckout,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  onAddToCart();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE69818)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  context.l10n.translate('add_to_cart_esim'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE69818),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onCheckout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE69818),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  context.l10n.translate('buy_now_esim'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
