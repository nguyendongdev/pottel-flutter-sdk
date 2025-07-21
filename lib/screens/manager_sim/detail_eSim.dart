import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import '../../l10n/localization_extension.dart';

import 'models/response_manager_esim/item_my_esim.dart';
import 'sim_active_detail.dart';
import 'sim_not_active_detail.dart';

class DetailESim extends ConsumerWidget {
  final ItemMyEsim esim;
  final bool isBuying;

  const DetailESim({super.key, required this.esim, this.isBuying = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = esim.status?.toLowerCase() == 'active';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.text),
        ),
        title: Text(
          context.l10n.translate('esim_detail_title'),
          style: AppTextStyles.heading,
        ),
        centerTitle: true,
      ),
      body: isActive
          ? SimActiveDetail(esim: esim, isBuying: isBuying)
          : SimNotActiveDetail(esim: esim),
    );
  }
}
