import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/models/choose_sim/package.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/models/choose_sim/result.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_cart.dart';
import '../../core/widgets/gradient_button.dart';
import '../../network/api.dart';
import '../../routers/routers.dart';
import '../cart_skyfi/provider/cart_provider.dart';
import '../cart_skyfi/widgets/empty_cart.dart';
import '../esim_travel_skyfi/compatible_devices_screen.dart';
import '../payment_skyfi/provider/payment_order_provider.dart';
import 'models/choose_sim/choose_sim.dart';
import 'models/create_order/item.dart';
import 'provider/simType_provider.dart';
import 'widgets/preview_cart.dart';
import 'widgets/search_sim_data.dart';

class SimDataSkyFiScreen extends HookConsumerWidget {
  const SimDataSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();
    final chooseSim = useState<Result?>(null);
    final selectedPackage = ref.watch(selectedPackageProvider);

    final simType = ref.watch(simTypeProvider);
    final totalPrice = useState<String>('');
    final simPriceState = useState<String>('');
    final packPrice = useState<String>('');

    void onGetRandomSimNumber() async {
      final response = await api.get('/bss/app/get-random-msisdn');
      final simNumber = ChooseSim.fromJson(response.data);
      if (simNumber.code == 200) {
        chooseSim.value = simNumber.result?.first;
        ref.read(selectedPackageProvider.notifier).changeSelectedPackage(
              chooseSim.value?.packages?.first.name ?? '',
            );
      }
    }

    useEffect(() {
      // case uncheck package
      if (selectedPackage == '') {
        packPrice.value = '0';
        final simType = ref.watch(simTypeProvider);
        final simNumberPrice = chooseSim.value?.salePrice;
        final simPrice = simType == TypeOfSim.physical
            ? chooseSim.value?.usimPrice
            : chooseSim.value?.esimPrice;
        final sumPrice = (simNumberPrice ?? 0) + (simPrice ?? 0);
        totalPrice.value = sumPrice.toString();
        // simPriceState.value = (simPrice ?? 0).toString();
      }
      if (chooseSim.value != null && selectedPackage != '') {
        // find package by name
        final simType = ref.watch(simTypeProvider);
        final simNumberPrice = chooseSim.value?.salePrice;
        final simPrice = simType == TypeOfSim.physical
            ? chooseSim.value?.usimPrice
            : chooseSim.value?.esimPrice;
        final package = chooseSim.value?.packages?.firstWhere(
          (package) => package.name == selectedPackage,
        );
        packPrice.value = package?.salePrice.toString() ?? '0';
        final sumPrice =
            (package?.salePrice ?? 0) + (simNumberPrice ?? 0) + (simPrice ?? 0);
        totalPrice.value = sumPrice.toString();
        simPriceState.value = simPrice.toString();
      }

      return null;
    }, [chooseSim, selectedPackage, simType]);

