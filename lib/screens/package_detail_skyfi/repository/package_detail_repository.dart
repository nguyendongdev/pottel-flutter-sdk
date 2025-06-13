import '../../../network/api.dart';
import '../models/package_model_detail/package_model_detail.dart';

class PackageDetailRepository {
  final API _api = API();

  Future<PackageModelDetail> getPackageDetail(int packageId) async {
    try {
      final response = await _api.get('/bss/app/get-package-detail/$packageId');
      print('response --> ${response.data}');
      if (response.statusCode == 200) {
        return PackageModelDetail.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load package detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching package detail: $e');
    }
  }
}
