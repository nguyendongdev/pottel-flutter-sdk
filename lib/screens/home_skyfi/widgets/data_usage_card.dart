import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/circular_progress_gradient.dart';
import '../../../routers/routers.dart';
import '../provider/data_usage_provider.dart';

class DataUsageCard extends HookConsumerWidget {
  const DataUsageCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPackage = ref.watch(currentPackageNotifierProvider);
    return currentPackage.when(
      loading: () => const AppCard(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => const SizedBox.shrink(),
      data: (pkg) {
        if (pkg == null) {
          return const AppCard(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.cardPadding),
              child: Center(
                child: Text(
                  'Không có dữ liệu gói cước',
                  style: AppTextStyles.body,
                ),
              ),
            ),
          );
        }
        final remain = double.tryParse(pkg.remainData ?? '') ?? 0.0;
        final total = double.tryParse(pkg.totalData ?? '') ?? 1.0;
        return InkWell(
          onTap: () {
            context.pushNamed(AppRouter.detailDataUsage, extra: pkg);
          },
          child: AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Gói cước chính',
                                style: AppTextStyles.label,
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                pkg.packageName ?? '-',
                                style: AppTextStyles.title,
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              const Text(
                                'Thời hạn còn',
                                style: AppTextStyles.label,
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Row(
                                children: [
                                  Text(
                                    _daysLeft(pkg.toDate),
                                    style: AppTextStyles.title,
                                  ),
                                  const SizedBox(width: AppSpacing.sm),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.sm,
                                      vertical: AppSpacing.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/top_calendar.svg',
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: AppSpacing.xs),
                                        Text(
                                          pkg.toDate?.split(' ').first ?? '-',
                                          style:
                                              AppTextStyles.smallBold.copyWith(
                                            color: AppColors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .pushNamed(AppRouter.changePackageSkyFi);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/top_refresh.svg',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: AppSpacing.xs),
                                    Text(
                                      'Đổi gói cước',
                                      style: AppTextStyles.button.copyWith(
                                        color: AppColors.strongSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          CircularProgressGradient(
                            progress: remain / total * 100,
                            total: total,
                            used: remain,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String _daysLeft(String? toDate) {
  if (toDate == null) return '-';
  try {
    final parts = toDate.split(' ');
    final date = DateTime.parse(_convertDate(parts.first));
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final diff = date.difference(today).inDays;
    return diff > 0 ? '$diff ngày' : 'Hết hạn';
  } catch (_) {
    return '-';
  }
}

String _convertDate(String date) {
  // from dd/MM/yyyy to yyyy-MM-dd
  final parts = date.split('/');
  if (parts.length != 3) return date;
  return '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
}
