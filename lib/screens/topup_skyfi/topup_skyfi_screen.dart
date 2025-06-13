import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/topup_skyfi/repositorty/topup_repository.dart';

import '../../core/constants/colors.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../routers/routers.dart';
import '../home_skyfi/provider/login_provider.dart';
import 'provider/topup_provider.dart';
import 'widgets/amount_chip.dart';

class TopupSkyFiScreen extends HookConsumerWidget {
  const TopupSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopup = ref.watch(topupNotifierProvider);
    final currentPhone = ref.watch(currentPhoneProvider);
    final selectedAmount = ref.watch(selectedAmountNotifierProvider);
    final isCreatingOrder = ref.watch(orderTopupNotifierProvider);
    final phoneController = useTextEditingController(
      text: currentPhone,
    );
    final isValidPhone = useState(currentPhone.isNotEmpty);

    // Format phone number as user types
    // useEffect(() {
    //   void formatPhone() {
    //     final text = phoneController.text.replaceAll(' ', '');
    //     if (text.length <= 10) {
    //       String formatted = '';
    //       for (int i = 0; i < text.length; i++) {
    //         if (i == 4 || i == 7) {
    //           formatted += ' ';
    //         }
    //         formatted += text[i];
    //       }
    //       if (formatted != phoneController.text) {
    //         phoneController.value = TextEditingValue(
    //           text: formatted,
    //           selection: TextSelection.collapsed(offset: formatted.length),
    //         );
    //       }
    //     }
    //   }

    //   phoneController.addListener(formatPhone);
    //   return () => phoneController.removeListener(formatPhone);
    // }, [phoneController]);

    // Validate phone number
    useEffect(() {
      void validatePhone() {
        final phone = phoneController.text.replaceAll(' ', '');
        isValidPhone.value =
            phone.length == 10 && RegExp(r'^(070)(\d{7})$').hasMatch(phone);
      }

      phoneController.addListener(validatePhone);
      return () => phoneController.removeListener(validatePhone);
    }, [phoneController]);

    // Check if button should be enabled
    final isButtonEnabled =
        selectedAmount != null && isValidPhone.value && !isCreatingOrder;

    Future<void> handleTopup() async {
      if (selectedAmount == null || !isValidPhone.value) return;

      final phone = phoneController.text.replaceAll(' ', '');
      final result =
          await ref.read(orderTopupNotifierProvider.notifier).createOrder(
                contactPhone: phone,
              );
      if (result != null && context.mounted) {
        if (result['success'] == true) {
          final orderId = result['data'];
          final link =
              await ref.read(topupRepositoryProvider).getLinkPayment(orderId);
          if (link.isNotEmpty) {
            context.pushNamed(AppRouter.webviewPaymentSkyfi, extra: link);
            return;
          }
          SnackBarApp.showError(context,
              message: 'Lỗi: Không thể tạo đơn hàng');

          // Clear selections
          // ref.read(selectedAmountNotifierProvider.notifier).clearSelection();
          // phoneController.clear();
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi: ${result['error']}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Nạp tiền',
          style: AppTextStyles.heading,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.text),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      offset: const Offset(0, 1),
                      blurRadius: 6,
                      spreadRadius: -1,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 41,
                      height: 41,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4262B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/feat_sim_global.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Số điện thoại',
                            style: AppTextStyles.label.copyWith(
                              color: AppColors.textGrey,
                            ),
                          ),
                          TextField(
                            controller: phoneController,
                            style: AppTextStyles.heading,
                            keyboardType: TextInputType.phone,
                            maxLength: 12, // 10 digits + 2 spaces
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Nhập số điện thoại SkyFi',
                              counterText: '', // Hide character counter
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: listTopup.when(
                    error: (error, stack) => Center(
                      child: SelectableText.rich(
                        TextSpan(
                          text: 'Lỗi: ${error.toString()}',
                          style: AppTextStyles.body.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) => data == null || data.isEmpty
                        ? const Center(
                            child: Text(
                              'Không có dữ liệu',
                              style: AppTextStyles.body,
                            ),
                          )
                        : Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: data.map((item) {
                              return AmountChip(
                                amount: item.value ?? 0,
                                isSelected: selectedAmount?.id == item.id,
                                onTap: () {
                                  ref
                                      .read(selectedAmountNotifierProvider
                                          .notifier)
                                      .selectAmount(item);
                                },
                              );
                            }).toList(),
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 0),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: GradientButton(
                  width: double.infinity,
                  disabled: !isButtonEnabled,
                  height: 48,
                  textStyle: AppTextStyles.button.copyWith(
                    color: isButtonEnabled ? AppColors.white : AppColors.text,
                  ),
                  onPressed: () => handleTopup(),
                  text: isCreatingOrder ? 'Đang xử lý...' : 'Nạp ngay',
                ),
              ),
            ],
          ),
          // Loading overlay
          if (isCreatingOrder)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Đang xử lý yêu cầu...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
