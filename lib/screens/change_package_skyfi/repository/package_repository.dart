import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/package_model.dart';

part 'package_repository.g.dart';

class PackageRepository {
  final API _api;

  PackageRepository(this._api);

  Future<PackageResponse> getAvailablePackages(String msisdn) async {
    try {
      final response = await _api.post(
        '/bss/app/get-available-package',
        data: {
          'msisdn': msisdn,
        },
      );

      return PackageResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load packages: $e');
    }
  }

  Future<dynamic> checkPackageRegister(
      String msisdn, String packageName) async {
    try {
      final response =
          await _api.post('/bss/app/check-package-register', data: {
        "msisdn": msisdn,
        "packageCode": packageName,
      });
      return response.data;
    } catch (e) {
      throw Exception('Failed to change package: $e');
    }
  }

  Future<dynamic> registerPackage(String msisdn, String packageName) async {
    try {
      final response = await _api.post('/bss/app/register-package', data: {
        "msisdn": msisdn,
        "packageCode": packageName,
      });
      return response.data;
    } catch (e) {
      throw Exception('Failed to change package: $e');
    }
  }
}

@Riverpod(keepAlive: false)
PackageRepository packageRepository(PackageRepositoryRef ref) {
  return PackageRepository(API());
}
