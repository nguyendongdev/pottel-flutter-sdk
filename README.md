# SkyFi SDK

SkyFi SDK là một Flutter plugin cung cấp các tính năng quản lý SIM, nạp tiền, đăng ký thông tin thuê bao và các dịch vụ viễn thông khác.

## ✅ Yêu cầu hệ thống

- **Flutter**: >= 3.29.0
- **Dart**: >= 3.2.5 < 4.0.0
- **Android**: API level 26+
- **iOS**: iOS 15.6+

## 📦 Cài đặt

### 1. Thêm dependency

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

## 🚀 Sử dụng

### Import SDK

```dart
import 'package:skyfi_sdk/skyfi_sdk.dart';
import 'package:skyfi_sdk/utilities/common.dart' as SkyFiSDK;
```

### 🎯 Cách sử dụng chính

#### 1. Mở SkyFi SDK đầy đủ

```dart
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
```

#### 2. Mở màn hình đăng ký trực tiếp

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => PopScope(
      canPop: false,
      child: SkyfiSdk(
        phone: '0707040618',
        env: SkyfiEnv.dev,
        initialLocation: SkyfiRoute.scanBarcode.path,
        locale: AppLocale.vi,
      ),
    ),
  ),
);
```

#### 3. Sử dụng utility function

```dart
SkyFiSDK.Common.openRegisSkyFiApp(locale: AppLocale.vi);
```

## ⚙️ Tham số cấu hình

| Tham số | Kiểu | Mặc định | Mô tả |
|---------|------|----------|--------|
| `phone` | `String?` | `null` | Số điện thoại tự động đăng nhập |
| `env` | `SkyfiEnv` | `SkyfiEnv.dev` | Môi trường: `dev` hoặc `prod` |
| `locale` | `AppLocale` | `AppLocale.vi` | Ngôn ngữ: `vi` hoặc `en` |
| `initialLocation` | `String?` | `null` | Màn hình khởi tạo ban đầu |

## 🌍 Môi trường & Ngôn ngữ

**Môi trường:**
- `SkyfiEnv.dev` - Phát triển
- `SkyfiEnv.prod` - Sản xuất

**Ngôn ngữ:**
- `AppLocale.vi` - Tiếng Việt 🇻🇳
- `AppLocale.en` - English 🇺🇸

## 📋 Ví dụ hoàn chỉnh

```dart
import 'package:flutter/material.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';
import 'package:skyfi_sdk/utilities/common.dart' as SkyFiSDK;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyFi SDK Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('SkyFi SDK Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
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
                ),
                child: const Text('Mở SkyFi SDK'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopScope(
                      canPop: false,
                      child: SkyfiSdk(
                        phone: '0707040618',
                        env: SkyfiEnv.dev,
                        initialLocation: SkyfiRoute.scanBarcode.path,
                        locale: AppLocale.vi,
                      ),
                    ),
                  ),
                ),
                child: const Text('Mở màn hình đăng ký'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```