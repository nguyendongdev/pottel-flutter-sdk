import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/address_response_model.dart';

part 'address_service.g.dart';

class AddressService {
  final API _api;

  AddressService(this._api);

  Future<List<CityModel>> getCities() async {
    try {
      final response = await _api.get('/bss/app/get-cities');
      final baseResponse = BaseResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );
      if (baseResponse.code != 200) {
        throw Exception(baseResponse.message ?? 'Failed to fetch cities');
      }
      final citiesResponse = CitiesResponse.fromJson(baseResponse.result ?? {});
      return citiesResponse.cities ?? [];
    } catch (e) {
      throw Exception('Failed to fetch cities: $e');
    }
  }

  Future<List<DistrictModel>> getDistricts() async {
    try {
      final response = await _api.get('/bss/app/get-districts');
      final baseResponse = BaseResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );
      if (baseResponse.code != 200) {
        throw Exception(baseResponse.message ?? 'Failed to fetch districts');
      }
      final districtsResponse =
          DistrictsResponse.fromJson(baseResponse.result ?? {});
      return districtsResponse.districts ?? [];
    } catch (e) {
      throw Exception('Failed to fetch districts: $e');
    }
  }

  Future<List<WardModel>> getWards() async {
    try {
      final response = await _api.get('/bss/app/get-wards');
      final baseResponse = BaseResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );
      if (baseResponse.code != 200) {
        throw Exception(baseResponse.message ?? 'Failed to fetch wards');
      }
      final wardsResponse = WardsResponse.fromJson(baseResponse.result ?? {});
      return wardsResponse.wards ?? [];
    } catch (e) {
      throw Exception('Failed to fetch wards: $e');
    }
  }

  Future<Map<String, dynamic>> getShippingFee(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _api.post('/bss/app/get-shipping-fee', data: params);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch shipping fee: $e');
    }
  }
}

@riverpod
AddressService addressService(AddressServiceRef ref) {
  return AddressService(API());
}
