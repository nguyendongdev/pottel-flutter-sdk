import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/network/api.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/screens/detail_data_usage_skyfi/widgets/card_used_square.dart';
import 'package:pottel_sdk/screens/home_skyfi/models/current_package.dart';
import 'package:pottel_sdk/screens/home_skyfi/provider/login_provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/background_gradient.dart';
import '../../core/widgets/circular_progress_gradient.dart';
import '../home_skyfi/models/outstanding_pakage.dart';
import '../home_skyfi/widgets/package_card.dart';

class DetailDataUsageScreen extends HookConsumerWidget {
  const DetailDataUsageScreen({super.key});
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

  String _daysLeftFromDate(
      BuildContext context, String startDate, String toDate) {
    try {
      final parsedStartDate = _convertDate(startDate);
      final parsedToDate = _convertDate(toDate);
      final diff = parsedToDate.difference(parsedStartDate).inDays;
      return diff > 0
          ? '/$diff ${context.l10n.translate('day_unit')}'
          : context.l10n.translate('expired');
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
    final currentPackage = useState<CurrentPackage?>(null);
    final remain = useState<double>(0.0);
    final total = useState<double>(0.0);
    final load = useState<bool>(false);
    final phone = ref.watch(currentPhoneProvider);

    void fetchOutStandingPackage() async {
      final response = await api.get('/bss/app/get-outstanding-package');
      final outStandingPackage =
          OutStandingPackageResponse.fromJson(response.data);
      if (outStandingPackage.code == 200) {
        listOutStandingPackage.value = outStandingPackage.result;
      }
    }

    fetchCurrentPackage() async {
      if (phone.isEmpty) {
        return;
      }
      try {
        load.value = true;
        final response = await api.get('/bss/app/get-current-package/$phone');
        final data = CurrentPackageResponse.fromJson(response.data);
        if (data.code == 200 &&
            data.result != null &&
            data.result!.isNotEmpty) {
          final currentPackage0 =
              data.result!.firstWhere((pkg) => pkg.isMain == 1, orElse: () {
            return data.result!.first;
          });
          currentPackage.value = currentPackage0;
          final remainValue =
              double.tryParse(currentPackage0.remainData ?? '0') ?? 0.0;
          final totalValue =
              double.tryParse(currentPackage0.totalData ?? '0') ?? 0.0;

          // Ensure values are valid numbers
          remain.value = remainValue.isFinite ? remainValue : 0.0;
          total.value =
              totalValue.isFinite && totalValue > 0 ? totalValue : 1.0;
        }
      } finally {
        load.value = false;
      }
    }

    // Helper function to calculate safe progress
    double getSafeProgress() {
      if (total.value <= 0 || !remain.value.isFinite || !total.value.isFinite) {
        return 0.0;
      }
      final progress = (remain.value / total.value * 100);
      return progress.isFinite ? progress.clamp(0.0, 100.0) : 0.0;
    }

    useEffect(() {
      fetchCurrentPackage();
      return;
    }, [phone]);

    useEffect(() {
      fetchOutStandingPackage();
      return;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: load.value
          ? const Center(child: CircularProgressIndicator())
          : Stack(
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
                                  text: context.l10n
                                      .translate('days_remaining')
                                      .replaceAll(
                                          '{0}',
                                          _daysLeft(
                                              currentPackage.value?.toDate)),
                                  style: AppTextStyles.title.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white),
                                ),
                                TextSpan(
                                  text: _daysLeftFromDate(
                                      context,
                                      currentPackage.value?.fromDate ?? '',
                                      currentPackage.value?.toDate ?? ''),
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
                        progress: getSafeProgress(),
                        total: total.value,
                        used: remain.value,
                        backStrokeWidth: 20,
                        progressStrokeWidth: 20,
                        textColor: AppColors.white,
                        textProgressColor: AppColors.white,
                        progressColors: const [
                          Color(0xFFEE3436),
                          Color(0xFFF3B71A),
                          Color.fromARGB(255, 247, 113, 115),
                        ],
                        textTitle: context.l10n
                            .translate('days_left')
                            .replaceAll(
                                '{0}', _daysLeft(currentPackage.value?.toDate)),
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
                            if (currentPackage.value?.totalVoice != null &&
                                currentPackage.value?.totalVoice != '0')
                              Expanded(
                                child: CardUsedSquare(
                                  title: context.l10n.translate('call'),
                                  date: context.l10n.translate('month'),
                                  description: context.l10n
                                      .translate('minutes_per_month')
                                      .replaceAll(
                                          '{0}',
                                          currentPackage.value?.totalVoice ??
                                              ''),
                                  used: int.tryParse(
                                          currentPackage.value?.remainVoice ??
                                              '0') ??
                                      0,
                                  total: int.tryParse(
                                          currentPackage.value?.totalVoice ??
                                              '0') ??
                                      0,
                                  icon: 'assets/icons/feat_call.svg',
                                ),
                              ),
                            SizedBox(
                              width: currentPackage.value?.totalSms != null &&
                                      currentPackage.value?.totalSms != '0'
                                  ? AppSpacing.md
                                  : 0,
                            ),
                            if (currentPackage.value?.totalSms != null &&
                                currentPackage.value?.totalSms != '0')
                              Expanded(
                                child: CardUsedSquare(
                                  title: context.l10n.translate('message'),
                                  date: context.l10n.translate('month'),
                                  description: context.l10n
                                      .translate('sms_per_month')
                                      .replaceAll(
                                          '{0}',
                                          currentPackage.value?.totalSms ??
                                              '0'),
                                  used: int.tryParse(
                                          currentPackage.value?.remainSms ??
                                              '0') ??
                                      0,
                                  total: int.tryParse(
                                          currentPackage.value?.totalSms ??
                                              '0') ??
                                      0,
                                  icon: 'assets/icons/feat_message.svg',
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: currentPackage.value?.totalSms !=
                                            null &&
                                        currentPackage.value?.totalSms != '0' &&
                                        currentPackage.value?.totalVoice !=
                                            null &&
                                        currentPackage.value?.totalVoice != '0'
                                    ? AppSpacing.md
                                    : 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.screenPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context.l10n
                                          .translate('hot_packages_detail'),
                                      style: AppTextStyles.heading,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pushNamed(
                                            AppRouter.listPackageSkyFi);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            context.l10n
                                                .translate('discover_packages'),
                                            style:
                                                AppTextStyles.button.copyWith(
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
                                  children: listOutStandingPackage
                                          .value.isNotEmpty
                                      ? listOutStandingPackage.value.map((pkg) {
                                          return PackageCard(
                                            package: pkg,
                                            margin: const EdgeInsets.only(
                                                right: 16),
                                            onTapDetail: () {
                                              context.pushNamed(
                                                  AppRouter.packageDetailSkyfi,
                                                  extra: {
                                                    'packageId': pkg.id.toInt(),
                                                  });
                                            },
                                            onTapRegister: () {
                                              context.pushNamed(
                                                  AppRouter.packageDetailSkyfi,
                                                  extra: {
                                                    'packageId': pkg.id.toInt(),
                                                    'isRegister': true,
                                                  });
                                            },
                                          );
                                        }).toList()
                                      : [
                                          Center(
                                            child: Text(context.l10n
                                                .translate('no_hot_packages')),
                                          ),
                                        ],
                                ),
                              ),
                            ],
                          ),
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
