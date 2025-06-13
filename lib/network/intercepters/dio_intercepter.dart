import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../routers/routers.dart';
import '../../utilities/common.dart';
import '../store.dart';
import '../../screens/login/login_screen.dart';

class DioInterceptor extends Interceptor {
  static bool _isShowingLogin = false;

  // Define constants for header keys
  static const String _headerApiKey = 'apiKey';
  static const String _headerAuthorization = 'Authorization';
  static const String _headerDeviceId = 'device_id';
  static const String _headerDeviceIdWeb = 'deviceId';
  static const String _headerUserAgent = 'User-Agent';
  static const String _headerEncoding = 'accept-encoding';
  static const String _headerVersion = 'version';
  static const String _headerXApiKey = 'x-api-key';

  Future<Map<String, dynamic>> _getDefaultHeaders() async {
    final deviceId = await Common.getDeviceId();
    final version = await Common.getVersionApp();
    final token = await StoreClient.getToken();

    final headers = <String, dynamic>{
      _headerDeviceId: deviceId,
      _headerDeviceIdWeb: deviceId,
      _headerVersion: version,
    };

    if (token != null && token.isNotEmpty) {
      headers[_headerApiKey] = token;
      headers[_headerAuthorization] = 'Bearer $token';
      // remove content-length
      headers.remove('content-length');
    }
    return headers;
  }

  void _logRequest(String method, String path) {
    if (kDebugMode) {
      print('📡 REQUEST[$method] => PATH: $path');
    }
  }

  void _logResponse(int? statusCode, String path) {
    if (kDebugMode) {
      print('✅ RESPONSE[$statusCode] <= PATH: $path');
    }
  }

  void _logError(int? statusCode, String path, dynamic error) {
    if (kDebugMode) {
      print('❌ ERROR[$statusCode] => PATH: $path');
      print('Error details: $error');
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers.addAll(await _getDefaultHeaders());
      _logRequest(options.method, options.path);
      super.onRequest(options, handler);
    } catch (e) {
      _logError(null, options.path, e);
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to process request: $e',
        ),
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response.statusCode, response.requestOptions.path);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err.response?.statusCode, err.requestOptions.path, err.error);

    if (err.response?.statusCode == 401 && !_isShowingLogin) {
      _handleUnauthorizedError();
    }

    super.onError(err, handler);
  }

  void _handleUnauthorizedError() {
    _isShowingLogin = true;
    NavigatorService.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
    _isShowingLogin = false;
  }
}
