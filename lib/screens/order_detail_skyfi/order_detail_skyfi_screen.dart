import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/routers/routers.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import '../../network/api.dart';
import 'models/order_detail_model.dart';
import 'widgets/order_info_card.dart';
import 'widgets/order_summary_card.dart';

class OrderDetailSkyfiScreen extends HookConsumerWidget {
  final String orderId;
  const OrderDetailSkyfiScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderDetail = useState<OrderDetailModel?>(null);
    final isLoading = useState(true);
    final api = API();

    Future<void> fetchOrderDetail() async {
      try {
        final response = await api.get('/bss/app/get-order/$orderId');
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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Chi tiết đơn hàng',
          style: AppTextStyles.title,
        ),
        leading: IconButton(
          onPressed: () => {
            context.goNamed(AppRouter.homeSkyFiNew),
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
        ),
        child: BottomButton(
          onPressed: () {
            context.goNamed(AppRouter.homeSkyFiNew);
          },
          text: 'Về trang chủ',
          textStyle: null,
        ),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : orderDetail.value == null
              ? const Center(child: Text('Không tìm thấy đơn hàng'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.screenPadding),
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
