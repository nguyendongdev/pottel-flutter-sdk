import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'data/configs/app_configs.dart';
import 'themes/themeApp.dart';
import 'routers/routers.dart';
import 'package:camera/camera.dart';

List<CameraDescription> _cameras = [];

void main() async {
  await AppConfig.initialize();
  await _initializeCameras();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _initializeCameras() async {
  _cameras = await availableCameras();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
