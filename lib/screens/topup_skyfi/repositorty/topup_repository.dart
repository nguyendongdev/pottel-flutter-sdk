import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../network/api.dart';
import '../../payment_method_skyfi/models/payment_respone/payment_respone.dart';
import '../models/order_topup_response/order_topup_response.dart';
import '../models/topup_response/topup_response.dart';
part 'topup_repository.g.dart';

class TopupRepository {
  final API _api;

  TopupRepository(this._api);

  Future<TopupResponse> getTopupAmounts() async {
    try {
      final response = await _api.get('/bss/app/get-topup-value/1');
      print('response: ${response.data}');
      return TopupResponse.fromJson(response.data);
    } catch (e) {
      print('error: $e');
      throw Exception('Failed to load topup amounts: $e');
    }
  }

  // create-order-topup
  Future<OrderTopupResponse> createOrderTopup(
      String productId, String totalAmount, String contactPhone) async {
    final requestData = {
      'product_id': int.tryParse(productId) ?? 1,
      'total_amount': int.tryParse(totalAmount) ?? 0,
      'contact_phone': contactPhone,
    };

    try {
      final response =
          await _api.post('/bss/app/create-order-topup', data: requestData);
      return OrderTopupResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create order topup: $e');
    }
  }

  Future<String> getLinkPayment(String orderID) async {
    final response = await _api.post('/bss/payment/gateways/GALAXYPAY/redirect',
        data: {'orderNumber': orderID});
    final data = PaymentRespone.fromJson(response.data);
    if (response.statusCode == 200 && data.code == 200) {
      final link = data.result?.redirectUrl;
      if (link != null) {
        return link;
      }
    }
    return '';
  }
}

@riverpod
TopupRepository topupRepository(TopupRepositoryRef ref) {
  return TopupRepository(API());
}
