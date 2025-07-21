import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import '../../l10n/localization_extension.dart';
import 'package:skyfi_sdk/screens/manager_sim/models/response_package/result_package.dart';
import 'package:skyfi_sdk/screens/manager_sim/providers/provider_manager_esim.dart';
import 'package:skyfi_sdk/screens/manager_sim/widgets/data_package_card.dart';

import 'models/response_manager_esim/item_my_esim.dart';

class SimActiveDetail extends ConsumerStatefulWidget {
  final ItemMyEsim esim;
  final bool isBuying;

  const SimActiveDetail({super.key, required this.esim, this.isBuying = false});

  @override
  ConsumerState<SimActiveDetail> createState() => _SimActiveDetailState();
}

class _SimActiveDetailState extends ConsumerState<SimActiveDetail> {
  late ScrollController _scrollController;
  final GlobalKey _additionalPackagesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Auto-scroll to additional packages section if isBuying is true
    if (widget.isBuying) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToAdditionalPackages();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToAdditionalPackages() {
    final context = _additionalPackagesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final esimNotifierProvider =
        managerESimListDataProvider(widget.esim.iccid ?? '');
    final esimAsyncValue = ref.watch(esimNotifierProvider);
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      controller: _scrollController,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Main Package Usage Section
          _buildMainPackageSection(),

          SizedBox(height: 16),

          // Notification Section

          SizedBox(height: 16),

          // Additional Data Packages Section
          Container(
            key: _additionalPackagesKey,
            child: esimAsyncValue.when(
              data: (data) =>
                  _buildAdditionalPackagesSection(data.result ?? []),
              error: (error, stack) {
                return Center(
                  child: Text(
                    context.l10n.translate('data_load_error').replaceAll('{0}', error.toString()),
                    style: AppTextStyles.body.copyWith(color: AppColors.red),
                  ),
                );
              },
              loading: () => SizedBox(
                  height: size.height,
                  child: const Center(child: CircularProgressIndicator())),
            ),
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  String convertDataUnit(double dataAmount) {
    if (dataAmount >= 1024 * 1024) {
      return '${(dataAmount / (1024 * 1024)).toStringAsFixed(0)}TB';
    } else if (dataAmount >= 1024) {
      return '${(dataAmount / 1024).toStringAsFixed(0)}GB';
    } else {
      return '${dataAmount.toStringAsFixed(0)}MB';
    }
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
    final totalData = widget.esim.data?.total?.toDouble() ??
        widget.esim.dataAmount?.toDouble() ??
        8.0;
    final remaining = widget.esim.data?.remaining?.toDouble() ?? 6.0;
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
                context.l10n.translate('remaining_data'),
                style: AppTextStyles.small.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${convertDataUnit(totalData - usedData)} / ${convertDataUnit(totalData)}',
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
          context: context,
          label: context.l10n.translate('coverage_area_detail'),
          value: widget.esim.regionName ?? 'Singapore',
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('provided_by_detail'),
          value: widget.esim.providerName ?? 'Singtel',
          hasInfo: true,
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('data_capacity_sim_detail'),
          value:
              '${widget.esim.dataAmount ?? 8} ${widget.esim.dataUnit ?? 'GB'}',
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('package_type_detail'),
          value: context.l10n.translate('data_only_type'),
          hasInfo: true,
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('validity_sim_detail'),
          value: '${widget.esim.validityDays ?? 30} ${context.l10n.translate('days_unit_sim')}',
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('ekyc_detail'),
          value: context.l10n.translate('not_required_detail'),
        ),
        _buildDetailItem(
          context: context,
          label: context.l10n.translate('iccid_detail'),
          value: widget.esim.iccid ?? '89840480003232863650',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required BuildContext context,
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
            context.l10n.translate('buy_additional_data'),
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
                  iccid: widget.esim.iccid ?? '',
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
