import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_cart.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../l10n/localization_extension.dart';
import '../../../network/api.dart';
import '../../../routers/routers.dart';
import '../../../utilities/common.dart';
import '../../cart_skyfi/provider/cart_provider.dart';
import '../models/outstanding_pakage.dart';
import '../models/user_info.dart';
import '../provider/login_provider.dart';
import '../provider/user_info_provider.dart';
import 'banner_home_card.dart';
import 'data_usage_card.dart';
import 'feature_card.dart';
import 'package_card.dart';
import 'wallet_card.dart';

class TabSimData extends HookConsumerWidget {
  const TabSimData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref.watch(isLoginProvider);
    final userInfo = ref.watch(userInfoProviderProvider);
    final currentPhone = ref.watch(currentPhoneProvider);
    final listOutStandingPackage = useState<List<PackageModel>>([]);
    final isRefreshing = useState<bool>(false);
    final api = API();

    void fetchOutStandingPackage() async {
      final response = await api.get('/bss/app/get-outstanding-package');
      final outStandingPackage =
          OutStandingPackageResponse.fromJson(response.data);
      if (outStandingPackage.code == 200) {
        listOutStandingPackage.value = outStandingPackage.result;
      }
    }

    void fetchUserInfo(String phone) async {
      try {
        final response = await api.get('/bss/app/get-subscriber-info/$phone');
        final resUserInfo = UserInfoResponse.fromJson(response.data);
        if (resUserInfo.code == 200 && resUserInfo.result != null) {
          ref
              .read(userInfoProviderProvider.notifier)
              .setUserInfo(resUserInfo.result!);
        }
      } catch (e) {
        debugPrint('Error fetching user info: $e');
      }
    }

    Future<void> onRefresh() async {
      isRefreshing.value = true;
      try {
        // Refresh outstanding packages
        fetchOutStandingPackage();

        // Refresh user info if logged in
        if (isLogin && currentPhone.isNotEmpty) {
          fetchUserInfo(currentPhone);
        }

        // Refresh cart
        ref.read(cartProvider.notifier).refetchCart();
      } catch (e) {
        // Handle error if needed
        debugPrint('Error refreshing data: $e');
      } finally {
        isRefreshing.value = false;
      }
    }

