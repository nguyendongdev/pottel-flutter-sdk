import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../models/address_model.dart';
import '../provider/address_provider.dart';
import '../provider/payment_order_provider.dart';
import '../services/address_service.dart';
import 'step_view_vertical.dart';

class SelectAddressData extends HookConsumerWidget {
  const SelectAddressData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(addressStepProvider);
    final selection = ref.watch(addressSelectionProvider);
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      void listener() {
        searchQuery.value = searchController.text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    String getTitle() {
      switch (step) {
        case 0:
          return context.translate('select_province');
        case 1:
          return context.translate('select_district');
        case 2:
          return context.translate('select_ward');
        default:
          return context.translate('choose_sim_delivery_address');
      }
    }

    AsyncValue<List<AddressModel>> getAddressList() {
      switch (step) {
        case 0:
          return ref.watch(provincesProvider);
        case 1:
          return ref.watch(districtsProvider);
        case 2:
          return ref.watch(wardsProvider);
        default:
          return const AsyncValue.data([]);
      }
    }

    Future<void> handleShippingFee() async {
      // get shipping fee
      final params = {
        'city_id': selection.province?.id,
        'district_id': selection.district?.id,
        'ward_id': selection.ward?.id,
        'delivery_address': '',
      };
      final response =
          await ref.read(addressServiceProvider).getShippingFee(params);
      if (response['code'] == 200) {
        // {requestId: null, code: 200, message: Lấy phí vận chuyển thành công, totalRecords: 0, result: {shipping_fee: 22000, currency: VND}, extra: null}
        final shippingFee = response['result']['shipping_fee'].toString();
        final totalAmount = ref.read(paymentOrderProvider).totalAmount ?? 0;
        ref
            .read(paymentOrderProvider.notifier)
            .changeShippingAmount(int.parse(shippingFee));
        ref
            .read(paymentOrderProvider.notifier)
            .changeTotalAmount(totalAmount + int.parse(shippingFee));
      }
    }

    void handleItemSelected(AddressModel item) {
      switch (step) {
        case 0:
          ref.read(addressSelectionProvider.notifier).selectProvince(item);
          ref
              .read(paymentOrderProvider.notifier)
              .changeCity(int.parse(item.id));
          ref.read(addressStepProvider.notifier).nextStep();
          break;
        case 1:
          ref.read(addressSelectionProvider.notifier).selectDistrict(item);
          ref
              .read(paymentOrderProvider.notifier)
              .changeDistrict(int.parse(item.id));
          ref.read(addressStepProvider.notifier).nextStep();
          break;
        case 2:
          ref.read(addressSelectionProvider.notifier).selectWard(item);
          ref
              .read(paymentOrderProvider.notifier)
              .changeWard(int.parse(item.id));
          // Navigator.of(context).pop();
          break;
      }
    }

    List<AddressModel> filterAddressList(List<AddressModel> addresses) {
      final query = searchQuery.value.toLowerCase().trim();
      if (query.isEmpty) return addresses;
      return addresses
          .where((address) => address.name.toLowerCase().contains(query))
          .toList();
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.buttonRadius),
          topRight: Radius.circular(AppSpacing.buttonRadius),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.translate('choose_sim_delivery_address'),
                    style: AppTextStyles.heading,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          // Khu vực được chọn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                Text(
                  context.l10n.translate('selected_area'),
                  style: AppTextStyles.label,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ref.read(addressSelectionProvider.notifier).reset();
                    ref.read(addressStepProvider.notifier).setStep(0);
                  },
                  child: Text(
                    context.l10n.translate('reset_selection'),
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.strongSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // step view
          StepViewVertical(
            currentStep: step,
            totalSteps: 3,
            onStepTapped: (step) {
              ref.read(addressStepProvider.notifier).setStep(step);
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: context.l10n.translate('search_address'),
                hintStyle: AppTextStyles.body.copyWith(
                  color: AppColors.textLight,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textLight,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.border),
                  borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.strongSecondary),
                  borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            color: AppColors.background,
            child: Text(
              getTitle(),
              style: AppTextStyles.label.copyWith(
                color: AppColors.textGrey,
              ),
            ),
          ),
          Expanded(
            child: getAddressList().when(
              data: (data) {
                final filteredData = filterAddressList(data);
                return filteredData.isEmpty
                    ? Center(
                        child: Text(
                          'Không tìm thấy kết quả',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg),
                        itemCount: filteredData.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: AppColors.border,
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final item = filteredData[index];
                          return InkWell(
                            onTap: () => handleItemSelected(item),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.md),
                              child: Text(
                                item.name,
                                style: AppTextStyles.body.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: SelectableText.rich(
                  TextSpan(
                    text: 'Error: ',
                    style: AppTextStyles.body.copyWith(color: Colors.red),
                    children: [
                      TextSpan(
                        text: error.toString(),
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (step == 2)
            Container(
              padding: EdgeInsets.only(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                top: AppSpacing.lg,
                bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 16,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: GradientButton(
                onPressed: () async {
                  // handle shipping fee
                  await handleShippingFee().then((value) {
                    Navigator.of(context).pop();
                  });
                },
                text: context.l10n.translate('confirm_button'),
                height: 48,
              ),
            ),
        ],
      ),
    );
  }
}
