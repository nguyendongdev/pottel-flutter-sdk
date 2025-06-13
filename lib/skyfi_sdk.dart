import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/configs/app_configs.dart';
import 'routers/routers.dart';
import 'themes/themeApp.dart';

List<CameraDescription> _cameras = [];

Future<void> _initializeCameras() async {
  _cameras = await availableCameras();
}

class SkyfiSdk extends StatefulWidget {
  const SkyfiSdk({super.key});

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
      routerConfig: AppRouter.router,
      theme: themeData,
      debugShowCheckedModeBanner: false,
    ));
  }
}
