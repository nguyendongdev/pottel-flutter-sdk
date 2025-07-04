import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/contact_detail_screen.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/double_check_info_screen.dart';
import 'package:skyfi_sdk/screens/home_skyfi/models/current_package.dart';
import 'package:skyfi_sdk/screens/manager_sim/detail_eSim.dart';
import 'package:skyfi_sdk/screens/manager_sim/manager_sim.dart';
import 'package:skyfi_sdk/screens/manager_sim/models/response_manager_esim/item_my_esim.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/models/create_order/item.dart';
import 'package:skyfi_sdk/screens/video_call/RecordVideoScreen.dart'
    show EnumServiceSim, RecordVideoScreen;

import '../screens/account_detail_skyfi/account_detail_skyfi_screen.dart';
import '../screens/account_info_skyfi/account_info_skyfi_screen.dart';
import '../screens/cart_skyfi/cart_skyfi_screen.dart';
import '../screens/change_package_skyfi/change_package_skyfi_screen.dart';
import '../screens/detail_data_usage_skyfi/detail_data_usage_screen.dart';
import '../screens/dktt_skyfi/capture_chipcard_screen.dart';
import '../screens/dktt_skyfi/info_regis_screen.dart';
import '../screens/dktt_skyfi/prepare_chipcard_screen.dart';
import '../screens/dktt_skyfi/prepare_face_screen.dart';
import '../screens/dktt_skyfi/prepare_scan_chipcard_screen.dart';
import '../screens/dktt_skyfi/preview_capture_chipcard_screen.dart';
import '../screens/dktt_skyfi/preview_contact_screen.dart';
import '../screens/dktt_skyfi/provider/ekyc_provider.dart';
import '../screens/dktt_skyfi/scan_barcode_screen.dart';
import '../screens/dktt_skyfi/scan_nfc_chipcard_screen.dart';
import '../screens/dktt_skyfi/scan_nfc_chipcard_screen_new.dart';
import '../screens/dktt_skyfi/start_video_call_screen.dart';
import '../screens/dktt_skyfi/verify_otp_screen.dart';
import '../screens/esim_travel_skyfi/detail_esim_content.dart';
import '../screens/esim_travel_skyfi/detail_esim_travel_skyfi_screen.dart';
import '../screens/esim_travel_skyfi/esim_travel_skyfi_screen.dart';
import '../screens/esim_travel_skyfi/models/esim_package_model.dart';
import '../screens/esim_travel_skyfi/models/region_model.dart';
import '../screens/example/example_screen.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/history_mobile_skyfi/history_mobile_skyfi_screen.dart';
import '../screens/home_skyfi/home_skyfi_screen.dart';
import '../screens/home_skyfi/home_skyfi_screen_new.dart';
import '../screens/list_package_skyfi/list_package_skyf_screen.dart';
import '../screens/login_skyfi/login_skyfi_screen.dart';
import '../screens/order_detail_skyfi/order_detail_skyfi_screen.dart';
import '../screens/otp_register/otp_register_screen.dart';
import '../screens/package_detail_skyfi/package_detail_skyfi_screen.dart';
import '../screens/payment_method_skyfi/payment_method_skyfi_screen.dart';
import '../screens/payment_skyfi/payment_skyfi_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/sim_data_skyfi/sim_data_skyfi_screen.dart';
import '../screens/topup_skyfi/topup_skyfi_screen.dart';
import '../screens/user_info/user_info_screen.dart';
import '../screens/video_call/VideoCallViewJitsiScreen.dart';
import '../screens/webview/webview_screen.dart';
import '../screens/webview_payment_skyfi/webview_payment_skyfi_screen.dart';

class AppRouter {
  AppRouter._();

  static const String homeMain = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';
  static const String userInfo = 'user-info';
  static const String example = 'example';
  static const String otpRegister = 'otp-register';
  static const String homeSkyFi = 'home-skyfi';
  static const String homeSkyFiNew = 'home-skyfi-new';
  static const String simDataSkyFi = 'sim-data-skyfi';
  static const String historyMobileSkyFi = 'history-mobile-skyfi';
  static const String topupSkyFi = 'topup-skyfi';
  static const String changePackageSkyFi = 'change-package-skyfi';
  static const String cartSkyFi = 'cart-skyfi';
  static const String paymentSkyFi = 'payment-skyfi';
  static const String detailDataUsage = 'detail-data-usage';
  static const String infoRegis = 'info-regis';
  static const String scanBarcode = 'scan-barcode';
  static const String prepareChipCard = 'prepare-chip-card';
  static const String captureChipCard = 'capture-chip-card';
  static const String previewCaptureChipCard = 'preview-capture-chip-card';
  static const String prepareFace = 'prepare-face';
  static const String prepareScanChipCard = 'prepare-scan-chip-card';
  static const String doubleCheckInfo = 'double-check-info';
  static const String previewContact = 'preview-contact';
  static const String verifyOtp = 'verify-otp';
  static const String startVideoCall = 'start-video-call';
  static const String scanNfcChipcard = 'scan-nfc-chipcard';
  static const String loginSkyFi = 'login-skyfi';
  static const String accountInfoSkyFi = 'account-info-skyfi';
  static const String accountDetailSkyFi = 'account-detail-skyfi';
  static const String paymentMethodSkyFi = 'payment-method-skyfi';
  static const String esimTravelSkyFi = 'esim-travel-skyfi';
  static const String detailEsimTravelSkyfi = 'detail-esim-travel-skyfi';
  static const String detailEsimContent = 'detail-esim-content';
  static const String webviewPaymentSkyfi = 'webview-payment-skyfi';
  static const String webviewTermsSkyfi = 'webview-terms-skyfi';
  static const String listPackageSkyFi = 'list-package-skyfi';
  static const String orderDetailSkyfi = 'order-detail-skyfi';
  static const String videoCallJitsi = 'video-call-jitsi';
  static const String packageDetailSkyfi = 'package-detail-skyfi';
  static const String scanNfcChipcardNew = 'scan-nfc-chipcard-new';
  static const String contactDetail = 'contact-detail';
  static const String managerSim = 'manager-sim';
  static const String recordVideo = 'record-video';

