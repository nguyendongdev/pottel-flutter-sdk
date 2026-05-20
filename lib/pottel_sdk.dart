import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/l10n/l10n.dart';
import 'package:pottel_sdk/modals/modalMessage.dart';
import 'package:pottel_sdk/network/store.dart';
import 'package:pottel_sdk/pottel_sdk_auth.dart';
import 'package:pottel_sdk/pottel_sdk_config.dart';
import 'package:pottel_sdk/utilities/common.dart';

import 'data/configs/app_configs.dart';
import 'routers/routers.dart';
import 'themes/themeApp.dart';

List<CameraDescription> _cameras = [];

Future<void> _initializeCameras() async {
  _cameras = await availableCameras();
}

// Getter để truy cập cameras từ bên ngoài
List<CameraDescription> get cameras => _cameras;

class PottelSdk extends StatefulWidget {
  PottelSdk({
    super.key,
    this.initialLocation,
    this.phone,
    this.env = PottelEnv.dev,
    this.locale = AppLocale.vi,
  }) {
    PottelSdkConfig(environment: env);
  }

  final String? initialLocation;
  final String? phone;
  final PottelEnv env;
  final AppLocale locale;

  static Widget toScreen({
    String? initialLocation,
    String? phone,
    PottelEnv env = PottelEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) {
    return PottelSdk(
      initialLocation: initialLocation,
      phone: phone,
      env: env,
      locale: locale,
    );
  }

  // open Common.openPottelApp();
  static openRegisPottel({
    PottelEnv env = PottelEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) async {
    await Common.openRegisPottelApp(
      locale: locale,
    );
  }

  @override
  State<PottelSdk> createState() => _PottelSdkState();
}

class _PottelSdkState extends State<PottelSdk> {
  bool _isInitialized = false;
  bool _isLogin = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initialize();
    _initializeLanguage();
    authenticateUser(widget.phone);
  }

  Future<void> _initialize() async {
    await AppConfig.initialize();
    await _initializeCameras();
    setState(() {
      _isInitialized = true;
    });
  }

  Future<void> _initializeLanguage() async {
    // Initialize language provider with the provided locale
    // This will be done in the ProviderScope Consumer
  }

  @override
  void dispose() {
    super.dispose();
    // StoreClient.setToken('');
    // StoreClient.setPhone('');
  }

  bool _checkPhone(String phone) {
    final phoneRegex = RegExp(r'^(\+8495|8495|095)(\d{7})$').hasMatch(phone);
    return !phoneRegex;
  }

  Future<void> authenticateUser(String? phone) async {
    // print('phone: $phone');
    if (phone == null || phone.isEmpty || _checkPhone(phone)) {
      StoreClient.setToken('');
      StoreClient.setPhone('');
      setState(() {
        _isLoading = false;
        _isLogin = true;
      });
      return;
    }
    setState(() {
      _isLoading = true;
    });

    try {
      // cut 7 number from phone and + 095
      final phoneNumber = '095${phone.substring(phone.length - 7)}';
      print('phoneNumber: $phoneNumber');
      final res = await PottelSdkAuth().loginWithPhone(phoneNumber);
      if (res['code'] == 200) {
        setState(() {
          _isLogin = true;
          _isLoading = false;
        });
        // Lưu thông tin đăng nhập nếu cần
        print(' điện thoại: ${res['result']['token']}');
        await StoreClient.setToken(res['result']['token']);
        await StoreClient.setPhone(phoneNumber);
      } else {
        final currentLocale = Localizations.localeOf(context);
        final localizedStrings =
            currentLocale.languageCode == 'vi' ? viStrings : enStrings;

        showMessage(
          '${res['message']}',
          title: localizedStrings['notification'],
          confirmText: localizedStrings['ok'],
          onConfirm: () {
            Navigator.of(context).pop();
          },
        );
        setState(() {
          _isLogin = false;
          _isLoading = false;
        });
      }
    } catch (e) {
      final currentLocale = Localizations.localeOf(context);
      final localizedStrings =
          currentLocale.languageCode == 'vi' ? viStrings : enStrings;

      showMessage(
        localizedStrings['authentication_error'] ??
            'An error occurred during login. Please try again later.',
        title: localizedStrings['notification'],
        confirmText: localizedStrings['ok'],
        onConfirm: () {
          Navigator.of(context).pop();
        },
      );
      setState(() {
        _isLogin = false;
        _isLoading = false;
      });
    }
  }

  showMessage(String message,
      {String? title,
      String? confirmText,
      String? closeText,
      VoidCallback? onConfirm,
      VoidCallback? onClose,
      bool showBothButtons = false,
      Widget? icon,
      Color? titleColor,
      Color? messageColor}) {
    // Get localized strings based on current locale
    final currentLocale = Localizations.localeOf(context);
    final localizedStrings =
        currentLocale.languageCode == 'vi' ? viStrings : enStrings;

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ModalMessage(
          title: title ?? localizedStrings['notification'] ?? 'Notification',
          message: message,
          confirmText: confirmText ?? localizedStrings['ok'] ?? 'OK',
          closeText: closeText ?? localizedStrings['cancel'] ?? 'Cancel',
          onConfirm: onConfirm,
          onClose: onClose,
          showBothButtons: showBothButtons,
          icon: icon,
          titleColor: titleColor,
          messageColor: messageColor,
        );
      },
    );
  }

  GoRouter _createGoRouter({String initialLocation = '/'}) {
    return GoRouter(
      navigatorKey: NavigatorService.navigatorKey,
      initialLocation: initialLocation,
      routes: AppRouter.router.configuration.routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  viStrings['loading'] ?? 'Loading...',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_isInitialized && _isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  viStrings['loading'] ?? 'Loading...',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (!_isLogin) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              viStrings['user_not_logged_in'] ?? 'User is not logged in',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          // Initialize language provider with the provided locale if not already set
          final currentLocale = ref.watch(languageProvider);
          final languageNotifier = ref.read(languageProvider.notifier);

          // Set initial locale if it's different from the current one
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (currentLocale != widget.locale.locale) {
              languageNotifier.setLanguage(widget.locale.locale);
            }
          });

          return MaterialApp.router(
            routerConfig:
                _createGoRouter(initialLocation: widget.initialLocation ?? '/'),
            theme: themeData,
            debugShowCheckedModeBanner: false,
            locale: currentLocale,
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalization.supportedLocales,
          );
        },
      ),
    );
  }
}

