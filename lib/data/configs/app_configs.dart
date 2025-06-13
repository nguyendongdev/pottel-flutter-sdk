import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:camera/camera.dart';

/// Global camera instances available for the app
List<CameraDescription> cameras = [];

class AppConfig {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnvironmentVariables();
    await _initializeCameras();
  }

  static Future<void> _loadEnvironmentVariables() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initializeCameras() async {
    cameras = await availableCameras();
  }
}
