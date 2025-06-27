import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

/// Global camera instances available for the app
List<CameraDescription> cameras = [];

class AppConfig {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeCameras();
  }

  static Future<void> _initializeCameras() async {
    cameras = await availableCameras();
  }
}
