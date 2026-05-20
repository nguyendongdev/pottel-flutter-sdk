import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import '../../../l10n/localization_extension.dart';
import 'package:pottel_sdk/screens/manager_sim/models/response_package/result_package.dart';
import 'package:pottel_sdk/screens/manager_sim/widgets/package_register_button.dart';
import 'package:pottel_sdk/utilities/common.dart';

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
          _buildHeader(context),
          const Divider(color: Color(0xFFF1F1F1)),
          _buildFeatures(context),
          const Divider(color: Color(0xFFF1F1F1)),
          _buildPriceAndRegister(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
            context.l10n.translate('view_details_sim'),
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

  Widget _buildFeatures(BuildContext context) {
    return Column(
      children: [
        if (package.data != null)
          _buildFeatureItem(
            context: context,
            icon: Icons.speed,
            text: context.l10n.translate('data_prefix').replaceAll('{0}', package.data ?? ''),
          ),
        if (package.voice != null)
          _buildFeatureItem(
            context: context,
            icon: Icons.phone,
            text: context.l10n.translate('call_minutes_inter_network_card').replaceAll('{0}', package.voice?.toString() ?? ''),
          ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
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
