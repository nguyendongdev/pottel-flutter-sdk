import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';

import 'models/response_manager_esim/item_my_esim.dart';
import 'sim_active_detail.dart';
import 'sim_not_active_detail.dart';

class DetailESim extends ConsumerWidget {
  final ItemMyEsim esim;

  const DetailESim({super.key, required this.esim});

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
          icon: Icon(Icons.arrow_back_ios, color: AppColors.text),
        ),
        title: Text(
          'Chi tiết eSIM',
          style: AppTextStyles.heading,
        ),
        centerTitle: true,
      ),
      body: isActive
          ? SimActiveDetail(esim: esim)
          : SimNotActiveDetail(esim: esim),
    );
  }
}
