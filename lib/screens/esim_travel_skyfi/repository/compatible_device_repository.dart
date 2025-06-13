import 'package:dio/dio.dart';
import '../models/compatible_device_response.dart';
import '../../../network/api.dart';

class CompatibleDeviceRepository {
  final API _api;

  CompatibleDeviceRepository({required API api}) : _api = api;

  Future<CompatibleDeviceResponse> getCompatibleDevices() async {
    try {
      final response = await _api.get('/bss/app/get-compatible-devices');
      return CompatibleDeviceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Something went wrong');
    }
  }
}
