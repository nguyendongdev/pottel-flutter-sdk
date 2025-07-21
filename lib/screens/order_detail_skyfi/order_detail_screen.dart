import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../l10n/localization_extension.dart';
import '../../core/widgets/app_bar_custom.dart';
import '../../network/api.dart';
import 'models/order_detail_model.dart';
import 'widgets/order_info_card.dart';
import 'widgets/order_summary_card.dart';

class OrderDetailScreen extends HookConsumerWidget {
  final String orderCode;
  const OrderDetailScreen({super.key, required this.orderCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderDetail = useState<OrderDetailModel?>(null);
    final isLoading = useState(true);
    final api = API();

    Future<void> fetchOrderDetail() async {
      try {
        final response = await api.get('/bss/app/get-order/$orderCode');
        final orderDetailResponse = OrderDetailResponse.fromJson(response.data);
        if (orderDetailResponse.code == 200) {
          orderDetail.value = orderDetailResponse.result.order;
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      fetchOrderDetail();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarCustom(
        title: context.l10n.translate('order_detail_title'),
        onBack: () => Navigator.pop(context),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : orderDetail.value == null
              ? Center(child: Text(context.l10n.translate('order_not_found')))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderInfoCard(order: orderDetail.value!),
                        const SizedBox(height: 16),
                        OrderSummaryCard(order: orderDetail.value!),
                      ],
                    ),
                  ),
                ),
    );
  }
}
