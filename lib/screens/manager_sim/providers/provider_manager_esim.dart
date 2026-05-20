import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pottel_sdk/l10n/l10n.dart';
import 'package:pottel_sdk/network/api.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/screens/manager_sim/models/response_add_data/response_add_data.dart';
import 'package:pottel_sdk/screens/manager_sim/models/response_manager_esim/response_manager_esim.dart';
import 'package:pottel_sdk/screens/manager_sim/models/response_package/response_package.dart';
import 'package:pottel_sdk/screens/payment_method_skyfi/models/payment_respone/payment_respone.dart';

import '../../../core/constants/payment_gateway.dart';

part 'provider_manager_esim.g.dart';

class ServiceManagerESim {
  final _api = API();

  final String _urlESim = '/bss/travel-esim/my-travel-esim';
  final String _urlEsimListData = '/bss/travel-esim/list-topup-package/';
  final String _urlAddDataToSim = '/bss/travel-esim/create-order-topup';
  Future<ResponseManagerEsim> getESimList() async {
    try {
      final response = await _api.get(_urlESim);
      return ResponseManagerEsim.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load eSIM list: $e');
    }
  }

  Future<ResponsePackage> getESimListData(String id) async {
    try {
      final response = await _api.get('$_urlEsimListData$id');
      log('Response data: ${response.data}');
      return ResponsePackage.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load eSIM list data: $e');
    }
  }

  Future<ResponseAddData> addDataToSim(String id, String iccid) async {
    try {
      Map<String, dynamic> params = {
        "product_id": int.parse(id),
        "iccid": iccid,
        "source": "WEB"
      };

      final response = await _api.post(_urlAddDataToSim, data: params);
      return ResponseAddData.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load eSIM detail: $e');
    }
  }

  void getLinkPayment(String orderID, BuildContext context) async {
    // isLoading.value = true;
    final response = await _api.post(PaymentGateway.redirectEndpoint(), data: {
      'orderCode': orderID,
      'locale': context.l10n.locale.languageCode
    });
    // isLoading.value = false;
    final data = PaymentRespone.fromJson(response.data);
    if (response.statusCode == 200 && data.code == 200 && context.mounted) {
      final link = data.result?.iframeUrl ?? data.result?.redirectUrl;
      if (link != null) {
        context.pushNamed(AppRouter.webviewPaymentSkyfi, extra: link);
      }
    }
  }
}

@riverpod
ServiceManagerESim serviceManagerESim(ServiceManagerESimRef ref) {
  return ServiceManagerESim();
}

enum TabManagerESim {
  active,
  notActive,

  // call, // Uncomment if you want to add a call tab
}

@riverpod
class ManagerESimNotifier
    extends AutoDisposeAsyncNotifier<ResponseManagerEsim?> {
  @override
  FutureOr<ResponseManagerEsim?> build() async {
    final serviceManager = ref.watch(serviceManagerESimProvider);
    return await serviceManager.getESimList();
  }
}

@riverpod
class ManagerESimListData extends _$ManagerESimListData {
  @override
  Future<ResponsePackage> build(String iccid) async {
    print('Fetching eSIM list data for ICCID: $iccid');
    final serviceManager = ref.watch(serviceManagerESimProvider);
    return await serviceManager.getESimListData(iccid);
  }

  Future<void> addDataAndNavigateToPayment(
      String productId, String iccid, BuildContext context) async {
    try {
      final serviceManager = ref.watch(serviceManagerESimProvider);
      final response = await serviceManager.addDataToSim(productId, iccid);

      if (response.code == 200 &&
          response.result?.orderNumber != null &&
          context.mounted) {
        serviceManager.getLinkPayment(response.result!.orderNumber!, context);
      }
    } catch (e) {
      throw Exception('Failed to add data and navigate to payment: $e');
    }
  }
}

@riverpod
class TabManagerESimNotifier extends AutoDisposeNotifier<TabManagerESim> {
  @override
  TabManagerESim build() => TabManagerESim.active;

  void changeTab(TabManagerESim tab) {
    state = tab;
  }

  bool isActiveTab() => state == TabManagerESim.active;
}
