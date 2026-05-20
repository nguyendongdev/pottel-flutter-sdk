import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/address_suggestion_model.dart';
import '../models/address_response_model.dart';

part 'address_service.g.dart';

class AddressService {
  final API _api;

  AddressService(this._api);

  int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }

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

  Future<List<NewCityModel>> getNewCities() async {
    try {
      final response = await _api.get('/bss/app/get-new-cities');
      final baseResponse = BaseResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );
      if (baseResponse.code != 200) {
        throw Exception(baseResponse.message ?? 'Failed to fetch new cities');
      }

      final result = baseResponse.result ?? {};
      final rawCities = result['cities'];
      if (rawCities is! List) return [];

      return rawCities
          .whereType<Map<String, dynamic>>()
          .map(
            (city) => NewCityModel(
              id: _parseInt(city['id']),
              name: city['name']?.toString(),
              vnpostProvinceCode: _parseInt(city['vnpost_province_code']),
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch new cities: $e');
    }
  }

  Future<List<NewWardModel>> getNewWards() async {
    try {
      final response = await _api.get('/bss/app/get-new-wards');
      final baseResponse = BaseResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );
      if (baseResponse.code != 200) {
        throw Exception(baseResponse.message ?? 'Failed to fetch new wards');
      }

      final result = baseResponse.result ?? {};
      final rawWards = result['wards'];
      if (rawWards is! List) return [];

      return rawWards
          .whereType<Map<String, dynamic>>()
          .map(
            (ward) => NewWardModel(
              id: _parseInt(ward['id']),
              name: ward['name']?.toString(),
              vnpostCommuneCode: _parseInt(ward['vnpost_commune_code']),
              cityId: _parseInt(ward['city_id']),
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch new wards: $e');
    }
  }

  Future<List<AddressSuggestionModel>> searchAddressSuggestions(
    String text,
  ) async {
    final keyword = text.trim();
    if (keyword.isEmpty) return [];

    try {
      final response = await _api.get(
        '/bss/app/map/autosuggest',
        queryParameters: {'text': keyword},
      );
      final rawData = response.data;
      if (rawData is! Map<String, dynamic>) return [];

      final isSuccess = rawData['code'] == 200 || rawData['success'] == true;
      final result = rawData['result'] ?? rawData['data'];
      if (!isSuccess || result is! List) return [];

      return result
          .whereType<Map<String, dynamic>>()
          .map(AddressSuggestionModel.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<AddressSuggestionModel?> getAddressPlaceDetail(String id) async {
    if (id.trim().isEmpty) return null;

    try {
      final response = await _api.get('/bss/app/map/place/detail/$id');
      final rawData = response.data;
      if (rawData is! Map<String, dynamic>) return null;

      final isSuccess = rawData['code'] == 200 || rawData['success'] == true;
      final result = rawData['result'] ?? rawData['data'];
      if (!isSuccess || result is! Map<String, dynamic>) return null;

      return AddressSuggestionModel.fromJson(result);
    } catch (_) {
      return null;
    }
  }
}

@riverpod
AddressService addressService(AddressServiceRef ref) {
  return AddressService(API());
}
