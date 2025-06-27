import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/modals/modalMessage.dart';
import 'package:skyfi_sdk/network/store.dart';
import 'package:skyfi_sdk/skyfi_sdk_auth.dart';
import 'package:skyfi_sdk/skyfi_sdk_config.dart';

import 'data/configs/app_configs.dart';
import 'routers/routers.dart';
import 'themes/themeApp.dart';

List<CameraDescription> _cameras = [];

Future<void> _initializeCameras() async {
  _cameras = await availableCameras();
}

// Getter để truy cập cameras từ bên ngoài
List<CameraDescription> get cameras => _cameras;

class SkyfiSdk extends StatefulWidget {
  SkyfiSdk(
      {super.key,
      this.initialLocation,
      required this.phone,
      this.type = 'dev'}) {
    SkyfiSdkConfig(type: type);
  }

  final String? initialLocation;
  final String phone;
  final String type;

  static Widget toScreen(
      {String? initialLocation, required String phone, String type = 'dev'}) {
    return SkyfiSdk(initialLocation: initialLocation, phone: phone, type: type);
  }

  @override
  State<SkyfiSdk> createState() => _SkyfiSdkState();
}

class _SkyfiSdkState extends State<SkyfiSdk> {
  bool _isInitialized = false;
  bool _isLogin = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initialize();
    SkyfiSdkConfig(type: widget.type); // Initialize SDK configuration
    authenticateUser(widget.phone);
  }

  @override
  void dispose() {
    super.dispose();
    StoreClient.setToken('');
    StoreClient.setPhone('');
  }

  Future<void> _initialize() async {
    await AppConfig.initialize();
    await _initializeCameras();
    setState(() {
      _isInitialized = true;
    });
  }

  bool _checkPhone(String phone) {
    final phoneRegex = RegExp(r'^(070)(\d{7})$').hasMatch(phone);
    return !phoneRegex;
  }

  Future<void> authenticateUser(String phone) async {
    setState(() {
      _isLoading = true;
    });
    if (_checkPhone(phone)) {
      setState(() {
        _isLogin = true;
        _isLoading = false;
      });
      return;
    }
    try {
      final res = await SkyfiSdkAuth().loginWithPhone(phone);
      if (res['code'] == 200) {
        setState(() {
          _isLogin = true;
          _isLoading = false;
        });
        // Lưu thông tin đăng nhập nếu cần
        await StoreClient.setToken(res['result']['token']);
        await StoreClient.setPhone(phone);
      } else {
        showMessage(
          '${res['message']}',
          title: 'Thông báo',
          confirmText: 'OK',
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
      showMessage(
        'Đã xảy ra lỗi trong quá trình đăng nhập. Vui lòng thử lại sau.',
        title: 'Thông báo',
        confirmText: 'OK',
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
      {String title = 'Thông báo',
      String confirmText = 'OK',
      String closeText = 'Hủy',
      VoidCallback? onConfirm,
      VoidCallback? onClose,
      bool showBothButtons = false,
      Widget? icon,
      Color? titleColor,
      Color? messageColor}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ModalMessage(
          title: title,
          message: message,
          confirmText: confirmText,
          closeText: closeText,
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
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (_isInitialized && _isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    if (!_isLogin) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('User is not logged in'),
          ),
        ),
      );
    }

    return ProviderScope(
        child: MaterialApp.router(
      routerConfig:
          _createGoRouter(initialLocation: widget.initialLocation ?? '/'),
      theme: themeData,
      debugShowCheckedModeBanner: false,
    ));
  }
}

enum SkyfiRoute {
  home('/'),
  topup('/topup-skyfi'),
  infoRegis('/info-regis'),
  topupSkyFi('/topup-skyfi'),
  infoRegisSkyFi('/info-regis');

  const SkyfiRoute(this.path);
  final String path;
}
