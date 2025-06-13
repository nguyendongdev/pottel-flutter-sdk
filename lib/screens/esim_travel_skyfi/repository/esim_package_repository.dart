import 'package:skyfi_sdk/network/api.dart';
import '../models/esim_package_model.dart';

class EsimPackageRepository {
  final API api;

  EsimPackageRepository({required this.api});

  Future<EsimPackageResponse> getEsimPackagesByRegion(int regionId) async {
    try {
      final response =
          await api.get('/bss/app/get-esim-package-by-region/$regionId');
      return EsimPackageResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
