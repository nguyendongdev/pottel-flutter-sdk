import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/banner_response.dart';

part 'banner_provider.g.dart';

@riverpod
Future<List<String>> banners(BannersRef ref) async {
  final api = API();
  try {
    final response = await api.get(
      '/bss/cms/banners',
    );
    final bannerResponse = BannerResponse.fromJson(response.data);
    return bannerResponse.result;
  } catch (e) {
    throw Exception('Failed to fetch banners');
  }
}
