import 'package:flutter/material.dart';
import 'package:skyfi_sdk/l10n/l10n.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../models/package_model.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.package,
    required this.onTap,
  });

  final PackageModel package;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        border: Border.all(
          color: package.isSelected ? AppColors.primary : AppColors.border,
          width: package.isSelected ? 2 : 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  package.name,
                  style: AppTextStyles.title,
                ),
                if (package.isSelected)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildFeatureRow(
              context.l10n
                  .translate('high_speed_data')
                  .replaceAll('{0}', package.dataPerDay.toString()),
            ),
            const SizedBox(height: AppSpacing.sm),
            for (final description in package.description) ...[
              _buildFeatureRow(description),
              const SizedBox(height: AppSpacing.sm),
            ],
            const Divider(color: AppColors.border),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (package.price > package.salePrice) ...[
                  Text(
                    '${Common.formatCurrency(package.price.toString())} VND',
                    style: AppTextStyles.label.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Text(
                  '${Common.formatCurrency(package.salePrice.toString())} VND',
                  style: AppTextStyles.heading.copyWith(
                    color: package.price > package.salePrice
                        ? AppColors.red
                        : AppColors.text,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  context.l10n.translate('per_month'),
                  style: AppTextStyles.label,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: const Icon(
            Icons.check,
            color: AppColors.primary,
            size: 16,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body,
          ),
        ),
      ],
    );
  }
}
