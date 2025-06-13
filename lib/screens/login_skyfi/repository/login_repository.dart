import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../../../network/store.dart';
import '../models/login_user.dart';

// part 'login_repository.g.dart';

class LoginRepository {
  final API _api;

  LoginRepository(this._api);

  /// Gửi OTP đến số điện thoại
  Future<LoginResponse> sendOtp(String phone) async {
    try {
      final response = await _api.post('/bss/app/send-otp-login', data: {
        'msisdn': phone,
      });

      return LoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Xác thực OTP và đăng nhập
  Future<VerifyOtpResponse> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _api.post('/bss/app/login-with-otp', data: {
        'msisdn': phone,
        'otp': otp,
      });

      final verifyResponse = VerifyOtpResponse.fromJson(response.data);

      // Lưu token và phone nếu đăng nhập thành công
      if (verifyResponse.code == 200) {
        await StoreClient.setToken(verifyResponse.result?.token ?? '');
        await StoreClient.setPhone(phone);
      }

      return verifyResponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Gửi lại OTP
  Future<Map<String, dynamic>> resendOtp(String phone) async {
    try {
      final response = await _api.post('/bss/app/send-otp-login', data: {
        'msisdn': phone,
      });

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@Riverpod()
LoginRepository loginRepository(Ref ref) {
  return LoginRepository(API());
}
