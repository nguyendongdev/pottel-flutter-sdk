# Hướng dẫn tích hợp SkyFi SDK

## Giới thiệu

SkyFi SDK là một Flutter plugin cung cấp các tính năng quản lý SIM, nạp tiền, đăng ký thông tin thuê bao và các dịch vụ viễn thông khác. SDK được xây dựng với Flutter 3.29.0 và sử dụng các công nghệ hiện đại như Riverpod, GoRouter, và Flutter Hooks.

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
    # Hoặc nếu sử dụng local path trong development
    # path: ../skyfi_sdk
```

### 2. Cài đặt các dependencies cần thiết

```bash
flutter pub get
```

### 3. Cấu hình Android

Thêm các permissions cần thiết vào `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.NFC" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

<uses-feature
    android:name="android.hardware.camera"
    android:required="false" />
<uses-feature
    android:name="android.hardware.nfc"
    android:required="false" />
```

### 4. Cấu hình iOS

Thêm các permissions vào `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>Ứng dụng cần quyền truy cập camera để chụp ảnh CCCD và eKYC</string>
<key>NSMicrophoneUsageDescription</key>
<string>Ứng dụng cần quyền truy cập microphone cho video call</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Ứng dụng cần quyền truy cập thư viện ảnh</string>
```

### 5. Cấu hình môi trường (Tùy chọn)

SDK sử dụng cấu hình mặc định, bạn có thể tùy chỉnh bằng cách tạo file `.env` trong thư mục root của project:

```env
# API Configuration (Tùy chọn)
API_BASE_URL=https://your-api-endpoint.com
API_KEY=your-api-key

# Other configurations
DEBUG_MODE=true
```

Thêm file `.env` vào `pubspec.yaml` nếu có:

```yaml
flutter:
  assets:
    - .env
```

## Sử dụng cơ bản

### 1. Import SDK

```dart
import 'package:skyfi_sdk/skyfi_sdk.dart';
```

### 2. Khởi tạo SDK đơn giản

```dart
import 'package:flutter/material.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SkyfiSdk(
                    phone: '0707040618', // Số điện thoại cần thiết
                  ),
                ),
              );
            },
            child: const Text('Mở SkyFi SDK'),
          ),
        ),
      ),
    );
  }
}
```

### 3. Mở màn hình cụ thể

```dart
// Mở màn hình đăng ký thông tin
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SkyfiSdk.toScreen(
      initialLocation: SkyfiRoute.infoRegis.path,
      phone: '0707991197', // Số điện thoại cần thiết
    ),
  ),
);

// Mở màn hình nạp tiền
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SkyfiSdk.toScreen(
      initialLocation: SkyfiRoute.topupSkyFi.path,
      phone: '0807991197', // Số điện thoại cần thiết
    ),
  ),
);
```

## Các màn hình có sẵn

SDK cung cấp các route sau:

| Route | Path | Mô tả |
|-------|------|-------|
| `SkyfiRoute.home` | `/` | Màn hình chính |
| `SkyfiRoute.topup` | `/topup-skyfi` | Màn hình nạp tiền |
| `SkyfiRoute.infoRegis` | `/info-regis` | Màn hình đăng ký thông tin |
| `SkyfiRoute.topupSkyFi` | `/topup-skyfi` | Màn hình nạp tiền SkyFi |
| `SkyfiRoute.infoRegisSkyFi` | `/info-regis` | Màn hình đăng ký SkyFi |

### Các màn hình khác có sẵn:

- **Quản lý SIM**: `/manager-sim`
- **Lịch sử giao dịch**: `/history-mobile-skyfi`
- **Thông tin tài khoản**: `/account-info-skyfi`
- **Chi tiết tài khoản**: `/account-detail-skyfi`
- **Đổi gói cước**: `/change-package-skyfi`
- **Giỏ hàng**: `/cart-skyfi`
- **Thanh toán**: `/payment-skyfi`
- **eSIM du lịch**: `/esim-travel-skyfi`
- **Đăng nhập**: `/login-skyfi`

## Tích hợp nâng cao

### 1. Sử dụng với GoRouter

```dart
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/skyfi',
      builder: (context, state) => const SkyfiSdk(),
    ),
    GoRoute(
      path: '/skyfi/:route',
      builder: (context, state) {
        final route = state.pathParameters['route'];
        return SkyfiSdk.toScreen(initialLocation: '/$route');
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
```

### 2. Tích hợp với Riverpod

```dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: SkyfiSdk.toScreen(
          phone: '0707040618', // Số điện thoại cần thiết
        ),
      ),
    );
  }
}
```

### 3. Xử lý callback và navigation

```dart
class SkyfiIntegration extends StatefulWidget {
  @override
  _SkyfiIntegrationState createState() => _SkyfiIntegrationState();
}

