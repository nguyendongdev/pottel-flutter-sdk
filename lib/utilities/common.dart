import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_styles.dart';
import '../core/widgets/PopupCenterCard.dart';
import '../core/widgets/Popup_notice.dart';
import '../core/widgets/global_loading.dart';
import '../routers/routers.dart';
import '../skyfi_sdk.dart';
// import '../network/store.dart';

class Common {
  late BuildContext context;
  Common(this.context);
  // get getDeviceId by device_info_plus
  static Future<String> getDeviceId() async {
    String deviceId = '';
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        // final androidInfo = await deviceInfo.androidInfo;
        const androidIdPlugin = AndroidId();
        deviceId = await androidIdPlugin.getId() ?? 'Unknown ID';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor!;
      }
    } catch (e) {
      print(e);
    }
    return deviceId;
  }

  // Get current Version App
  static Future<String> getVersionApp() async {
    String version = '';
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      version = packageInfo.version;
    } catch (e) {
      print(e);
    }
    return version;
  }

  // Static loading methods that can work with or without context
  static void startLoading([BuildContext? context]) {
    final targetContext = context ?? NavigatorService.context;
    if (targetContext != null) {
      LoadingManager.show(targetContext);
    }
  }

  static void stopLoading() {
    LoadingManager.hide();
  }

  /// Force clear loading state (use in case of errors)
  static void clearLoading() {
    LoadingManager.forceClear();
  }

  // Loading with context method
  static void loadingWithContext(BuildContext context, {bool show = true}) {
    if (show) {
      LoadingManager.show(context);
    } else {
      LoadingManager.hide();
    }
  }

  // Instance methods for backward compatibility
  static Future<void> startLoadingDialog(
      BuildContext context, String? message) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            if (message != null)
              Center(
                child: Text(
                  message,
                  style: AppTextStyles.body.copyWith(color: AppColors.white),
                ),
              ),
          ],
        );
      },
    );
  }

  static Future<void> stopLoadingDialog(BuildContext context) async {
    Navigator.of(context).pop();
  }

  static String formatCurrency(String amount) {
    if (amount.isEmpty) return '';
    return NumberFormat('#,##0', 'vi_VN').format(double.parse(amount));
  }

  static String formatDate(String date) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }

  // format number for galaxy
  // 0772100030 -> 0772 100 030
  static String formatNumberGalaxy(String number) {
    // Remove any existing spaces or special characters
    final cleanNumber = number.replaceAll(RegExp(r'[^\d]'), '');

    // Handle empty or invalid input
    if (cleanNumber.isEmpty) return '';

    // For numbers like 0772100030
    if (cleanNumber.length == 10 && cleanNumber.startsWith('0')) {
      return '${cleanNumber.substring(0, 4)} ${cleanNumber.substring(4, 7)} ${cleanNumber.substring(7)}';
    }

    // For other number formats, use the group of 3 approach
    return cleanNumber
        .replaceAllMapped(
          RegExp(r'(\d{3})(?=\d)'),
          (Match match) => '${match[1]} ',
        )
        .trim();
  }

  static String getGreetingMessage(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return context.l10n.translate('good_morning');
    } else if (hour >= 12 && hour < 14) {
      return context.l10n.translate('good_afternoon');
    } else if (hour >= 14 && hour < 18) {
      return context.l10n.translate('good_evening');
    } else {
      return context.l10n.translate('good_night');
    }
  }

  // get icon sun online
  static IconData getIconSunOnline() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return Icons.sunny;
    } else if (hour >= 12 && hour < 14) {
      return Icons.cloud;
    } else if (hour >= 14 && hour < 18) {
      return Icons.cloud;
    } else {
      return Icons.nightlight_round;
    }
  }

  static String getSimTypeName(String simType) {
    switch (simType) {
      case 'USIM':
        return 'SIM vật lý';
      default:
        return simType;
    }
  }

  // regex email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // regex phone
  static bool isValidPhone(String phone) {
    // start with 0 and length 10
    return RegExp(r'^0[0-9]{9}$').hasMatch(phone);
  }

  static void showToast(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      // show in top of screen
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: AppTextStyles.body.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  static String convertDateFormat(String dateStr) {
    // Tách chuỗi theo dấu "/"
    List<String> parts = dateStr.split('/');

    if (parts.length != 3) {
      throw FormatException('Invalid date format, expected dd/mm/yyyy');
    }

    String day = parts[0];
    String month = parts[1];
    String year = parts[2];

    // Trả về chuỗi mới theo định dạng mm/dd/yyyy
    return '$month/$day/$year';
  }

  static void showDialogConfirm(BuildContext context, String title,
      String description, Function() onConfirm, Function() onCancel,
      {String primaryButtonText = 'Xác nhận',
      String secondaryButtonText = 'Hủy'}) {
    showDialog(
      context: context,
      builder: (context) => PopupCenterCard(
        title: title,
        description: description,
        onPrimaryButtonTap: onConfirm,
        onSecondaryButtonTap: onCancel,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
      ),
    );
  }

  static void showAlertDialog(BuildContext context, String title,
      String description, Function()? onConfirm) {
    showDialog(
      context: context,
      builder: (context) => PopupNotice(
        onButtonTap: () {
          onConfirm?.call();
          Navigator.of(context).pop();
        },
        title: title,
        description: description,
      ),
    );
  }

  static void popupMaintaining(BuildContext context) {
    showPopupNotice(context,
        title: 'Thông báo',
        description: 'Tính năng đang phát triển, vui lòng quay lại sau!');
  }

  static Future<void> openSkyFiApp({AppLocale locale = AppLocale.vi}) async {
    String deepLink = 'skyfi://home-skyfi-new?locale=${locale.code.toString()}';
    print('deeplink: $deepLink');
    const String androidStoreUrl =
        'https://play.google.com/store/apps/details?id=vn.galaxytelecom.skyfi';
    const String iosStoreUrl =
        'https://apps.apple.com/us/app/skyfi/id6747164804';

    try {
      // Try to launch the deeplink directly
      final Uri deepLinkUri = Uri.parse(deepLink);
      await launchUrl(deepLinkUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Error opening SkyFi app with deeplink: $e');
      // Fallback to store URL if deeplink fails
      final String storeUrl =
          Platform.isAndroid ? androidStoreUrl : iosStoreUrl;
      final Uri storeUri = Uri.parse(storeUrl);
      try {
        await launchUrl(storeUri, mode: LaunchMode.externalApplication);
      } catch (storeError) {
        print('Error opening store: $storeError');
      }
    }
  }

  static Future<void> openRegisSkyFiApp({
    AppLocale locale = AppLocale.vi,
  }) async {
    final String deepLink =
        'skyfi://scan-barcode?locale=${locale.code.toString()}';
    print('deeplink: $deepLink');
    const String androidStoreUrl =
        'https://play.google.com/store/apps/details?id=vn.galaxytelecom.skyfi';
    const String iosStoreUrl =
        'https://apps.apple.com/us/app/skyfi/id6747164804';

    try {
      // Try to launch the deeplink directly
      final Uri deepLinkUri = Uri.parse(deepLink);
      await launchUrl(deepLinkUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Error opening SkyFi registration with deeplink: $e');
      // Fallback to store URL if deeplink fails
      final String storeUrl =
          Platform.isAndroid ? androidStoreUrl : iosStoreUrl;
      final Uri storeUri = Uri.parse(storeUrl);
      try {
        await launchUrl(storeUri, mode: LaunchMode.externalApplication);
      } catch (storeError) {
        print('Error opening store: $storeError');
      }
    }
  }
}
