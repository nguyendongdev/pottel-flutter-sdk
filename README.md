# Pottel SDK

Pottel SDK là một Flutter plugin cung cấp các tính năng quản lý SIM, nạp tiền, đăng ký thông tin thuê bao và các dịch vụ viễn thông khác.

## ✅ Yêu cầu hệ thống

- **Flutter**: >= 3.29.0
- **Dart**: >= 3.2.5 < 4.0.0
- **Android**: API level 26+
- **iOS**: iOS 15.6+

## 📦 Cài đặt

### 1. Thêm dependency

```yaml
dependencies:
  pottel_sdk:
    git:
      url: <YOUR_POTTEL_SDK_REPO_URL>
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
import 'package:pottel_sdk/pottel_sdk.dart';
import 'package:pottel_sdk/utilities/common.dart' as PottelSDK;
```

### 🎯 Cách sử dụng chính

#### 1. Mở Pottel SDK đầy đủ

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => PopScope(
      canPop: false,
      child: PottelSdk(
        phone: '0959999111',
        env: PottelEnv.dev,
        initialLocation: PottelRoute.home.path,
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
      child: PottelSdk(
        phone: '0959999111',
        env: PottelEnv.dev,
        initialLocation: PottelRoute.scanBarcode.path,
        locale: AppLocale.vi,
      ),
    ),
  ),
);
```

#### 3. Sử dụng utility function

```dart
PottelSDK.Common.openRegisPottelApp(locale: AppLocale.vi);
```

## ⚙️ Tham số cấu hình

| Tham số | Kiểu | Mặc định | Mô tả |
|---------|------|----------|--------|
| `phone` | `String?` | `null` | Số điện thoại tự động đăng nhập |
| `env` | `PottelEnv` | `PottelEnv.dev` | Môi trường: `dev` hoặc `prod` |
| `locale` | `AppLocale` | `AppLocale.vi` | Ngôn ngữ: `vi` hoặc `en` |
| `initialLocation` | `String?` | `null` | Màn hình khởi tạo ban đầu |

## 🌍 Môi trường & Ngôn ngữ

**Môi trường:**
- `PottelEnv.dev` - Phát triển
- `PottelEnv.prod` - Sản xuất

**Ngôn ngữ:**
- `AppLocale.vi` - Tiếng Việt 🇻🇳
- `AppLocale.en` - English 🇺🇸

## 📋 Ví dụ hoàn chỉnh

```dart
import 'package:flutter/material.dart';
import 'package:pottel_sdk/pottel_sdk.dart';
import 'package:pottel_sdk/utilities/common.dart' as PottelSDK;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pottel SDK Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Pottel SDK Demo')),
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
                      child: PottelSdk(
                        phone: '0959999111',
                        env: PottelEnv.dev,
                        initialLocation: PottelRoute.home.path,
                        locale: AppLocale.vi,
                      ),
                    ),
                  ),
                ),
                child: const Text('Mở Pottel SDK'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopScope(
                      canPop: false,
                      child: PottelSdk(
                        phone: '0959999111',
                        env: PottelEnv.dev,
                        initialLocation: PottelRoute.scanBarcode.path,
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
