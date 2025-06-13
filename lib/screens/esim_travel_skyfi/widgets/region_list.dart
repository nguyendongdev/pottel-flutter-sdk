import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/constants/spacing.dart';
import '../models/region_model.dart';
import 'region_grid_item.dart';

class RegionList extends ConsumerWidget {
  final List<RegionModel> regions;
  final String emptyMessage;

  const RegionList({
    super.key,
    required this.regions,
    this.emptyMessage = 'Không có dữ liệu',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (regions.isEmpty) {
      return Center(
        child: Text(emptyMessage),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: regions.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) {
        final region = regions[index];
        return RegionGridItem(
          region: region,
        );
      },
    );
  }
}
