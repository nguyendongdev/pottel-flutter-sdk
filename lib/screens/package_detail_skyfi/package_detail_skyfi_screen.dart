import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/network/api.dart';
import 'package:skyfi_sdk/screens/package_detail_skyfi/models/package_model_detail/result.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/widgets/PopupCenterCard.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../l10n/localization_extension.dart';
import '../../routers/routers.dart';
import '../../utilities/common.dart';
import '../change_package_skyfi/models/package_model.dart'
    as ChangePackageModel;
import '../change_package_skyfi/widgets/confirmation_dialog.dart';
import '../home_skyfi/provider/login_provider.dart';
import '../list_package_skyfi/widgets/modal_input_otp.dart';
import '../list_package_skyfi/widgets/modal_input_phone.dart';
import 'provider/package_detail_provider.dart';
import 'widgets/package_benefit_item.dart';

class PackageDetailSkyfiScreen extends HookConsumerWidget {
  final int packageId;
  final bool isRegister;

  const PackageDetailSkyfiScreen({
    super.key,
    required this.packageId,
    required this.isRegister,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = ref.watch(currentPhoneProvider);
    final isLogin = ref.watch(isLoginProvider);

    final api = API();
    final isLoading = useState(false);
    final phoneRegister = useState(phone);
    final packageCode = useState('');

    final packageDetailAsync = ref.watch(packageDetailProvider(packageId));

    void onRegisterPackage(String phone, String packageCode,
        {String? otp}) async {
      try {
        isLoading.value = true;
        Common.loadingWithContext(context, show: true);
        final response = await api.post('/bss/app/register-package', data: {
          "msisdn": phone,
          "packageCode": packageCode,
          "otp": otp ?? '',
        });
        if (response.data['code'] == 200) {
          SnackBarApp.showSuccess(context, message: response.data['message']);
        } else {
          // SnackBarApp.showError(context, message: response.data['message']);
          Common.showAlertDialog(context, context.l10n.translate('error_title'),
              response.data['message'], null);
        }
      } catch (e) {
        Common.showAlertDialog(context, context.l10n.translate('error_title'),
            e.toString(), () {});
        print(e);
      } finally {
        isLoading.value = false;
        Common.loadingWithContext(context, show: false);
      }
    }

    Future<void> onPressedContinueOtp(String phone, String packageCode) async {
      phoneRegister.value = phone;
      try {
        isLoading.value = true;
        Common.loadingWithContext(context, show: true);
        final response =
            await api.post('/bss/app/send-otp-register-package', data: {
          "msisdn": phoneRegister.value,
        });
        print('response: ${response.data}');
        if (response.data['code'] == 200) {
          SnackBarApp.showSuccess(context, message: response.data['message']);
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => Dialog(
                    insetPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                    ),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                    ),
                    child: ModalInputOtp(
                      phone: phoneRegister.value,
                      onPressedContinue: (otp) {
                        onRegisterPackage(phoneRegister.value, packageCode,
                            otp: otp);
                        Navigator.of(_).pop();
                      },
                      onPressedResendOtp: () async {
                        await onPressedContinueOtp(
                            phoneRegister.value, packageCode);
                      },
                    ),
                  ));
          return;
        }
        return SnackBarApp.showError(context,
            message: response.data['message']);
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
        Common.loadingWithContext(context, show: false);
      }
    }

    Future<void> onPressedContinue(String phone, String packageCode) async {
      try {
        isLoading.value = true;
        Common.loadingWithContext(context, show: true);
        final response =
            await api.post('/bss/app/check-package-register', data: {
          "msisdn": phone,
          "packageCode": packageCode,
        });
        final data = response.data;

        if (data['code'] == 400) {
          showDialog(
            context: context,
            builder: (_) => PopupCenterCard(
              title: context.l10n.translate('notification_title'),
              description: data['message'],
              secondaryButtonText: context.l10n.translate('topup_money_button'),
              onPrimaryButtonTap: () {},
              onSecondaryButtonTap: () =>
                  {context.pushNamed(AppRouter.topupSkyFi)},
            ),
          );
          return;
        }
        if (data['code'] == 201) {
          showDialog(
            context: context,
            builder: (context) => ConfirmationDialog(
              package: ChangePackageModel.PackageModel(
                code: "",
                name: data['result'][0]['packageName'],
                price: 0,
                description: [],
                dataPerDay: 0,
                salePrice: 0,
                isSelected: true,
              ),
              onConfirm: () {
                isLogin
                    ? onRegisterPackage(phone, packageCode)
                    : onPressedContinueOtp(phone, packageCode);
                Navigator.of(context).pop();
              },
              onCancel: () {
                Navigator.of(context).pop();
              },
              msisdn: phone,
              leftDay: data['result'][0]['toDate'],
            ),
          );
          return;
        }

        if (data['code'] == 200) {
          // phone
          if (isLogin) {
            onRegisterPackage(phone, packageCode);
          } else {
            onPressedContinueOtp(phone, packageCode);
          }
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
        Common.loadingWithContext(context, show: false);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(context.l10n.translate('package_detail_title'),
            style: AppTextStyles.heading.copyWith(fontSize: 16)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        top: false,
        child: packageDetailAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFE69818),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.translate('data_load_error_package'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: error.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          data: (response) {
            final packageDetail = response.result;
            packageCode.value = packageDetail?.code ?? '';
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Package name section
                        _buildPackageNameSection(context, packageDetail!),

                        const SizedBox(height: 24),

                        // Benefits list
                        _buildBenefitsList(context, packageDetail),

                        const SizedBox(height: 24),

                        // Package details
                        _buildPackageDetails(packageDetail),
                        const SizedBox(height: 24),
                        // Bottom section with price and register button
                        _buildBottomSection(
                          context,
                          packageDetail,
                          onPressedContinue,
                          phoneRegister.value,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPackageNameSection(BuildContext context, Result packageDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.translate('package_label'),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              packageDetail.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181818),
              ),
            ),
            const Text(
              ' - ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181818),
              ),
            ),
            Text(
              '${packageDetail.validityDay.toString()} ${context.l10n.translate('days_unit_package')}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181818),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBenefitsList(BuildContext context, Result packageDetail) {
    return Row(
      children: [
        // Data benefit
        Expanded(
          child: PackageBenefitItem(
            icon: 'assets/icons/dashboard-speed.svg',
            iconColor: const Color(0xFFB40005),
            title: context.l10n.translate('free_label'),
            subtitle:
                '${packageDetail.dataPerDay?.toStringAsFixed(0) ?? '0'}${context.l10n.translate('gb_per_day_unit')}',
          ),
        ),

        const SizedBox(width: 8),

        // SMS benefit
        Expanded(
          child: PackageBenefitItem(
            icon: "assets/icons/message-home.svg",
            iconColor: const Color(0xFFB40005),
            title: context.l10n.translate('free_label'),
            subtitle:
                '${packageDetail.freeSms?.toString() ?? '0'} ${context.l10n.translate('sms_unit')}',
          ),
        ),

        const SizedBox(width: 8),

        // Call benefit
        Expanded(
          child: PackageBenefitItem(
            icon: "assets/icons/phone-home.svg",
            iconColor: const Color(0xFFB40005),
            title: context.l10n.translate('free_label'),
            subtitle:
                '${packageDetail.freeCallMinute?.toString() ?? '0'} ${context.l10n.translate('minutes_unit')}',
          ),
        ),
      ],
    );
  }

  Widget _buildPackageDetails(Result packageDetail) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HtmlWidget(packageDetail.brief ?? ''),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, Result packageDetail,
      Function onPressedContinue, String phoneRegister) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Price information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${packageDetail.salePrice?.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} VND',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE60A32),
                      ),
                    ),
                    Text(
                      context.l10n.translate('per_days_label').replaceAll(
                          '{0}', packageDetail.validityDay.toString()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5C5C5C),
                      ),
                    ),
                    const Spacer(),
                    if (isRegister)
                      GradientButton(
                        text: context.l10n.translate('register_package'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              child: ModalInputPhone(
                                phone: phoneRegister,
                                l10n: context.l10n,
                                onPressedContinue: (phone) {
                                  onPressedContinue(
                                      phone, packageDetail.code ?? '');
                                },
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                if (packageDetail.price != packageDetail.salePrice)
                  Text(
                    '${packageDetail.price?.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} VND',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA1A1A1),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
