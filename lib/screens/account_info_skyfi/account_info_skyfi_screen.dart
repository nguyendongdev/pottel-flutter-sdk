import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';
import 'package:skyfi_sdk/screens/account_info_skyfi/widgets/menu_item.dart';
import 'package:skyfi_sdk/utilities/common.dart' show Common;
import 'package:skyfi_sdk/utilities/modal.dart';

import '../../core/widgets/PopupCenterCard.dart';
import '../../core/widgets/Popup_notice.dart';
import '../../core/widgets/app_cart.dart';
import '../../network/store.dart';
import '../../routers/routers.dart';
import '../home_skyfi/models/user_info.dart';
import '../home_skyfi/provider/login_provider.dart';
import '../home_skyfi/provider/user_info_provider.dart';
import '../login_skyfi/login_skyfi_screen.dart';

class AccountInfoSkyFiScreen extends HookConsumerWidget {
  const AccountInfoSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref.watch(isLoginProvider);

    void onLogout() {
      ref.read(isLoginProvider.notifier).setIsLogin(false);
      ref.read(currentPhoneProvider.notifier).setCurrentPhone('');
      ref.read(userInfoProviderProvider.notifier).setUserInfo(const UserInfo());
      StoreClient.setToken('');
      StoreClient.setPhone('');
    }

    void popupMaintaining() {
      showPopupNotice(context,
          title: context.l10n.translate('notification'),
          description: context.l10n.translate('feature_under_development'));
    }

    void checkLoginStatus(Function onNext) {
      if (!isLogin) {
        Modal.show(
            title: context.l10n.translate('notification'),
            message: context.l10n.translate('login_required_message'),
            confirmText: context.l10n.translate('login'),
            closeText: context.l10n.translate('cancel'),
            onConfirm: () {
              context.pushNamed(AppRouter.loginSkyFi);
            });
      } else {
        onNext();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          context.l10n.translate('personal'),
          style: AppTextStyles.heading,
        ),
        actions: const [
          AppCart(),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // MenuItem(
              //   title: 'Quản lý eSIM du lịch đã mua',
              //   iconPath: 'assets/icons/file-edit.svg',
              //   onTap: () {
              //     checkLoginStatus(() {
              //       context.pushNamed(AppRouter.managerSim);
              //     });
              //   },
              // ),
              MenuItem(
                title: context.l10n.translate('account_info_title'),
                iconPath: 'assets/icons/info_circle.svg',
                onTap: () {
                  checkLoginStatus(() {
                    context.pushNamed(AppRouter.accountDetailSkyFi);
                  });
                },
              ),
              MenuItem(
                title: context.l10n.translate('subscription_history'),
                iconPath: 'assets/icons/clock_fast_forward.svg',
                onTap: () {
                  checkLoginStatus(() {
                    context.pushNamed(AppRouter.historyMobileSkyFi);
                  });
                },
              ),
              MenuItem(
                title: context.l10n.translate('activate_sim'),
                iconPath: 'assets/icons/simcard.svg',
                onTap: () {
                  // context.pushNamed(AppRouter.infoRegis);
                  Common.openRegisSkyFiApp();
                },
              ),

              MenuItem(
                title: context.l10n.translate('customer_support'),
                iconPath: 'assets/icons/headphones.svg',
                onTap: () {
                  // TODO: Navigate to customer support
                  popupMaintaining();
                },
              ),
              MenuItem(
                title: context.l10n.translate('price_policy'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(AppRouter.accountTermPolicy);
                },
              ),
              MenuItem(
                title: isLogin
                    ? context.l10n.translate('logout')
                    : context.l10n.translate('login'),
                iconPath: 'assets/icons/log_out.svg',
                onTap: () {
                  if (isLogin) {
                    // show confirm dialog
                    showDialog(
                      context: context,
                      builder: (_) => PopupCenterCard(
                        onPrimaryButtonTap: () => {
                          onLogout(),
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          context.goNamed(AppRouter.homeSkyFiNew),
                        },
                        onSecondaryButtonTap: () {},
                        title: context.l10n.translate('notification'),
                        description:
                            context.l10n.translate('logout_confirmation'),
                        primaryButtonText: context.l10n.translate('logout'),
                        secondaryButtonText: context.l10n.translate('cancel'),
                      ),
                    );
                  } else {
                    // TODO: Navigate to login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginSkyFiScreen(),
                      ),
                    );
                  }
                },
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