    useEffect(() {
      onGetRandomSimNumber();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: const Text(
          'Chọn số và gói cước',
          style: AppTextStyles.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.text),
          onPressed: () {
            context.pop();
          },
        ),
        actions: const [
          AppCart(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SimNumberSection(
                    simNumber: chooseSim.value?.msisdn ?? '',
                    onChangeSimNumber: () {
                      // open action sheet
                      showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SearchSimData(
                          onChoosedNumber: (number) {
                            chooseSim.value = chooseSim.value?.copyWith(
                              msisdn: number.msisdn,
                              msisdnId: number.msisdnId,
                              productId: number.productId,
                              usimPrice: number.usimPrice,
                              esimPrice: number.esimPrice,
                              variantId: number.variantId,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  _SimTypeSection(
                    simPrice: chooseSim.value?.salePrice.toString() ?? '0',
                    esimPrice: chooseSim.value?.esimPrice.toString() ?? '0',
                    usimPrice: chooseSim.value?.usimPrice.toString() ?? '0',
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  // show empty state if no packages
                  if (chooseSim.value?.packages?.isEmpty == true)
                    EmptyCart(
                      onContinueShopping: () {
                        context.pop();
                      },
                    ),
                  if (chooseSim.value?.packages?.isNotEmpty == true)
                    ..._buildDataPackages(
                        ref, context, chooseSim.value?.packages ?? []),
                ],
              ),
            ),
          ),
          _BottomBar(
            totalPrice: totalPrice.value,
            chooseSim: chooseSim.value,
            simType: simType,
            packPrice: packPrice.value,
            simPrice: simPriceState.value,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDataPackages(
      WidgetRef ref, BuildContext context, List<Package> packages) {
    return packages
        .map((package) => _DataPackage(
              validityDay: package.validityDay?.toString() ?? '',
              freeCallMinute: package.freeCallMinute?.toString() ?? '',
              freeSms: package.freeSms?.toString() ?? '',
              isHot: package.isOutstanding == 1,
              discountPercent: package.discountPercent?.toString() ?? '',
              name: package.name ?? '',
              dataPerDay: package.dataPerDay.toInt().toString(),
              price: package.salePrice.toString(),
              originalPrice: package.price.toString(),
              isSelected: ref.watch(selectedPackageProvider) == package.name,
              onTap: () {
                // uncheck when double tap
                if (ref.watch(selectedPackageProvider) == package.name) {
                  ref
                      .read(selectedPackageProvider.notifier)
                      .changeSelectedPackage('');
                } else {
                  ref
                      .read(selectedPackageProvider.notifier)
                      .changeSelectedPackage(
                        package.name ?? '',
                      );
                }
              },
              onTapDetail: () {
                // show detail
                context.pushNamed(AppRouter.packageDetailSkyfi, extra: {
                  'packageId': package.id.toInt(),
                  'isRegister': false,
                });
              },
            ))
        .toList();
  }
}

class _SimNumberActionSheet extends StatelessWidget {
  const _SimNumberActionSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Các cuốc gia',
                style: AppTextStyles.heading,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SimNumberSection extends StatelessWidget {
  const _SimNumberSection({
    required this.simNumber,
    required this.onChangeSimNumber,
  });

  final String simNumber;
  final VoidCallback onChangeSimNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              child: SvgPicture.asset(
                'assets/icons/feat_sim_global.svg',
                width: 24,
                height: 24,
                package: 'skyfi_sdk',
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Column(
              children: [
                Text(
                  'Số dành cho bạn',
                  style: AppTextStyles.body.copyWith(color: AppColors.textGrey),
                ),
                Text(
                  Common.formatNumberGalaxy(simNumber),
                  style: AppTextStyles.heading,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 34,
              child: OutlinedButton(
                onPressed: onChangeSimNumber,
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(110, 34),
                  foregroundColor: AppColors.strongSecondary,
                  side: const BorderSide(color: AppColors.strongSecondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                ),
                child: const Text('Chọn số khác'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SimTypeSection extends ConsumerWidget {
  const _SimTypeSection(
      {required this.simPrice,
      required this.esimPrice,
      required this.usimPrice});
  final String simPrice;
  final String esimPrice;
  final String usimPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simType = ref.watch(simTypeProvider);
    final feeSim = simType == TypeOfSim.physical ? usimPrice : esimPrice ?? '0';
    void onShowDeviceList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (context) => const CompatibleDevicesScreen(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _RadioOption(
              text: 'eSIM',
              isSelected: ref.watch(simTypeProvider) == TypeOfSim.eSim,
              onTap: () {
                ref
                    .read(simTypeProvider.notifier)
                    .changeSimType(TypeOfSim.eSim);
              },
            ),
            const SizedBox(width: AppSpacing.xl),
            _RadioOption(
              text: 'SIM vật lý',
              isSelected: ref.watch(simTypeProvider) == TypeOfSim.physical,
              onTap: () {
                ref
                    .read(simTypeProvider.notifier)
                    .changeSimType(TypeOfSim.physical);
              },
            ),
            const Spacer(),
            Text(
              '${Common.formatCurrency((int.parse(simPrice) + int.parse(feeSim)).toString())} VND',
              style: AppTextStyles.heading,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        if (ref.watch(simTypeProvider) == TypeOfSim.physical)
          Text(
            '* Giao SIM tại nhà - Có tính phí vận chuyển',
            style: AppTextStyles.small.copyWith(color: AppColors.textGrey),
          ),
        if (ref.watch(simTypeProvider) == TypeOfSim.eSim)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lưu ý: eSIM là SIM điện tử, được gửi qua email khách hàng. eSIM chỉ sử dụng được trên các thiết bị di động có hỗ trợ. ',
                style: AppTextStyles.small.copyWith(color: AppColors.textGrey),
              ),
              GestureDetector(
                onTap: onShowDeviceList,
                child: Text(
                  'Xem danh sách thiết bị',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blue,
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}

class _RadioOption extends StatelessWidget {
  const _RadioOption({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.textLight,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            text,
            style: AppTextStyles.body.copyWith(
              color: isSelected ? AppColors.text : AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _DataPackage extends StatelessWidget {
  const _DataPackage({
    required this.validityDay,
    required this.freeCallMinute,
    required this.freeSms,
    required this.discountPercent,
    required this.name,
    required this.dataPerDay,
    required this.price,
    this.originalPrice,
    this.isSelected = false,
    this.isHot = false,
    required this.onTap,
    required this.onTapDetail,
  });

  final String validityDay;
  final String freeCallMinute;
  final String freeSms;
  final String discountPercent;
  final String name;
  final String dataPerDay;
  final String price;
  final String? originalPrice;
  final bool isSelected;
  final bool isHot;
  final VoidCallback onTap;
  final VoidCallback onTapDetail;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        margin: const EdgeInsets.only(bottom: AppSpacing.lg),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 2 : 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isHot
                          ? const Icon(
                              Icons.local_fire_department,
                              color: AppColors.red,
                              size: 24,
                            )
                          : SizedBox(),
                      const SizedBox(width: AppSpacing.xs),
                      Text('$name - $validityDay ngày',
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.text,
                          )),
                      const Spacer(),
                      // Chi tiết
                      GestureDetector(
                        onTap: onTapDetail,
                        child: Text(
                          'Chi tiết',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: AppSpacing.xl),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(AppSpacing.xs),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/dashboard-speed.svg',
                          width: 18,
                          height: 18,
                          package: 'skyfi_sdk',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Data: ${dataPerDay}GB/ngày',
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  if (freeCallMinute != '0')
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(AppSpacing.xs),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/phone-home.svg',
                            width: 18,
                            height: 18,
                            package: 'skyfi_sdk',
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Phút gọi: $freeCallMinute phút gọi liên mạng',
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSpacing.sm),
                  if (freeSms != '0')
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(AppSpacing.xs),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/message-home.svg',
                            width: 18,
                            height: 18,
                            package: 'skyfi_sdk',
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'SMS: $freeSms tin nhắn nội mạng',
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${Common.formatCurrency(price)} VND',
                  style: AppTextStyles.heading.copyWith(
                    color:
                        originalPrice != null ? AppColors.red : AppColors.text,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '/ $validityDay ngày',
                  style:
                      AppTextStyles.small.copyWith(color: AppColors.textGrey),
                ),
                const SizedBox(width: AppSpacing.sm),
                const Spacer(),
                // selected package

                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: Icon(
                    isSelected
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_unchecked_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            if (originalPrice != price) ...[
              Text(
                '${Common.formatCurrency(originalPrice ?? '')} VND',
                style: AppTextStyles.label.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.textGrey,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _DataFeature extends StatelessWidget {
  const _DataFeature({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: const Icon(
            Icons.check,
            size: 16,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body,
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends ConsumerWidget {
  const _BottomBar(
      {required this.totalPrice,
      required this.chooseSim,
      required this.simType,
      required this.packPrice,
      required this.simPrice});

  final String totalPrice;
  final Result? chooseSim;
  final TypeOfSim simType;
  final String packPrice;
  final String simPrice;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSpacing.lg,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Tổng cộng',
                style: AppTextStyles.title,
              ),
              Spacer(),
              Text(
                '${Common.formatCurrency(totalPrice)} VND',
                style: AppTextStyles.heading,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    // Call API add to cart
                    try {
                      await ref.read(cartProvider.notifier).addToCart(
                            productId: chooseSim?.productId ?? 0,
                            variantId: chooseSim?.variantId ?? 0,
                            msisdnId: chooseSim?.msisdnId ?? 0,
                            quantity: 1,
                            packCode: ref.watch(selectedPackageProvider) ?? '',
                            simType:
                                simType == TypeOfSim.physical ? 'USIM' : 'ESIM',
                          );
                      //  show action sheet
                      if (context.mounted) {
                        showModalBottomSheet(
                          backgroundColor: AppColors.white,
                          isScrollControlled: false,
                          context: context,
                          builder: (context) => const PreviewCart(),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Thêm vào giỏ hàng thất bại: ${e.toString()}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.strongSecondary,
                    padding:
                        const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    side: const BorderSide(color: AppColors.strongSecondary),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSpacing.buttonRadius),
                    ),
                  ),
                  child: const Text('Thêm vào giỏ hàng'),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: GradientButton(
                  onPressed: () {
                    final Item params = Item(
                        productId: chooseSim?.productId,
                        variantId: chooseSim?.variantId,
                        msisdnId: chooseSim?.msisdnId,
                        //  nếu không chọn gói nào thì giá = 0
                        packPrice: double.parse(packPrice).toInt() == 0
                            ? null
                            : double.parse(packPrice).toInt(),
                        simPrice: double.parse(simPrice).toInt(),
                        salePrice: chooseSim?.salePrice ?? 0,
                        quantity: 1,
                        simType: simType == TypeOfSim.physical
                            ? "USIM"
                            : "ESIM", // ESIM // ESIM_TRAVEL
                        //  nếu không chọn gói nào thì packCode = null
                        packCode: ref.watch(selectedPackageProvider) == ''
                            ? null
                            : ref.watch(selectedPackageProvider));
                    List<Item>? items = [params];
                    ref.read(paymentOrderProvider.notifier).changeItems(items);
                    ref
                        .read(paymentOrderProvider.notifier)
                        .changeTotalAmount(double.parse(totalPrice).toInt());
                    context.pushNamed(AppRouter.paymentSkyFi, extra: items);
                  },
                  text: 'Thanh toán',
                  height: 48,
                  textStyle: AppTextStyles.button.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
