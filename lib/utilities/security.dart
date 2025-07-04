import 'dart:convert';

import 'package:crypto/crypto.dart';

String HASH_KEY = 'c2t5ZmkyMDI1';

class Security {
  // hash password with hmacSha256
  static String hashSecureCode(String password) {
    final bytes = utf8.encode(password);
    final hmacSha256 = Hmac(sha256, utf8.encode(HASH_KEY));
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }
}
