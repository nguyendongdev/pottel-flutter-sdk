import 'package:pottel_sdk/network/api.dart';
import 'package:pottel_sdk/screens/history_mobile_skyfi/models/response_history_pack/package_history.dart';
import 'package:pottel_sdk/screens/history_mobile_skyfi/models/response_history_pack/response_history_pack.dart';
import 'package:pottel_sdk/screens/history_mobile_skyfi/models/response_history_toup/response_history_toup.dart';
import 'package:pottel_sdk/screens/history_mobile_skyfi/models/response_history_toup/topup_history.dart';

class Historyservice {
  final API _api = API();

  Future<List<TopUpHistory>> getHistory() async {
    try {
      final response = await _api.get(
        '/bss/app/get-topup-history',
      );
      ResponseHistoryToup responseHistoryToup =
          ResponseHistoryToup.fromJson(response.data);

      return responseHistoryToup.result ?? [];
    } catch (e) {
      throw Exception('Failed to fetch history: $e');
    }
  }

  Future<List<PackageHistory>> getPackageHistory() async {
    try {
      final response = await _api.get(
        '/bss/app/get-package-history',
      );
      print('response --> ${response.data}');
      final ResponseHistoryPack responseHistoryPack =
          ResponseHistoryPack.fromJson(response.data);

      return responseHistoryPack.result ?? [];
    } catch (e) {
      throw Exception('Failed to fetch package history: $e');
    }
  }
}
