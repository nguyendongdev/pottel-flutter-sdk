import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pottel_sdk/pottel_sdk_config.dart';

import 'intercepters/dio_intercepter.dart';

class EKYC_API {
  late final Dio _dio;
  EKYC_API() : _dio = Dio() {
    _dio.options.baseUrl = PottelSdkConfig.baseUrlEKYC;
    _dio.interceptors.add(DioInterceptor());
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Token':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgZm9yIGFwb3RhIiwiaWF0IjoxNjkzMTg0MjYwLCJleHAiOjE3MjQ3MjAyNjAsImF1ZCI6InJhci5pZGNoZWNrLmNvbS52biIsInN1YiI6ImFwb3RhQGlkY2hlY2suZGV2IiwiUm9sZSI6Ik1hbmFnZXIifQ.aqrv1yApu2S-p53dZnhQLFLVShD92Xn5-1AmHpXE5RU',
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

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    return _dio.delete(path, data: data);
  }
}
