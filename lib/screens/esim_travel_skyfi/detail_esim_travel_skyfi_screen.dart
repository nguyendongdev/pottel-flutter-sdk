import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/cart_skyfi/widgets/empty_cart.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../l10n/localization_extension.dart';
import '../cart_skyfi/provider/cart_provider.dart';
import '../sim_data_skyfi/widgets/preview_cart.dart';
import 'models/region_model.dart';
import 'provider/esim_package_provider.dart';
import 'widgets/esim_package_card.dart';

class DetailEsimTravelSkyfiScreen extends HookConsumerWidget {
  final RegionModel region;

  const DetailEsimTravelSkyfiScreen({
    super.key,
    required this.region,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(selectedRegionIdProvider.notifier);

    useEffect(() {
      // Schedule the state update for the next frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.setRegionId(region.id);
      });

      return () {
        // Get a fresh reference to avoid using ref after disposal
        // notifier.clearRegionId();
      };
    }, const []); // Empty dependency list means it only runs once on init

    final packagesAsync = ref.watch(esimPackagesProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          region.name,
          style: AppTextStyles.heading,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: packagesAsync.when(
                data: (packages) {
                  if (packages.isEmpty) {
                    return EmptyCart(
                      title: context.l10n.translate('no_packages_available'),
                      description: context.l10n
                          .translate('please_choose_another_country'),
                      onContinueShopping: () {
                        Navigator.of(context).pop();
                      },
                      titleButton:
                          context.l10n.translate('continue_buying_esim'),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(esimPackagesProvider);
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      itemCount: packages.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppSpacing.md),
                      itemBuilder: (context, index) {
                        final package = packages[index];
                        return EsimPackageCard(
                          quantity: 1,
                          package: package,
                          onTap: (quantity) async {
                            // print(package.toJson());
                            // print(quantity);
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
                          },
                        );
                      },
                    ),
                  );
                },
                loading: () => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            context.l10n.translate('loading_packages'),
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ),
                error: (error, stack) {
                  print('Error loading packages: $error');
                  print('Stack trace: $stack');
                  return Center(
                    child: SelectableText.rich(
                      TextSpan(
                        text:
                            '${context.l10n.translate('error_occurred_generic')}\n',
                        style: AppTextStyles.heading
                            .copyWith(color: AppColors.red),
                        children: [
                          TextSpan(
                            text: error.toString(),
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
