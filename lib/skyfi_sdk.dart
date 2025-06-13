import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  const SkyfiSdk({super.key, this.initialLocation});
  final String? initialLocation;

  static Widget toScreen({String? initialLocation}) {
    return SkyfiSdk(initialLocation: initialLocation);
  }

  @override
  State<SkyfiSdk> createState() => _SkyfiSdkState();
}

class _SkyfiSdkState extends State<SkyfiSdk> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await AppConfig.initialize();
    await _initializeCameras();
    setState(() {
      _isInitialized = true;
    });
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
  infoRegis('/info-regis');

  const SkyfiRoute(this.path);
  final String path;
}
