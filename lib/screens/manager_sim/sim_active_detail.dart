import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/manager_sim/models/response_package/result_package.dart';
import 'package:skyfi_sdk/screens/manager_sim/providers/provider_manager_esim.dart';
import 'package:skyfi_sdk/screens/manager_sim/widgets/data_package_card.dart';

import 'models/response_manager_esim/item_my_esim.dart';

class SimActiveDetail extends ConsumerWidget {
  final ItemMyEsim esim;

  const SimActiveDetail({super.key, required this.esim});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final esimNotifierProvider = managerESimListDataProvider(esim.iccid ?? '');
    final esimAsyncValue = ref.watch(esimNotifierProvider);
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Main Package Usage Section
          _buildMainPackageSection(),

          SizedBox(height: 16),

          // Notification Section

          SizedBox(height: 16),

          // Additional Data Packages Section
          esimAsyncValue.when(
            data: (data) => _buildAdditionalPackagesSection(data.result ?? []),
            error: (error, stack) {
              return Center(
                child: Text(
                  'Lỗi tải dữ liệu: $error',
                  style: AppTextStyles.body.copyWith(color: AppColors.red),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildMainPackageSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Data Usage and Details Section
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Data Usage Circle
                _buildDataUsageCircle(),

                SizedBox(height: 16),

                // Detail Information
                _buildDetailInformation(),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Your Package Section
          // _buildYourPackageSection(),
        ],
      ),
    );
  }

  Widget _buildDataUsageCircle() {
    // Data usage calculation
    final totalData =
        esim.data?.total?.toDouble() ?? esim.dataAmount?.toDouble() ?? 8.0;
    final remaining = esim.data?.remaining?.toDouble() ?? 6.0;
    final usedData = totalData - remaining;
    final progress = totalData > 0 ? usedData / totalData : 0.0;

    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Progress Circle
          SizedBox(
            width: 180,
            height: 180,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              backgroundColor: AppColors.neutral100,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),

          // Center Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Còn lại',
                style: AppTextStyles.small.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${(totalData - usedData).toStringAsFixed(1)}GB/${totalData.toStringAsFixed(0)}GB',
                style: AppTextStyles.heading.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailInformation() {
    return Column(
      children: [
        _buildDetailItem(
          label: 'Phạm vi phủ sóng',
          value: esim.regionName ?? 'Singapore',
        ),
        _buildDetailItem(
          label: 'Cung cấp bởi',
          value: esim.providerName ?? 'Singtel',
          hasInfo: true,
        ),
        _buildDetailItem(
          label: 'Dung lượng',
          value: '${esim.dataAmount ?? 8} ${esim.dataUnit ?? 'GB'}',
        ),
        _buildDetailItem(
          label: 'Loại gói',
          value: 'Chỉ dữ liệu',
          hasInfo: true,
        ),
        _buildDetailItem(
          label: 'Hiệu lực',
          value: '${esim.validityDays ?? 30} ngày',
        ),
        _buildDetailItem(
          label: 'eKYC (Xác minh danh tính)',
          value: 'Không bắt buộc',
        ),
        _buildDetailItem(
          label: 'ICCID',
          value: esim.iccid ?? '89840480003232863650',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String label,
    required String value,
    bool hasInfo = false,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: Color(0xFFF1F1F1),
                  width: 1,
                ),
              ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.label.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.text,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: AppTextStyles.small.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                if (hasInfo) ...[
                  SizedBox(width: 4),
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: AppColors.text,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalPackagesSection(List<ResultPackage> data) {
    if (data.isEmpty) {
      return SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Mua thêm dung lượng',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          // Package Cards
          Column(
            children: data.map((package) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DataPackageCard(
                  package: package,
                  iccid: esim.iccid ?? '',
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
