import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/manager_sim/models/response_package/result_package.dart';
import 'package:skyfi_sdk/screens/manager_sim/widgets/package_register_button.dart';
import 'package:skyfi_sdk/utilities/common.dart';

class DataPackageCard extends ConsumerWidget {
  final ResultPackage package;
  final String iccid;

  const DataPackageCard({
    super.key,
    required this.package,
    required this.iccid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          const Divider(color: Color(0xFFF1F1F1)),
          _buildFeatures(),
          const Divider(color: Color(0xFFF1F1F1)),
          _buildPriceAndRegister(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            package.name ?? 'DATA NAME',
            style: AppTextStyles.small.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: Implement view details functionality
          },
          child: Text(
            'Xem chi tiết',
            style: AppTextStyles.button.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      children: [
        if (package.data != null)
          _buildFeatureItem(
            icon: Icons.speed,
            text: 'Data: ${package.data}',
          ),
        if (package.voice != null)
          _buildFeatureItem(
            icon: Icons.phone,
            text: 'Phút gọi: ${package.voice} phút gọi liên mạng',
          ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              size: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.small.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndRegister() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package.sellingPrice != null
                    ? '${Common.formatCurrency(package.sellingPrice.toString())} VND'
                    : '0 VND',
                style: AppTextStyles.heading.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
        PackageRegisterButton(
          package: package,
          iccid: iccid,
        ),
      ],
    );
  }
}
