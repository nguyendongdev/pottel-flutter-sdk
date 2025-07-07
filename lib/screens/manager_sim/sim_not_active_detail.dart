import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/routers/routers.dart';

import 'models/response_manager_esim/item_my_esim.dart';

class SimNotActiveDetail extends ConsumerWidget {
  final ItemMyEsim esim;

  const SimNotActiveDetail({super.key, required this.esim});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // QR Code Installation Section
          _buildQRCodeSection(),

          SizedBox(height: 16),

          // Detailed Information Section
          _buildDetailSection(),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildQRCodeSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Mã QR cài đặt eSIM',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16),

          // QR Code Display
          Container(
            width: 178,
            height: 177,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Image.network(esim.qrcodeUrl ?? '', fit: BoxFit.contain),
          ),

          SizedBox(height: 16),

          Text(
            'Quét mã QR trên để cài đặt eSIM trên điện thoại',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 16),

          // Installation guide link
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => _showInstallationGuide(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Xem hướng dẫn cài đặt eSIM',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceGuideSection() {
    return Column(
      children: [
        // iOS Device Guide
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _showDeviceGuide('iOS', context),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Thiết bị IOS',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.text,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 8),

        // Android Device Guide
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _showDeviceGuide('Android', context),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Thiết bị Android',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.text,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'ESIM BASIC',
            style: AppTextStyles.heading.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16),

          // Detail Information Items
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
            label: 'Chính sách kích hoạt',
            value: 'Thời hạn hiệu lực sẽ bắt đầu lúc cài',
          ),

          _buildDetailItem(
            label: 'Dung lượng',
            value: '${esim.dataAmount ?? 3} ${esim.dataUnit ?? 'GB'}',
          ),

          _buildDetailItem(
            label: 'Hiệu lực ',
            value: '${esim.validityDays ?? 5} ngày',
          ),

          _buildDetailItem(
            label: 'Giá',
            value: '199.000 VND',
          ),

          _buildDetailItem(
            label: 'Loại gói',
            value: 'Chỉ dữ liệu',
            hasInfo: true,
          ),

          _buildDetailItem(
            label: 'eKYC (Xác minh danh tính)',
            value: 'Không bắt buộc',
            isLast: true,
          ),
        ],
      ),
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

  void _showInstallationGuide(BuildContext context) {
    context.pushNamed(
      AppRouter.webviewTermsSkyfi,
      extra: {
        'url': 'https://skyfi.vn/vi/esimGuide?src=app',
        'title': 'Hướng dẫn cài đặt eSIM',
        'isCheckbox': false,
      },
    );
  }

  void _showDeviceGuide(String deviceType, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hướng dẫn cài đặt cho $deviceType'),
        content: Text(
            'Đây là hướng dẫn chi tiết cài đặt eSIM cho thiết bị $deviceType.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Đóng'),
          ),
        ],
      ),
    );
  }
}
