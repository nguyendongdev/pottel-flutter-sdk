import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:skyfi_sdk/screens/cart_skyfi/provider/cart_provider.dart';
import 'package:skyfi_sdk/screens/esim_travel_skyfi/widgets/modalContris.dart';
import 'package:skyfi_sdk/screens/payment_skyfi/provider/payment_order_provider.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/models/create_order/item.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/widgets/preview_cart.dart';
import 'package:skyfi_sdk/utilities/modal.dart';

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
              content: Text('Thêm vào giỏ hàng thất bại: ${e.toString()}'),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bannerEsim.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                      package: 'skyfi_sdk',
                      height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildDiscoverTitle(),
                        const SizedBox(height: 16),
                        _buildPackageCard(
                            textController: textController, quantity: quantity),
                        const SizedBox(height: 24),
                        _buildCountriesSection(),
                        const SizedBox(height: 16),
                        _buildWarningAlert(),
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
          ),
        ],
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
      title: const Text(
        'Chi tiết gói cước',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: neutral0,
        ),
      ),
    );
  }

  Widget _buildDiscoverTitle() {
    return const Text(
      'Discover',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: neutral0,
      ),
    );
  }

  Widget _buildPackageCard({
    required TextEditingController textController,
    required ValueNotifier<int> quantity,
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
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: neutral0,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            'Dung lượng',
            '${package.dataAmount.toStringAsFixed(0)} ${package.dataUnit}',
            icon: Icons.storage,
          ),
          _buildInfoRow(
            'Hiệu lực',
            '${package.validityDays} ngày',
            icon: Icons.calendar_today,
          ),
          _buildPriceRow(),
          _buildQuantityRow(
            textController: textController,
            quantity: quantity,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {IconData? icon}) {
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

  Widget _buildPriceRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Giá',
            style: TextStyle(
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Số lượng',
            style: TextStyle(
              fontSize: 14,
              color: neutral0,
            ),
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
    );
  }

  Widget _buildCountriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Các quốc gia',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: neutral0,
          ),
        ),
        const SizedBox(height: 8),
        _buildCountryInfoCard(
          'Phạm vi phủ sóng',
          '${package.countriesArray?.length ?? 0} quốc gia',
          onClick: () {
            showBottomSheetListCountries(
              package.countriesArray ?? [],
            );
          },
        ),
        _buildCountryInfoCard(
          'Cung cấp bởi',
          'Singtel',
          showInfo: true,
        ),
        _buildCountryInfoCard(
          'Chính sách kích hoạt',
          'Thời hạn hiệu lực sẽ bắt đầu lúc cài',
        ),
        _buildCountryInfoCard(
          'Dung lượng',
          '${package.dataAmount.toStringAsFixed(0)} ${package.dataUnit}',
        ),
        _buildCountryInfoCard(
          'Hiệu lực',
          '${package.validityDays} ngày',
        ),
        _buildCountryInfoCard(
          'Loại gói',
          'Chỉ dữ liệu',
          showInfo: true,
        ),
        _buildCountryInfoCard(
          'eKYC (Xác minh danh tính)',
          'Không bắt buộc',
        ),
      ],
    );
  }

  Widget _buildCountryInfoCard(String label, String value,
      {VoidCallback? onClick, bool showInfo = false}) {
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

  Widget _buildWarningAlert() {
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
              const Text(
                'Lưu ý',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF831E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'eSIM chỉ sử dụng được trên các thiết bị di động có hỗ trợ. Xem danh sách thiết bị',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: neutral0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(
      {required VoidCallback onAddToCart, required VoidCallback onCheckout}) {
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
                child: const Text(
                  'Thêm vào giỏ hàng',
                  style: TextStyle(
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
                child: const Text(
                  'Mua ngay',
                  style: TextStyle(
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