    useEffect(() {
      fetchOutStandingPackage();
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      backgroundColor: AppColors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 32),
                              if (!isLogin)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.screenPadding,
                                    horizontal: AppSpacing.screenPadding,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // const SizedBox(width: 30),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                },
                                                child: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: AppColors.white,
                                                  size: 25,
                                                ),
                                              ),
                                              Icon(
                                                Common.getIconSunOnline(),
                                                color: AppColors.white,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                  width: AppSpacing.xs),
                                              Text(
                                                Common.getGreetingMessage(
                                                    context),
                                                style: AppTextStyles.button
                                                    .copyWith(
                                                  color: AppColors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: AppSpacing.sm),
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                  AppRouter.loginSkyFi);
                                            },
                                            child: Container(
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color: AppColors.black
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSpacing.lg),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: AppSpacing.md,
                                                vertical: AppSpacing.xs,
                                              ),
                                              child: Text(
                                                context.l10n.translate('login'),
                                                style: AppTextStyles.button
                                                    .copyWith(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const AppCart(color: AppColors.white),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: isLogin ? 60 : 120),
                              if (isLogin)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppSpacing.screenPadding,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: AppSpacing.sm),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                },
                                                child: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: AppColors.white,
                                                  size: 25,
                                                ),
                                              ),
                                              // Icon sun online
                                              Icon(
                                                Common.getIconSunOnline(),
                                                color: AppColors.white,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                  width: AppSpacing.xs),
                                              Expanded(
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${Common.getGreetingMessage(context)},',
                                                        style: AppTextStyles
                                                            .body
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' ${userInfo.fullName ?? 'Bạn'}!',
                                                        style: AppTextStyles
                                                            .body
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),

                                              const AppCart(
                                                  color: AppColors.white),
                                            ],
                                          ),
                                          Text(
                                              Common.formatNumberGalaxy(
                                                  userInfo.msisdn ?? ''),
                                              style: AppTextStyles.heading
                                                  .copyWith(
                                                color: AppColors.white,
                                              )),
                                          const SizedBox(height: AppSpacing.md),
                                          WalletCard(
                                            balance: userInfo.balace ?? '0',
                                          ),
                                          const SizedBox(height: AppSpacing.lg),
                                          const DataUsageCard(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              if (!isLogin)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.screenPadding,
                                  ),
                                  child: Container(
                                    width: double.infinity * 0.8,
                                    height: 290,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(AppSpacing.md),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              AppColors.text.withOpacity(0.1),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppSpacing.md),
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/empty_login.svg',
                                            width: 121,
                                            height: 110,
                                            fit: BoxFit.contain,
                                            package: 'skyfi_sdk',
                                          ),

                                          const SizedBox(height: AppSpacing.md),
                                          Text(
                                            context.l10n.translate(
                                                'do_you_have_skyfi_sim'),
                                            style:
                                                AppTextStyles.heading.copyWith(
                                              color: AppColors.text,
                                            ),
                                          ),
                                          Text(
                                            context.l10n.translate(
                                                'choose_buy_sim_description'),
                                            style: AppTextStyles.body.copyWith(
                                              color: AppColors.text,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: AppSpacing.md),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: OutlineButton(
                                                  height: 48,
                                                  onPressed: () {
                                                    // context.l10n.locale ==
                                                    //         AppLocale.vi
                                                    //     ? Common
                                                    //         .openRegisSkyFiApp(
                                                    //             locale:
                                                    //                 AppLocale
                                                    //                     .vi)
                                                    //     : Common
                                                    //         .openRegisSkyFiApp(
                                                    //             locale:
                                                    //                 AppLocale
                                                    //                     .en);
                                                    // context.pushNamed(AppRouter.infoRegis);
                                                    context.pushNamed(AppRouter.scanBarcode);
                                                  },
                                                  text: context.l10n.translate(
                                                      'activate_sim'),
                                                  textStyle: AppTextStyles
                                                      .button
                                                      .copyWith(
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: AppSpacing.lg),
                                              Expanded(
                                                child: GradientButton(
                                                  height: 48,
                                                  onPressed: () {
                                                    context.pushNamed(
                                                        AppRouter.simDataSkyFi);
                                                  },
                                                  text: context.l10n
                                                      .translate('buy_sim'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(height: AppSpacing.lg),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     context.pushNamed(
                                          //         AppRouter.loginSkyFi);
                                          //   },
                                          //   child: Text(
                                          //     'Đăng nhập',
                                          //     style:
                                          //         AppTextStyles.button.copyWith(
                                          //       color: AppColors.primary,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.screenPadding,
                                  vertical: AppSpacing.screenPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .pushNamed(AppRouter.simDataSkyFi);
                                      },
                                      child: FeatureCard(
                                        // icon: 'assets/icons/feat_support.svg',
                                        icon: 'assets/icons/nav_sim_data.svg',
                                        label:
                                            context.l10n.translate('buy_sim'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.pushNamed(
                                            AppRouter.listPackageSkyFi);
                                      },
                                      child: FeatureCard(
                                        icon: 'assets/icons/feat_history.svg',
                                        label:
                                            context.l10n.translate('packages'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // context.pushNamed(AppRouter.topupSkyFi);
                                        Common.popupMaintaining(context);

                                      },
                                      child: FeatureCard(
                                        icon: 'assets/icons/feat_bank.svg',
                                        label: context.l10n.translate('topup'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.pushNamed(
                                            AppRouter.esimTravelSkyFi);
                                        // context.pushNamed(AppRouter.scanNfcChipcard, extra: {
                                        //   'docNumber': '0930009672',
                                        //   'dob': '11/01/1993',
                                        //   'doe': '11/01/2033',
                                        // });
                                      },
                                      child: FeatureCard(
                                        // icon: 'assets/icons/feat_gift.svg',
                                        icon: 'assets/icons/nav_travel.svg',
                                        label: context.l10n
                                            .translate('esim_travel'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: AppSpacing.md),
                              // center the banner
                              const Center(
                                child: BannerHomeCard(),
                              ),
                              // const DataAddonCard(),
                              // const SizedBox(height: AppSpacing.xl),
                              const SizedBox(height: AppSpacing.xl),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.screenPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context.l10n.translate('hot_packages'),
                                      style: AppTextStyles.heading,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pushNamed(
                                            AppRouter.listPackageSkyFi);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            context.l10n.translate('explore'),
                                            style:
                                                AppTextStyles.button.copyWith(
                                              color: AppColors.strongSecondary,
                                            ),
                                          ),
                                          const SizedBox(width: AppSpacing.xs),
                                          const Icon(
                                            Icons.chevron_right,
                                            color: AppColors.strongSecondary,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              SizedBox(
                                height: 230,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.screenPadding,
                                    vertical: AppSpacing.md,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      listOutStandingPackage.value.length,
                                  itemBuilder: (context, index) => PackageCard(
                                    onTapDetail: () {
                                      context.pushNamed(
                                          AppRouter.packageDetailSkyfi,
                                          extra: {
                                            'packageId': listOutStandingPackage
                                                .value[index].id
                                                .toInt(),
                                            'isRegister': true,
                                          });
                                    },
                                    onTapRegister: () {
                                      context.pushNamed(
                                          AppRouter.packageDetailSkyfi,
                                          extra: {
                                            'packageId': listOutStandingPackage
                                                .value[index].id
                                                .toInt(),
                                            'isRegister': true,
                                          });
                                    },
                                    package:
                                        listOutStandingPackage.value[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: AppSpacing.lg,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
