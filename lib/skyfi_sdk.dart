import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'data/configs/app_configs.dart';
import 'themes/themeApp.dart';
import 'routers/routers.dart';
import 'package:camera/camera.dart';

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
  @override
  void initState() {
    super.initState();
    AppConfig.initialize();
    _initializeCameras();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: themeData,
      debugShowCheckedModeBanner: false,
    ));
  }
}
