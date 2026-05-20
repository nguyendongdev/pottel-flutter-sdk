import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:pottel_sdk/pottel_sdk_config.dart';

class PottelSdkAuth {
  loginWithPhone(String phone) async {
    try {
      final response = await Dio().post(
          '${PottelSdkConfig.baseUrl}/bss/app/login-with-access-token',
          data: {
            'msisdn': phone,
            'code': encodeHmacSHA256(phone, 'c2t5ZmkyMDI1'),
          });

      return response.data;
    } catch (e) {
      return null;
    }
  }

  String encodeHmacSHA256(String phone, String key) {
    final hmacSha256 = Hmac(sha256, utf8.encode(key));
    final digest = hmacSha256.convert(utf8.encode(phone));

    return digest.toString();
  }
}

@Deprecated('Use PottelSdkAuth instead')
typedef SkyfiSdkAuth = PottelSdkAuth;
