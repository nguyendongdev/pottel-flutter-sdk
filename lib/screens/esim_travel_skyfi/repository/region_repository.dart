import 'package:pottel_sdk/network/api.dart';
import '../models/region_model.dart';

class RegionRepository {
  final API api;

  RegionRepository({required this.api});

  Future<RegionResponse> getRegionsByType(String type) async {
    try {
      final response = await api.get('/bss/app/get-regions-by-type/$type');
      return RegionResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