class _SkyfiIntegrationState extends State<SkyfiIntegration> {
  void _openSkyfiWithCallback() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SkyfiSdk.toScreen(
          initialLocation: SkyfiRoute.topupSkyFi.path,
          phone: '0707040618', // Số điện thoại cần thiết
        ),
      ),
    ).then((result) {
      // Xử lý kết quả trả về từ SDK
      if (result != null) {
        print('Kết quả từ SkyFi SDK: $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _openSkyfiWithCallback,
          child: Text('Mở SkyFi với callback'),
        ),
      ),
    );
  }
}
```

## Tùy chỉnh giao diện

SDK sử dụng theme mặc định, bạn có thể tùy chỉnh bằng cách:

### 1. Sử dụng Theme wrapper

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'KoHo', // SDK hỗ trợ font KoHo và Inter
  ),
  home: SkyfiSdk.toScreen(
    phone: '0707040618', // Số điện thoại cần thiết
  ),
)
```

### 2. Tùy chỉnh màu sắc

```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
)
```

## Xử lý lỗi

### 1. Xử lý lỗi camera

```dart
try {
  final cameras = await availableCameras();
  if (cameras.isEmpty) {
    // Xử lý khi không có camera
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Lỗi'),
        content: Text('Thiết bị không có camera'),
      ),
    );
  }
} catch (e) {
  print('Lỗi khởi tạo camera: $e');
}
```

### 2. Xử lý lỗi network

```dart
// SDK tự động xử lý lỗi network và hiển thị thông báo
// Bạn có thể lắng nghe trạng thái network nếu cần
```

## Permissions

SDK yêu cầu các quyền sau:

- **Camera**: Chụp ảnh CCCD, eKYC
- **Microphone**: Video call xác thực
- **Storage**: Lưu trữ ảnh tạm thời
- **Network**: Kết nối API
- **NFC**: Đọc thông tin chip CCCD
- **Phone**: Đọc thông tin thiết bị

### Xử lý permissions runtime

```dart
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.microphone,
    Permission.storage,
  ].request();

  if (statuses[Permission.camera] != PermissionStatus.granted) {
    // Xử lý khi không có quyền camera
  }
}
```

## Debugging

### 1. Bật debug mode

```env
DEBUG_MODE=true
```

### 2. Xem logs

```dart
// SDK sử dụng network_logger để log API calls
// Logs sẽ hiển thị trong debug console
```

### 3. Test trên thiết bị thật

Một số tính năng như NFC, camera chỉ hoạt động trên thiết bị thật:

```bash
flutter run --release
```

## Ví dụ hoàn chỉnh

```dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyFi Integration Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyFi Integration Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Chọn tính năng SkyFi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildFeatureButton(
              context,
              'Trang chủ SkyFi',
              'Truy cập trang chủ với đầy đủ tính năng',
              Icons.home,
              () => _navigateToSkyfi(context, SkyfiRoute.home.path),
            ),
            const SizedBox(height: 12),
            _buildFeatureButton(
              context,
              'Đăng ký thông tin',
              'Đăng ký thông tin thuê bao mới',
              Icons.person_add,
              () => _navigateToSkyfi(context, SkyfiRoute.infoRegis.path),
            ),
            const SizedBox(height: 12),
            _buildFeatureButton(
              context,
              'Nạp tiền',
              'Nạp tiền vào tài khoản SkyFi',
              Icons.account_balance_wallet,
              () => _navigateToSkyfi(context, SkyfiRoute.topupSkyFi.path),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onPressed,
      ),
    );
  }

  void _navigateToSkyfi(BuildContext context, String initialLocation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SkyfiSdk.toScreen(
          initialLocation: initialLocation,
          phone: '0707040618', // Số điện thoại cần thiết
        ),
      ),
    );
  }
}
```

## Troubleshooting

### Lỗi thường gặp

1. **"Camera not available"**
   - Kiểm tra permissions trong AndroidManifest.xml và Info.plist
   - Test trên thiết bị thật

2. **"Network error"**
   - Kiểm tra cấu hình .env
   - Kiểm tra kết nối internet

3. **"Build failed"**
   - Chạy `flutter clean && flutter pub get`
   - Kiểm tra version Flutter và Dart

4. **"NFC not working"**
   - Chỉ hoạt động trên thiết bị thật có NFC
   - Kiểm tra NFC đã được bật

### Liên hệ hỗ trợ

- Email: support@skyfi.vn
- Documentation: [Link to docs]
- Issues: [Link to GitHub issues]

## Changelog

### Version 0.0.1
- Phiên bản đầu tiên
- Hỗ trợ đăng ký thông tin thuê bao
- Tính năng nạp tiền
- eKYC với camera và NFC
- Video call xác thực 