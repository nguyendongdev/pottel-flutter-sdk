import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../models/address_model.dart';
import '../models/address_response_model.dart';
import '../models/address_suggestion_model.dart';
import '../provider/address_provider.dart';
import '../provider/payment_order_provider.dart';
import '../services/address_service.dart';

class AddressForm extends HookConsumerWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(addressSelectionProvider);
    final addressMode = ref.watch(addressModeStateProvider);
    final paymentOrder = ref.watch(paymentOrderProvider);

    final provincesAsync = ref.watch(provincesProvider);
    final districtsAsync = ref.watch(districtsProvider);
    final wardsAsync = ref.watch(wardsProvider);
    final newCitiesAsync = ref.watch(newCitiesProvider);
    final newWardsAsync = ref.watch(newWardsProvider);

    final addressController = useTextEditingController(
      text: paymentOrder.deliveryAddress ?? '',
    );
    final addressFocusNode = useFocusNode();
    final suggestionList = useState<List<AddressSuggestionModel>>([]);
    final showSuggestionList = useState(false);
    final isSuggestionLoading = useState(false);
    final suggestionDebounce = useRef<Timer?>(null);
    final shippingDebounce = useRef<Timer?>(null);

    final addressService = ref.read(addressServiceProvider);

    useEffect(() {
      final latestAddress = paymentOrder.deliveryAddress ?? '';
      if (addressController.text != latestAddress) {
        addressController.value = TextEditingValue(
          text: latestAddress,
          selection: TextSelection.collapsed(offset: latestAddress.length),
        );
      }
      return null;
    }, [paymentOrder.deliveryAddress]);

    useEffect(() {
      return () {
        suggestionDebounce.value?.cancel();
        shippingDebounce.value?.cancel();
      };
    }, const []);

    useEffect(() {
      void listener() {
        if (!addressFocusNode.hasFocus) {
          showSuggestionList.value = false;
        }
      }

      addressFocusNode.addListener(listener);
      return () => addressFocusNode.removeListener(listener);
    }, [addressFocusNode]);

    void resetShipping() {
      final currentShipping =
          ref.read(paymentOrderProvider).shippingAmount ?? 0;
      if (currentShipping == 0) return;
      ref.read(paymentOrderProvider.notifier).updateShippingAmount(0);
    }

    void resetAddressData({bool clearAddressText = false}) {
      ref.read(addressSelectionProvider.notifier).reset();
      ref.read(addressStepProvider.notifier).setStep(0);
      ref.read(paymentOrderProvider.notifier).changeCity(0);
      ref.read(paymentOrderProvider.notifier).changeDistrict(0);
      ref.read(paymentOrderProvider.notifier).changeWard(0);
      resetShipping();

      if (clearAddressText) {
        addressController.clear();
        ref.read(paymentOrderProvider.notifier).changeAddress('');
      }

      suggestionList.value = [];
      showSuggestionList.value = false;
    }

    Future<void> fetchAddressSuggestions(String keyword) async {
      final query = keyword.trim();
      if (addressMode != AddressMode.twoLevel || query.isEmpty) {
        suggestionList.value = [];
        isSuggestionLoading.value = false;
        showSuggestionList.value = false;
        return;
      }

      isSuggestionLoading.value = true;
      showSuggestionList.value = true;

      final suggestions = await addressService.searchAddressSuggestions(query);
      if (query != addressController.text.trim()) {
        return;
      }

      suggestionList.value = suggestions;
      isSuggestionLoading.value = false;
    }

    void onAddressChanged(String value) {
      ref.read(paymentOrderProvider.notifier).changeAddress(value);

      if (addressMode != AddressMode.twoLevel) {
        suggestionList.value = [];
        showSuggestionList.value = false;
        isSuggestionLoading.value = false;
        return;
      }

      suggestionDebounce.value?.cancel();
      suggestionDebounce.value = Timer(
        const Duration(milliseconds: 450),
        () => fetchAddressSuggestions(value),
      );
    }

    Future<void> handleSuggestionSelected(
      AddressSuggestionModel suggestion,
    ) async {
      final selectedText =
          suggestion.address.isNotEmpty ? suggestion.address : suggestion.name;

      addressController.value = TextEditingValue(
        text: selectedText,
        selection: TextSelection.collapsed(offset: selectedText.length),
      );
      ref.read(paymentOrderProvider.notifier).changeAddress(selectedText);
      suggestionList.value = [];
      showSuggestionList.value = false;

      if (addressMode != AddressMode.twoLevel) return;

      final detail = suggestion.id.isEmpty
          ? null
          : await addressService.getAddressPlaceDetail(suggestion.id);
      final provincePostCode =
          detail?.provinceAreaPostCode ?? suggestion.provinceAreaPostCode;
      final wardPostCode =
          detail?.wardAreaPostCode ?? suggestion.wardAreaPostCode;

      if (provincePostCode == null) return;

      final newCities = await addressService.getNewCities();
      NewCityModel? matchedCity;
      for (final city in newCities) {
        if (city.vnpostProvinceCode == provincePostCode) {
          matchedCity = city;
          break;
        }
      }

      if (matchedCity?.id == null) return;

      final cityModel = AddressModel(
        id: matchedCity!.id.toString(),
        name: matchedCity.name ?? '',
      );
      ref.read(addressSelectionProvider.notifier).selectProvince(cityModel);
      ref.read(paymentOrderProvider.notifier).changeCity(matchedCity.id!);
      ref.read(paymentOrderProvider.notifier).changeDistrict(0);
      ref.read(paymentOrderProvider.notifier).changeWard(0);

      if (wardPostCode == null) return;

      final newWards = await addressService.getNewWards();
      NewWardModel? matchedWard;
      for (final ward in newWards) {
        if (ward.vnpostCommuneCode == wardPostCode &&
            ward.cityId == matchedCity.id) {
          matchedWard = ward;
          break;
        }
      }

      if (matchedWard?.id == null) return;

      final wardModel = AddressModel(
        id: matchedWard!.id.toString(),
        name: matchedWard.name ?? '',
        parentId: matchedWard.cityId?.toString(),
        level: 1,
      );
      ref.read(addressSelectionProvider.notifier).selectWard(wardModel);
      ref.read(paymentOrderProvider.notifier).changeWard(matchedWard.id!);
    }

    Future<void> openAddressPicker({
      required String title,
      required AsyncValue<List<AddressModel>> source,
      required ValueChanged<AddressModel> onSelected,
    }) async {
      final item = await showModalBottomSheet<AddressModel>(
        context: context,
        backgroundColor: AppColors.white,
        isScrollControlled: true,
        builder: (context) => _AddressPickerSheet(
          title: title,
          source: source,
        ),
      );

      if (item != null) {
        onSelected(item);
      }
    }

    void handleModeChange(AddressMode mode) {
      if (mode == addressMode) return;
      ref.read(addressModeStateProvider.notifier).setMode(mode);
      resetAddressData(clearAddressText: true);
    }

    useEffect(() {
      shippingDebounce.value?.cancel();

      final cityId = paymentOrder.cityId ?? 0;
      final districtId = paymentOrder.districtId ?? 0;
      final wardId = paymentOrder.wardId ?? 0;
      final detailAddress = (paymentOrder.deliveryAddress ?? '').trim();
      final hasEnoughData = cityId > 0 &&
          wardId > 0 &&
          detailAddress.isNotEmpty &&
          (addressMode == AddressMode.twoLevel || districtId > 0);

      if (!hasEnoughData) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          resetShipping();
        });
        return null;
      }

      shippingDebounce.value =
          Timer(const Duration(milliseconds: 450), () async {
        final params = {
          'city_id': cityId,
          'district_id':
              addressMode == AddressMode.threeLevel ? districtId : null,
          'ward_id': wardId,
          'delivery_address': detailAddress,
        };

        try {
          final response = await addressService.getShippingFee(params);
          if (response['code'] == 200) {
            final shippingFeeValue = response['result']?['shipping_fee'];
            final shippingFee = int.tryParse(shippingFeeValue.toString()) ?? 0;
            ref.read(paymentOrderProvider.notifier).updateShippingAmount(
                  shippingFee,
                );
            return;
          }
        } catch (_) {}

        resetShipping();
      });

      return () => shippingDebounce.value?.cancel();
    }, [
      paymentOrder.cityId,
      paymentOrder.districtId,
      paymentOrder.wardId,
      paymentOrder.deliveryAddress,
      addressMode,
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate('delivery_address_title'),
          style: AppTextStyles.title,
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            _buildModeToggle(
              label: 'Hành chính 2 cap',
              isActive: addressMode == AddressMode.twoLevel,
              onTap: () => handleModeChange(AddressMode.twoLevel),
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildModeToggle(
              label: 'Hành chính 3 cap',
              isActive: addressMode == AddressMode.threeLevel,
              onTap: () => handleModeChange(AddressMode.threeLevel),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _buildInputField(
          label: context.translate('detailed_address'),
          isRequired: true,
          hintText: context.translate('enter_detailed_address'),
          controller: addressController,
          focusNode: addressFocusNode,
          onChanged: onAddressChanged,
          onTap: () {
            if (addressMode == AddressMode.twoLevel &&
                suggestionList.value.isNotEmpty) {
              showSuggestionList.value = true;
            }
          },
        ),
        if (addressMode == AddressMode.twoLevel &&
            showSuggestionList.value &&
            addressController.text.trim().isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.xs),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
              color: AppColors.white,
            ),
            constraints: const BoxConstraints(maxHeight: 220),
            child: isSuggestionLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text('Dang tim kiem dia chi...'),
                      ],
                    ),
                  )
                : suggestionList.value.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          context.translate('no_results_found'),
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: suggestionList.value.length,
                        separatorBuilder: (_, __) => const Divider(
                          height: 1,
                          color: AppColors.border,
                        ),
                        itemBuilder: (context, index) {
                          final item = suggestionList.value[index];
                          return InkWell(
                            onTap: () => handleSuggestionSelected(item),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.lg,
                                vertical: AppSpacing.sm,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: AppTextStyles.body.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (item.address.isNotEmpty)
                                    Text(
                                      item.address,
                                      style: AppTextStyles.small.copyWith(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        const SizedBox(height: AppSpacing.md),
        if (addressMode == AddressMode.twoLevel) ...[
          _buildSelectionField(
            label: context.translate('select_province'),
            value: selectedAddress.province?.name ?? '',
            placeholder: context.translate('select_province'),
            isRequired: true,
            onTap: () => openAddressPicker(
              title: context.translate('select_province'),
              source: newCitiesAsync,
              onSelected: (item) {
                ref
                    .read(addressSelectionProvider.notifier)
                    .selectProvince(item);
                ref
                    .read(paymentOrderProvider.notifier)
                    .changeCity(int.tryParse(item.id) ?? 0);
                ref.read(paymentOrderProvider.notifier).changeDistrict(0);
                ref.read(paymentOrderProvider.notifier).changeWard(0);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSelectionField(
            label: context.translate('select_ward'),
            value: selectedAddress.ward?.name ?? '',
            placeholder: context.translate('select_ward'),
            isRequired: true,
            enabled: selectedAddress.province != null,
            onTap: () => openAddressPicker(
              title: context.translate('select_ward'),
              source: newWardsAsync,
              onSelected: (item) {
                ref.read(addressSelectionProvider.notifier).selectWard(item);
                ref
                    .read(paymentOrderProvider.notifier)
                    .changeWard(int.tryParse(item.id) ?? 0);
              },
            ),
          ),
        ] else ...[
          _buildSelectionField(
            label: context.translate('select_province'),
            value: selectedAddress.province?.name ?? '',
            placeholder: context.translate('select_province'),
            isRequired: true,
            onTap: () => openAddressPicker(
              title: context.translate('select_province'),
              source: provincesAsync,
              onSelected: (item) {
                ref
                    .read(addressSelectionProvider.notifier)
                    .selectProvince(item);
                ref
                    .read(paymentOrderProvider.notifier)
                    .changeCity(int.tryParse(item.id) ?? 0);
                ref.read(paymentOrderProvider.notifier).changeDistrict(0);
                ref.read(paymentOrderProvider.notifier).changeWard(0);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSelectionField(
            label: context.translate('select_district'),
            value: selectedAddress.district?.name ?? '',
            placeholder: context.translate('select_district'),
            isRequired: true,
            enabled: selectedAddress.province != null,
            onTap: () => openAddressPicker(
              title: context.translate('select_district'),
              source: districtsAsync,
              onSelected: (item) {
                ref
                    .read(addressSelectionProvider.notifier)
                    .selectDistrict(item);
                ref
                    .read(paymentOrderProvider.notifier)
                    .changeDistrict(int.tryParse(item.id) ?? 0);
                ref.read(paymentOrderProvider.notifier).changeWard(0);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSelectionField(
            label: context.translate('select_ward'),
            value: selectedAddress.ward?.name ?? '',
            placeholder: context.translate('select_ward'),
            isRequired: true,
            enabled: selectedAddress.district != null,
            onTap: () => openAddressPicker(
              title: context.translate('select_ward'),
              source: wardsAsync,
              onSelected: (item) {
                ref.read(addressSelectionProvider.notifier).selectWard(item);
                ref
                    .read(paymentOrderProvider.notifier)
                    .changeWard(int.tryParse(item.id) ?? 0);
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildModeToggle({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.white,
            border: Border.all(
              color: isActive ? AppColors.primary : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.body.copyWith(
                color: isActive ? AppColors.white : AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionField({
    required String label,
    required String value,
    required String placeholder,
    required VoidCallback onTap,
    bool isRequired = false,
    bool enabled = true,
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
            color: enabled ? AppColors.white : AppColors.background,
          ),
          child: InkWell(
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value.isEmpty ? placeholder : value,
                      style: AppTextStyles.body.copyWith(
                        color: value.isEmpty
                            ? AppColors.textLight
                            : AppColors.text,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: enabled ? AppColors.text : AppColors.textLight,
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
    required TextEditingController controller,
    required FocusNode focusNode,
    required Function(String) onChanged,
    bool isRequired = false,
    VoidCallback? onTap,
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
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          style: AppTextStyles.body,
          onChanged: onChanged,
          onTap: onTap,
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
      ],
    );
  }
}

class _AddressPickerSheet extends HookWidget {
  const _AddressPickerSheet({
    required this.title,
    required this.source,
  });

  final String title;
  final AsyncValue<List<AddressModel>> source;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final query = useState('');

    useEffect(() {
      void listener() {
        query.value = searchController.text.trim().toLowerCase();
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.72,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: context.translate('search_address'),
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.textLight,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.textLight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppSpacing.buttonRadius),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: source.when(
                data: (items) {
                  final filteredItems = query.value.isEmpty
                      ? items
                      : items
                          .where(
                            (item) =>
                                item.name.toLowerCase().contains(query.value),
                          )
                          .toList();

                  if (filteredItems.isEmpty) {
                    return Center(
                      child: Text(
                        context.translate('no_results_found'),
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: filteredItems.length,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppColors.border),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return InkWell(
                        onTap: () => Navigator.of(context).pop(item),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.md,
                          ),
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
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: SelectableText.rich(
                    TextSpan(
                      text: 'Error: ',
                      style: AppTextStyles.body.copyWith(color: AppColors.red),
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
          ],
        ),
      ),
    );
  }
}
