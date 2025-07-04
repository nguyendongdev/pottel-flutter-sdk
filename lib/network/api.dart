import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:skyfi_sdk/skyfi_sdk_config.dart';

import 'intercepters/dio_intercepter.dart';

class API {
  late final Dio _dio;
  API() : _dio = Dio() {
    _dio.options.baseUrl = SkyfiSdkConfig.baseUrl;
    _dio.interceptors.add(DioInterceptor());
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'content-length': null,
    };
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          maxStale: const Duration(hours: 1),
          priority: CachePriority.normal,
        ),
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> getWithHeaders(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final options = Options(headers: headers);
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> postWithFormData(String path, {Object? data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    return _dio.delete(path, data: data);
  }
}