  static const String managerSimDetail = 'manager-sim-detail';

  static final router = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    initialLocation: homeMain,
    routes: [
      GoRoute(
        path: homeMain,
        builder: (context, state) => const HomeSkyFiScreenNew(),
        routes: [
          GoRoute(
            path: register,
            name: register,
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(
            path: forgotPassword,
            name: forgotPassword,
            builder: (context, state) => const ForgotPasswordScreen(),
          ),

          GoRoute(
            path: example,
            name: example,
            builder: (context, state) => const ExampleScreen(),
          ),
          GoRoute(
            path: userInfo,
            name: userInfo,
            builder: (context, state) => const UserInfoScreen(),
          ),
          GoRoute(
            path: otpRegister,
            name: otpRegister,
            builder: (context, state) => const OtpRegisterScreen(),
          ),
          GoRoute(
            path: homeSkyFi,
            name: homeSkyFi,
            builder: (context, state) => const HomeSkyFiScreen(),
          ),
          GoRoute(
            path: homeSkyFiNew,
            name: homeSkyFiNew,
            builder: (context, state) => const HomeSkyFiScreenNew(),
          ),
          GoRoute(
            path: simDataSkyFi,
            name: simDataSkyFi,
            builder: (context, state) => const SimDataSkyFiScreen(),
          ),
          GoRoute(
            path: historyMobileSkyFi,
            name: historyMobileSkyFi,
            builder: (context, state) => const HistoryMobileSkyFiScreen(),
          ),
          GoRoute(
            path: topupSkyFi,
            name: topupSkyFi,
            builder: (context, state) => const TopupSkyFiScreen(),
          ),
          GoRoute(
            path: changePackageSkyFi,
            name: changePackageSkyFi,
            builder: (context, state) => const ChangePackageSkyFiScreen(),
          ),
          GoRoute(
            path: cartSkyFi,
            name: cartSkyFi,
            builder: (context, state) => const CartSkyfiScreen(),
          ),
          GoRoute(
            path: paymentSkyFi,
            name: paymentSkyFi,
            builder: (context, state) => PaymentSkyfiScreen(
              items: state.extra as List<Item>,
            ),
          ),
          GoRoute(
            path: detailDataUsage,
            name: detailDataUsage,
            builder: (context, state) {
              final CurrentPackage? currentPackage =
                  state.extra as CurrentPackage?;
              return DetailDataUsageScreen(currentPackage: currentPackage);
            },
          ),
          GoRoute(
            path: infoRegis,
            name: infoRegis,
            builder: (context, state) => const InfoRegisScreen(),
          ),
          GoRoute(
            path: scanBarcode,
            name: scanBarcode,
            builder: (context, state) => const ScanBarcodeScreen(),
          ),
          GoRoute(
            path: prepareChipCard,
            name: prepareChipCard,
            builder: (context, state) => const PrepareChipCardScreen(),
          ),
          GoRoute(
            path: captureChipCard,
            name: captureChipCard,
            builder: (context, state) => CaptureChipCardScreen(
              type: state.extra as EkycType,
            ),
          ),
          GoRoute(
            path: previewCaptureChipCard,
            name: previewCaptureChipCard,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return PreviewCaptureChipCardScreen(
                image: data['image'],
                type: data['type'],
              );
            },
          ),
          GoRoute(
            path: prepareFace,
            name: prepareFace,
            builder: (context, state) => const PrepareFaceScreen(),
          ),
          GoRoute(
            path: prepareScanChipCard,
            name: prepareScanChipCard,
            builder: (context, state) => const PrepareScanChipCardScreen(),
          ),
          GoRoute(
            path: doubleCheckInfo,
            name: doubleCheckInfo,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              print('data: $data');
              return DoubleCheckInfoScreen(
                sod: data['sod'] as String,
              );
            },
          ),
          GoRoute(
            path: previewContact,
            name: previewContact,
            builder: (context, state) => const PreviewContactScreen(),
          ),
          GoRoute(
            path: verifyOtp,
            name: verifyOtp,
            builder: (context, state) => const VerifyOtpScreen(),
          ),
          GoRoute(
            path: startVideoCall,
            name: startVideoCall,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return StartVideoCallScreen(
                id: data['id'] as String,
                phone: data['phone'] as String,
              );
            },
          ),

          // GoRoute(
          //   path: videoCallJitsi,
          //   name: videoCallJitsi,
          //   builder: (context, state) {
          //     final data = state.extra as Map<String, dynamic>;
          //     return  VideoCallViewJitsiScreen(
          //       id: data['id'] as String,
          //       phone: data['phone'] as String,
          //     );
          //   },
          // ),

          GoRoute(
            path: videoCallJitsi,
            name: videoCallJitsi,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return VideoCallViewJitsiScreen(
                msisdn: data['msisdn'] as String,
                serial: data['serial'] as String,
              );
            },
          ),
          GoRoute(
            path: scanNfcChipcard,
            name: scanNfcChipcard,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return ScanNfcChipcardScreen(
                docNumber: data['docNumber'] as String,
                dob: data['dob'] as String,
                doe: data['doe'] as String,
              );
            },
          ),
          GoRoute(
            path: contactDetail,
            name: contactDetail,
            builder: (context, state) => ContactDetailScreen(
              ing4: state.extra as String,
            ),
          ),

          GoRoute(
            path: scanNfcChipcardNew,
            name: scanNfcChipcardNew,
            builder: (context, state) => const ScanNfcChipcardScreenNew(),
          ),

          GoRoute(
            path: loginSkyFi,
            name: loginSkyFi,
            builder: (context, state) => const LoginSkyFiScreen(),
          ),
          GoRoute(
            path: accountInfoSkyFi,
            name: accountInfoSkyFi,
            builder: (context, state) => const AccountInfoSkyFiScreen(),
          ),
          GoRoute(
            path: accountDetailSkyFi,
            name: accountDetailSkyFi,
            builder: (context, state) => const AccountDetailSkyfiScreen(),
          ),
          GoRoute(
            path: paymentMethodSkyFi,
            name: paymentMethodSkyFi,
            builder: (context, state) => PaymentMethodSkyFiScreen(
              modeUI: state.extra as String,
            ),
          ),
          GoRoute(
            path: esimTravelSkyFi,
            name: esimTravelSkyFi,
            builder: (context, state) => const EsimTravelSkyfiScreen(),
          ),
          GoRoute(
            path: detailEsimTravelSkyfi,
            name: detailEsimTravelSkyfi,
            builder: (context, state) => DetailEsimTravelSkyfiScreen(
              region: state.extra as RegionModel,
            ),
          ),
          GoRoute(
            path: detailEsimContent,
            name: detailEsimContent,
            builder: (context, state) => DetailEsimContent(
              package: state.extra as EsimPackageModel,
            ),
          ),
          GoRoute(
            path: webviewPaymentSkyfi,
            name: webviewPaymentSkyfi,
            builder: (context, state) => WebviewPaymentSkyfiScreen(
              url: state.extra as String,
            ),
          ),
          GoRoute(
            path: webviewTermsSkyfi,
            name: webviewTermsSkyfi,
            builder: (context, state) {
              final Map<String, dynamic> params =
                  state.extra as Map<String, dynamic>;
              return WebViewScreen(
                url: params['url'] as String,
                title: params['title'] as String?,
              );
            },
          ),
          GoRoute(
            path: listPackageSkyFi,
            name: listPackageSkyFi,
            builder: (context, state) => const ListPackageSkyFiScreen(),
          ),
          GoRoute(
            path: orderDetailSkyfi,
            name: orderDetailSkyfi,
            builder: (context, state) => OrderDetailSkyfiScreen(
              orderId: state.extra as String,
            ),
          ),
          GoRoute(
            path: packageDetailSkyfi,
            name: packageDetailSkyfi,
            builder: (context, state) => PackageDetailSkyfiScreen(
              packageId:
                  (state.extra as Map<String, dynamic>)['packageId'] as int,
              isRegister:
                  (state.extra as Map<String, dynamic>)['isRegister'] ?? false,
            ),
          ),
          GoRoute(
            path: managerSim,
            name: managerSim,
            builder: (context, state) => const ManagerSimScreen(),
          ),
          GoRoute(
            path: managerSimDetail,
            name: managerSimDetail,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return DetailESim(
                esim: data['esim'] as ItemMyEsim,
              );
            },
          ),
          GoRoute(
            path: recordVideo,
            name: recordVideo,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return RecordVideoScreen(
                idCall: data['idCall'] as String,
                phoneNumber: data['phoneNumber'] as String,
                type: data['type'] as EnumServiceSim,
              );
            },
          ),
        ],
      ),
    ],
  );
}

class NavigatorService {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigator?.overlay?.context;
}
