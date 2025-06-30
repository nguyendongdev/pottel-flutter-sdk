import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skyfi_sdk/network/api.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:skyfi_sdk/screens/detail_data_usage_skyfi/widgets/card_used_square.dart';
import 'package:skyfi_sdk/screens/home_skyfi/models/current_package.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/background_gradient.dart';
import '../../core/widgets/circular_progress_gradient.dart';
import '../home_skyfi/models/outstanding_pakage.dart';
import '../home_skyfi/widgets/package_card.dart';

class DetailDataUsageScreen extends HookConsumerWidget {
  final CurrentPackage? currentPackage;
  const DetailDataUsageScreen({super.key, this.currentPackage});
  String _daysLeft(String? toDate) {
    if (toDate == null) return '-';
    try {
      final date = _convertDate(toDate);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final diff = date.difference(today).inDays;
      return diff > 0 ? '$diff' : '';
    } catch (_) {
      return '-';
    }
  }

  String _daysLeftFromDate(String startDate, String toDate) {
    try {
      final parsedStartDate = _convertDate(startDate);
      final parsedToDate = _convertDate(toDate);
      final diff = parsedToDate.difference(parsedStartDate).inDays;
      print(
          'Start Date: $parsedStartDate, To Date: $parsedToDate, Diff: $diff');
      return diff > 0 ? '/$diff ngày' : 'hết hạn';
    } catch (_) {
      return '-';
    }
  }

  DateTime _convertDate(String date) {
    DateFormat format = DateFormat("dd/MM/yyyy");

    return format.parse(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();
    final listOutStandingPackage = useState<List<PackageModel>>([]);
    final remain = double.tryParse(currentPackage?.remainData ?? '') ?? 0.0;
    final total = double.tryParse(currentPackage?.totalData ?? '') ?? 0.0;

    void fetchOutStandingPackage() async {
      final response = await api.get('/bss/app/get-outstanding-package');
      final outStandingPackage =
          OutStandingPackageResponse.fromJson(response.data);
      if (outStandingPackage.code == 200) {
        listOutStandingPackage.value = outStandingPackage.result;
      }
    }

    useEffect(() {
      fetchOutStandingPackage();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const BackgroundGradient(),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                         Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Còn lại ${_daysLeft(currentPackage?.toDate)}',
                            style: AppTextStyles.title.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          TextSpan(
                            text: _daysLeftFromDate(
                                currentPackage!.fromDate ?? '',
                                currentPackage!.toDate ?? ''),
                            style: AppTextStyles.title.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                CircularProgressGradient(
                  size: 180,
                  progress: remain / total,
                  total: total,
                  used: remain,
                  backStrokeWidth: 20,
                  progressStrokeWidth: 20,
                  textColor: AppColors.white,
                  textProgressColor: AppColors.white,
                  progressColors: const [
                    Color(0xFFEE3436),
                    Color(0xFFF3B71A),
                    Color(0xFFF3B71A),
                  ],
                  textTitle:
                      'Còn lại ${_daysLeft(currentPackage?.toDate)} ngày',
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (currentPackage?.totalVoice != null &&
                          currentPackage?.totalVoice != '0')
                        Expanded(
                          child: CardUsedSquare(
                            title: 'Gọi',
                            date: 'Tháng',
                            description:
                                '${currentPackage?.totalVoice ?? ''} phút/ tháng',
                            used: int.tryParse(
                                    currentPackage?.remainVoice ?? '0') ??
                                0,
                            total: int.tryParse(
                                    currentPackage?.totalVoice ?? '0') ??
                                0,
                            icon: 'assets/icons/feat_call.svg',
                          ),
                        ),
                      SizedBox(
                        width: currentPackage?.totalSms != null &&
                                currentPackage?.totalSms != '0'
                            ? AppSpacing.md
                            : 0,
                      ),
                      if (currentPackage?.totalSms != null &&
                          currentPackage?.totalSms != '0')
                        Expanded(
                          child: CardUsedSquare(
                            title: 'Tin nhắn',
                            date: 'Tháng',
                            description:
                                '${currentPackage?.totalSms ?? '0'} SMS/ tháng',
                            used: int.tryParse(
                                    currentPackage?.remainSms ?? '0') ??
                                0,
                            total:
                                int.tryParse(currentPackage?.totalSms ?? '0') ??
                                    0,
                            icon: 'assets/icons/feat_message.svg',
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: currentPackage?.totalSms != null &&
                          currentPackage?.totalSms != '0' &&
                          currentPackage?.totalVoice != null &&
                          currentPackage?.totalVoice != '0'
                      ? AppSpacing.md
                      : 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gói cước hot',
                        style: AppTextStyles.heading,
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(AppRouter.listPackageSkyFi);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Khám phá',
                              style: AppTextStyles.button.copyWith(
                                color: AppColors.strongSecondary,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.strongSecondary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 290,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                      vertical: AppSpacing.md,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: listOutStandingPackage.value.isNotEmpty
                        ? listOutStandingPackage.value.map((pkg) {
                            return PackageCard(
                              package: pkg,
                              margin: const EdgeInsets.only(right: 16),
                              onTapDetail: () {
                                context.pushNamed(AppRouter.packageDetailSkyfi,
                                    extra: {
                                      'packageId': pkg.id.toInt(),
                                    });
                              },
                              onTapRegister: () {
                                context.pushNamed(AppRouter.packageDetailSkyfi,
                                    extra: {
                                      'packageId': pkg.id.toInt(),
                                      'isRegister': true,
                                    });
                              },
                            );
                          }).toList()
                        : [
                            const Center(
                              child: Text('Không có gói cước hot hiện tại.'),
                            ),
                          ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
