import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../network/api.dart';
import '../models/current_package.dart';
import 'login_provider.dart';

part 'data_usage_provider.g.dart';

@riverpod
class CurrentPackageNotifier extends _$CurrentPackageNotifier {
  @override
  Future<CurrentPackage?> build() async {
    final phone = ref.watch(currentPhoneProvider);
    if (phone.isEmpty) return null;
    final api = API();
    final response = await api.get('/bss/app/get-current-package/$phone');
    final data = CurrentPackageResponse.fromJson(response.data);
    if (data.code == 200 && data.result != null && data.result!.isNotEmpty) {
      final currentPackage =
          data.result!.firstWhere((pkg) => pkg.isMain == 1, orElse: () {
        return data.result!.first;
      });
      return currentPackage;
    }
    throw Exception(data.message ?? 'Không lấy được thông tin gói cước');
  }
}
