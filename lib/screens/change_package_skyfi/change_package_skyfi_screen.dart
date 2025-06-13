import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/PopupCenterCard.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../routers/routers.dart';
import '../home_skyfi/provider/user_info_provider.dart';
import 'provider/package_provider.dart';
import 'repository/package_repository.dart';
import 'widgets/confirmation_dialog.dart';
import 'widgets/package_card.dart';

class ChangePackageSkyFiScreen extends ConsumerWidget {
  const ChangePackageSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages = ref.watch(packageNotifierProvider);
    final selectedPackage =
        ref.watch(packageNotifierProvider.notifier).selectedPackage;
    final userInfo = ref.watch(userInfoProviderProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Đổi gói cước',
          style: AppTextStyles.title,
        ),
      ),
      body: packages.when(
        data: (packages) => ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: packages.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.lg),
          itemBuilder: (context, index) {
            final package = packages[index];
            return PackageCard(
              package: package,
              onTap: () {
                ref
                    .read(packageNotifierProvider.notifier)
                    .selectPackage(package.name);
              },
            );
          },
        ),
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
          top: AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: GradientButton(
          onPressed: () {
            if (selectedPackage != null) {
              ref
                  .read(packageRepositoryProvider)
                  .checkPackageRegister(
                    userInfo.msisdn ?? '',
                    selectedPackage.name,
                  )
                  .then((value) {
                print("value: ${value.toString()}");
                if (value['code'] == 400) {
                  showDialog(
                    context: context,
                    builder: (context) => PopupCenterCard(
                      onPrimaryButtonTap: () => {
                        Navigator.of(context).pop(),
                        context.pushNamed(AppRouter.topupSkyFi),
                      },
                      onSecondaryButtonTap: () => Navigator.of(context).pop(),
                      title: 'Thông báo',
                      description: value['message'],
                      primaryButtonText: 'Nạp tiền',
                      secondaryButtonText: 'Đóng',
                    ),
                  );
                } else if (value['code'] == 201) {
                  print("value: ${value.toString()}");
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmationDialog(
                      package: selectedPackage,
                      onConfirm: () {
                        ref
                            .read(packageRepositoryProvider)
                            .registerPackage(
                              userInfo.msisdn ?? '',
                              selectedPackage.name,
                            )
                            .then((value) {
                          if (value['code'] == 200) {
                            SnackBarApp.showSuccess(context,
                                message: value['message']);
                            context.pop();
                          } else {
                            SnackBarApp.showError(context,
                                message: value['message']);
                          }
                        });
                      },
                      onCancel: () {
                        Navigator.of(context).pop();
                      },
                      msisdn: userInfo.msisdn ?? '',
                      // result is array
                      leftDay: value['result'][0]['toDate'],
                    ),
                  );
                }
              });
            }
          },
          text: 'Đổi gói',
          height: 48,
          disabled: selectedPackage?.isSelected == false,
          textStyle: AppTextStyles.button.copyWith(
            color: selectedPackage?.isSelected == false
                ? AppColors.textLight
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
