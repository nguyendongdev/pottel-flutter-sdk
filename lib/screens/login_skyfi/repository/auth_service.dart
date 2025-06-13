import 'package:dio/dio.dart';
import '../../../network/api.dart';
import '../models/check_user_password_response.dart';
import '../models/login_with_password_response.dart';
import '../models/update_password_response.dart';
import '../../home_skyfi/models/user_info.dart';

class AuthService {
  final API _api = API();

  Future<CheckUserPasswordResponse> checkUserPassword(String msisdn) async {
    try {
      final request = CheckUserPasswordRequest(msisdn: msisdn);

      final response = await _api.post(
        '/bss/app/check-user-password',
        data: request.toJson(),
      );

      return CheckUserPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<LoginWithPasswordResponse> loginWithPassword({
    required String msisdn,
    required String password,
  }) async {
    try {
      final request = LoginWithPasswordRequest(
        msisdn: msisdn,
        password: password,
      );

      final response = await _api.post(
        '/bss/app/login-with-password',
        data: request.toJson(),
      );

      // Debug logging
      print('Login API Response: ${response.data}');
      print('Response type: ${response.data.runtimeType}');

      // Check if response.data is null or not a Map
      if (response.data == null) {
        throw Exception('Server trả về dữ liệu rỗng');
      }

      if (response.data is! Map<String, dynamic>) {
        throw Exception('Server trả về dữ liệu không đúng định dạng');
      }

      return LoginWithPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e.toString().contains(
          'type \'Null\' is not a subtype of type \'Map<String, dynamic>\'')) {
        throw Exception(
            'Server trả về dữ liệu không hợp lệ. Vui lòng thử lại.');
      }
      throw Exception('Unexpected error: $e');
    }
  }

  Future<UpdatePasswordResponse> updatePassword(String password) async {
    try {
      final request = UpdatePasswordRequest(password: password);

      final response = await _api.post(
        '/bss/app/update-password',
        data: request.toJson(),
      );

      return UpdatePasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<UserInfoResponse> fetchUserInfo(String phone) async {
    try {
      final response = await _api.get('/bss/app/get-subscriber-info/$phone');
      return UserInfoResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Kết nối timeout. Vui lòng thử lại.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;

        // Handle case where response.data might be null or not a Map
        String message = 'Có lỗi xảy ra';
        if (e.response?.data != null) {
          if (e.response!.data is Map<String, dynamic>) {
            message = e.response!.data['message'] ?? message;
          } else if (e.response!.data is String) {
            message = e.response!.data;
          }
        }

        // Handle specific error cases
        if (statusCode == 400 || statusCode == 401) {
          if (message.toLowerCase().contains('password') ||
              message.toLowerCase().contains('mật khẩu') ||
              message.toLowerCase().contains('sai')) {
            return Exception('Mật khẩu không đúng. Vui lòng thử lại.');
          }
        }

        return Exception('Lỗi $statusCode: $message');
      case DioExceptionType.cancel:
        return Exception('Yêu cầu đã bị hủy');
      case DioExceptionType.connectionError:
        return Exception('Không có kết nối internet');
      default:
        return Exception('Có lỗi xảy ra. Vui lòng thử lại.');
    }
  }
}
