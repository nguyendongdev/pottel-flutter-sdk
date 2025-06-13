import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/account_info_skyfi/widgets/menu_item.dart';
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
      ref.read(userInfoProviderProvider.notifier).setUserInfo(UserInfo());
      StoreClient.setToken('');
      StoreClient.setPhone('');
    }

    void popupMaintaining() {
      showPopupNotice(context,
          title: 'Thông báo',
          description: 'Tính năng đang phát triển, vui lòng quay lại sau!');
    }

    void checkLoginStatus(Function onNext) {
      if (!isLogin) {
        Modal.show(
            title: 'Thông báo',
            message: 'Bạn cần đăng nhập để sử dụng tính năng này!',
            confirmText: 'Đăng nhập',
            closeText: "Hủy",
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
        title: const Text(
          'Cá nhân',
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
                title: 'Thông tin tài khoản',
                iconPath: 'assets/icons/info_circle.svg',
                onTap: () {
                  checkLoginStatus(() {
                    context.pushNamed(AppRouter.accountDetailSkyFi);
                  });
                },
              ),
              MenuItem(
                title: 'Lịch sử thuê bao',
                iconPath: 'assets/icons/clock_fast_forward.svg',
                onTap: () {
                  checkLoginStatus(() {
                    context.pushNamed(AppRouter.historyMobileSkyFi);
                  });
                },
              ),
              MenuItem(
                title: 'Kích hoạt SIM',
                iconPath: 'assets/icons/simcard.svg',
                onTap: () {
                  context.pushNamed(AppRouter.infoRegis);
                },
              ),
              MenuItem(
                title: 'Thông báo',
                iconPath: 'assets/icons/bell.svg',
                onTap: () {
                  // TODO: Navigate to notifications
                  popupMaintaining();
                },
              ),
              MenuItem(
                title: 'Đổi mật khẩu',
                iconPath: 'assets/icons/lock.svg',
                onTap: () {
                  // TODO: Navigate to change password
                  popupMaintaining();
                },
              ),
              MenuItem(
                title: 'Nhận diện khuôn mặt',
                iconPath: 'assets/icons/face_id.svg',
                onTap: () {
                  // TODO: Navigate to face ID
                  popupMaintaining();
                },
              ),
              MenuItem(
                title: 'Hỗ trợ khách hàng',
                iconPath: 'assets/icons/headphones.svg',
                onTap: () {
                  // TODO: Navigate to customer support
                  popupMaintaining();
                },
              ),
              MenuItem(
                title: isLogin ? 'Đăng xuất' : 'Đăng nhập',
                iconPath: 'assets/icons/log_out.svg',
                onTap: () {
                  if (isLogin) {
                    // show confirm dialog
                    showDialog(
                      context: context,
                      builder: (context) => PopupCenterCard(
                        onPrimaryButtonTap: () => {
                          onLogout(),
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          context.goNamed(AppRouter.homeSkyFiNew),
                        },
                        onSecondaryButtonTap: () => Navigator.of(context).pop(),
                        title: 'Thông báo',
                        description: 'Bạn có chắc chắn muốn đăng xuất không?',
                        primaryButtonText: 'Đăng xuất',
                        secondaryButtonText: 'Hủy',
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
