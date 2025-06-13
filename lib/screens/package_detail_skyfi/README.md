# Package Detail SkyFi Screen

Màn hình chi tiết gói cước SkyFi được thiết kế dựa theo Figma design và tích hợp API để hiển thị thông tin chi tiết gói cước.

## Cấu trúc thư mục

```
lib/screens/package_detail_skyfi/
├── models/
│   ├── package_detail_model.dart
│   ├── package_detail_model.freezed.dart (generated)
│   └── package_detail_model.g.dart (generated)
├── provider/
│   └── package_detail_provider.dart
├── repository/
│   └── package_detail_repository.dart
├── widgets/
│   ├── package_benefit_item.dart
│   └── package_detail_header.dart
├── demo/
│   └── package_detail_demo.dart
├── package_detail_skyfi_screen.dart
└── README.md
```

## Tính năng

- ✅ Hiển thị thông tin chi tiết gói cước
- ✅ Gọi API với Authorization header
- ✅ Xử lý loading và error states
- ✅ UI responsive theo thiết kế Figma
- ✅ Hiển thị benefits (Data, SMS, Call)
- ✅ Hiển thị giá gốc và giá khuyến mãi
- ✅ Nút đăng ký gói cước

## API Integration

### Endpoint
```
GET /api/bss/app/get-package-detail/{packageId}
```

### Headers
```
Content-Type: application/json
Authorization: Bearer {token}
```

### Response Model
```dart
class PackageDetailResponse {
  final int code;
  final String message;
  final PackageDetail result;
}

class PackageDetail {
  final String code;
  final String name;
  final double price;
  final double salePrice;
  final double dataPerDay;
  final double dataPerMonth;
  final List<String> description;
  // ... other fields
}
```

## Sử dụng

### 1. Import screen
```dart
import 'package:skyfi/screens/package_detail_skyfi/package_detail_skyfi_screen.dart';
```

### 2. Navigate to screen
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PackageDetailSkyfiScreen(
      packageId: 1, // ID của gói cước
    ),
  ),
);
```

### 3. Wrap app với ProviderScope (nếu chưa có)
```dart
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

## Demo

Chạy demo để test màn hình:

```dart
import 'package:skyfi/screens/package_detail_skyfi/demo/package_detail_demo.dart';

void main() {
  runApp(PackageDetailDemo());
}
```

## Dependencies

- `flutter_riverpod`: State management
- `freezed_annotation`: Immutable models
- `json_annotation`: JSON serialization
- `dio`: HTTP client

## Build Runner

Sau khi thay đổi models, chạy lệnh sau để generate code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Thiết kế UI

Màn hình được thiết kế dựa theo Figma với các thành phần:

1. **Header**: Navigation bar với title và back button
2. **Package Name**: Hiển thị tên gói cước
3. **Benefits List**: 3 cột hiển thị Data, SMS, Call benefits
4. **Package Details**: Mô tả chi tiết gói cước
5. **Bottom Section**: Giá cả và nút đăng ký

## Colors

- Primary Orange: `#E69818`
- Red Accent: `#E60A32`, `#B40005`
- Text Primary: `#181818`
- Text Secondary: `#666666`
- Background Gray: `#F1F1F2`
- White: `#FFFFFF` 