enum PottelRoute {
  home('/'),
  topup('/topup-skyfi'),
  infoRegis('/info-regis'),
  topupPottel('/topup-skyfi'),
  infoRegisPottel('/info-regis'),
  // Backward-compatible enum values for old integrations.
  topupSkyFi('/topup-skyfi'),
  infoRegisSkyFi('/info-regis'),
  detailDataUsage('/detail-data-usage'),
  scanNfcChipcardNew('/scan-nfc-chipcard-new'),
  scanBarcode('/scan-barcode');

  const PottelRoute(this.path);
  final String path;
}

enum PottelEnv { dev, prod }

/// Enum representing supported locales in the Pottel SDK
enum AppLocale {
  vi('vi', 'Tiếng Việt', '🇻🇳'),

  en('en', 'English', '🇺🇸');

  const AppLocale(this.code, this.name, this.flag);

  /// Language code (e.g., 'vi', 'en')
  final String code;

  /// Display name of the language
  final String name;

  /// Flag emoji for the language
  final String flag;

  /// Convert to Flutter Locale
  Locale get locale => Locale(code, '');

  /// Get AppLocale from language code
  static AppLocale fromCode(String code) {
    switch (code) {
      case 'vi':
        return AppLocale.vi;
      case 'en':
        return AppLocale.en;
      default:
        return AppLocale.vi; // Default to Vietnamese
    }
  }

  /// Get AppLocale from Flutter Locale
  static AppLocale fromLocale(Locale locale) {
    return fromCode(locale.languageCode);
  }

  /// Get all supported locales as Flutter Locale list
  static List<Locale> get supportedLocales =>
      AppLocale.values.map((e) => e.locale).toList();

  /// Get all supported locales as AppLocale list
  static List<AppLocale> get supportedAppLocales => AppLocale.values;

  /// Check if the given locale is supported
  static bool isSupported(Locale locale) {
    return supportedLocales
        .any((supported) => supported.languageCode == locale.languageCode);
  }

  /// Check if the given language code is supported
  static bool isSupportedCode(String code) {
    return AppLocale.values.any((locale) => locale.code == code);
  }
}

@Deprecated('Use PottelEnv instead')
typedef SkyfiEnv = PottelEnv;

@Deprecated('Use PottelRoute instead')
typedef SkyfiRoute = PottelRoute;

@Deprecated('Use PottelSdk instead')
class SkyfiSdk extends PottelSdk {
  SkyfiSdk({
    super.key,
    super.initialLocation,
    super.phone,
    super.env,
    super.locale,
  });

  static Widget toScreen({
    String? initialLocation,
    String? phone,
    SkyfiEnv env = PottelEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) {
    return PottelSdk.toScreen(
      initialLocation: initialLocation,
      phone: phone,
      env: env,
      locale: locale,
    );
  }

  static Future<void> openRegisSkyFi({
    SkyfiEnv env = PottelEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) async {
    await PottelSdk.openRegisPottel(env: env, locale: locale);
  }
}
