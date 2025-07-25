# Hướng dẫn tích hợp SkyFi SDK

## Giới thiệu

SkyFi SDK là một Flutter plugin cung cấp các tính năng quản lý SIM, nạp tiền, đăng ký thông tin thuê bao và các dịch vụ viễn thông khác.

## Yêu cầu hệ thống

- **Flutter**: >= 3.29.0
- **Dart**: >= 3.2.5 < 4.0.0
- **Android**: API level 26+
- **iOS**: iOS 15.6+

## Cài đặt

### 1. Thêm dependency vào pubspec.yaml

```yaml
dependencies:
  skyfi_sdk:
    git:
      url: https://github.com/skyfi2024/new_sdk_SkyFi.git
      ref: main
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Cấu hình Android

Thêm permissions vào `android/app/src/main/AndroidManifest.xml`:

```xml
  <!-- Camera permissions -->
  <uses-permission android:name="android.permission.CAMERA" />

<uses-feature
    android:name="android.hardware.camera"
    android:required="false" />
```

### 4. Cấu hình iOS

Thêm permissions vào `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>Ứng dụng cần quyền truy cập camera để chụp ảnh CCCD và eKYC</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Ứng dụng cần quyền truy cập thư viện ảnh</string>
```

## Sử dụng

### Import SDK

```dart
import 'package:flutter/material.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';
import 'package:skyfi_sdk/utilities/common.dart' as SkyFiSDK;
```

### Ví dụ hoàn chỉnh

```dart
import 'package:flutter/material.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';
import 'package:skyfi_sdk/utilities/common.dart' as SkyFiSDK;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('SkyFi SDK Example App'),
                ),
                const SizedBox(height: 20),
                
                // 1. Mở SkyFi SDK đầy đủ
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PopScope(
                          canPop: false,
                          child: SkyfiSdk(
                            phone: '0707040618',
                            env: SkyfiEnv.dev,
                            initialLocation: SkyfiRoute.home.path,
                            locale: AppLocale.vi,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở SkyFi SDK'),
                ),
                
                const SizedBox(height: 16),
                
                // 2. Mở màn hình đăng ký cụ thể
                ElevatedButton(
                  onPressed: () {
                    SkyFiSDK.Common.openRegisSkyFiApp(locale: AppLocale.vi);
                  },
                  child: const Text('Mở màn hình đăng ký'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

## Hai cách sử dụng chính

### 1. Mở SkyFi SDK đầy đủ

Sử dụng `SkyfiSdk()` để mở toàn bộ ứng dụng SDK với đầy đủ tính năng:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => PopScope(
      canPop: false, // Chặn hành động back/swipe
      child: SkyfiSdk(
        phone: '0707040618',           // Số điện thoại
        env: SkyfiEnv.dev,            // Môi trường: dev hoặc prod
        initialLocation: SkyfiRoute.home.path, // Màn hình khởi tạo
        locale: AppLocale.vi,         // Ngôn ngữ: vi hoặc en
      ),
    ),
  ),
);
```

### 2. Mở màn hình đăng ký trực tiếp

Sử dụng `SkyFiSDK.Common.openRegisSkyFiApp()` để mở trực tiếp màn hình đăng ký:

```dart
SkyFiSDK.Common.openRegisSkyFiApp(locale: AppLocale.vi);
```

## Tham số cấu hình

| Tham số | Kiểu dữ liệu | Mặc định | Mô tả |
|---------|-------------|----------|-------|
| `phone` | `String?` | `null` | Số điện thoại để tự động đăng nhập |
| `env` | `SkyfiEnv` | `SkyfiEnv.dev` | Môi trường: `dev` hoặc `prod` |
| `locale` | `AppLocale` | `AppLocale.vi` | Ngôn ngữ: `vi` hoặc `en` |
| `initialLocation` | `String?` | `null` | Màn hình khởi tạo ban đầu |

## Môi trường triển khai

- **`SkyfiEnv.dev`**: Môi trường phát triển
- **`SkyfiEnv.prod`**: Môi trường sản xuất

## Ngôn ngữ hỗ trợ

- **`AppLocale.vi`**: Tiếng Việt 🇻🇳
- **`AppLocale.en`**: English 🇺🇸