import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../network/api.dart';

part 'banner_provider.g.dart';

const List<String> _defaultBanners = [
  'asset://assets/images/banner-home.png',
];

List<String> _extractBannerUrls(dynamic payload) {
  if (payload is! Map<String, dynamic>) return _defaultBanners;

  final result = payload['result'];
  List<dynamic> rawList = [];

  if (result is List) {
    rawList = result;
  } else if (result is Map<String, dynamic>) {
    final nested = result['banners'] ?? result['items'] ?? result['data'];
    if (nested is List) rawList = nested;
  }

  final urls = rawList
      .map<String?>((item) {
        if (item is String) return item.trim();
        if (item is Map<String, dynamic>) {
          final candidate = item['url'] ??
              item['image'] ??
              item['image_url'] ??
              item['banner_url'];
          if (candidate == null) return null;
          return candidate.toString().trim();
        }
        return null;
      })
      .whereType<String>()
      .where((e) => e.isNotEmpty)
      .toList();

  if (urls.isEmpty) return _defaultBanners;
  return urls;
}

@riverpod
Future<List<String>> banners(BannersRef ref) async {
  final api = API();
  try {
    final response = await api.get(
      '/bss/cms/banners',
    );
    return _extractBannerUrls(response.data);
  } catch (e) {
    debugPrint('Banner fetch failed: $e');
    return _defaultBanners;
  }
}
