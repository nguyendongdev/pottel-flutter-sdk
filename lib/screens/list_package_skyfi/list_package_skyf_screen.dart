import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/PopupCenterCard.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../network/api.dart';
import '../../utilities/common.dart';
import '../change_package_skyfi/widgets/confirmation_dialog.dart';
import '../home_skyfi/models/outstanding_pakage.dart';
import '../home_skyfi/provider/login_provider.dart';
import '../home_skyfi/widgets/package_card.dart';
import '../home_skyfi/widgets/package_insite.dart';
import 'widgets/modal_input_otp.dart';
import 'widgets/modal_input_phone.dart';
import 'widgets/modal_money_fail.dart';
import 'widgets/search_package.dart';
import 'widgets/tab_item.dart';
import '../change_package_skyfi/models/package_model.dart'
    as ChangePackageModel;

class ListPackageSkyFiScreen extends HookConsumerWidget {
  const ListPackageSkyFiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = ref.watch(currentPhoneProvider);
    final isLogin = ref.watch(isLoginProvider);
    final packages = useState<List<PackageModel>>([]);
    final packSelected = useState<String>('');
    final selectedTab = useState<String>('month');
    final api = API();
    final isLoading = useState(false);
    final page = useState(1);
    final pageSize = useState(10);
    final search = useState('');
    final phoneRegister = useState(phone);

    void fetchOutStandingPackage() async {
      try {
        isLoading.value = true;
        final response = await api.post('/bss/app/get-packages', data: {
          "page": page.value,
          "pageSize": pageSize.value,
          "filters": {
            "search": search.value,
            "is_main": selectedTab.value == 'supplement' ? 0 : 1,
            "cycle": selectedTab.value == 'supplement'
                ? ''
                : selectedTab.value == 'month'
                    ? 'M'
                    : 'D'
          }
        });
        final outStandingPackage =
            OutStandingPackageResponse.fromJson(response.data);
        if (outStandingPackage.code == 200) {
          packages.value = outStandingPackage.result;
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      fetchOutStandingPackage();
      return null;
    }, [page.value, pageSize.value, search.value, selectedTab.value]);

    void onRegisterPackage(String phone, String packageCode,
        {String? otp}) async {
      try {
        isLoading.value = true;
        print(phone);
        print(packageCode);
        final response = await api.post('/bss/app/register-package', data: {
          "msisdn": phone,
          "packageCode": packageCode,
          "otp": otp ?? '',
        });
        if (response.data['code'] == 200) {
          SnackBarApp.showSuccess(context, message: response.data['message']);
        } else {
          Common.showAlertDialog(
              context, 'Lỗi', response.data['message'], null);
        }
      } catch (e) {
        Common.showAlertDialog(context, 'Lỗi', e.toString(), null);
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> onPressedContinueOtp(String phone) async {
      phoneRegister.value = phone;
      try {
        isLoading.value = true;
        final response =
            await api.post('/bss/app/send-otp-register-package', data: {
          "msisdn": phoneRegister.value,
        });
        if (response.data['code'] == 200) {
          SnackBarApp.showSuccess(context, message: response.data['message']);
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => Dialog(
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
                        onRegisterPackage(
                            phoneRegister.value, packSelected.value,
                            otp: otp);
                      },
                      onPressedResendOtp: () async {
                        await onPressedContinueOtp(phoneRegister.value);
                      },
                    ),
                  ));
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> onPressedContinue(
      String phone, {
      String? otp,
    }) async {
      phoneRegister.value = phone;
      try {
        isLoading.value = true;
        final response =
            await api.post('/bss/app/check-package-register', data: {
          "msisdn": phoneRegister.value,
          "packageCode": packSelected.value,
        });
        final data = response.data;

        if (data['code'] == 400) {
          showDialog(
            context: context,
            builder: (context) => PopupCenterCard(
              title: 'Thông báo',
              description: data['message'],
              secondaryButtonText: 'Nạp tiền',
              onPrimaryButtonTap: () => Navigator.of(context).pop(),
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
                if (isLogin) {
                  onRegisterPackage(phoneRegister.value, packSelected.value);
                } else {
                  onPressedContinueOtp(phoneRegister.value);
                }
                context.pop();
              },
              onCancel: () {
                context.pop();
              },
              msisdn: phoneRegister.value,
              leftDay: data['result'][0]['toDate'],
            ),
          );
          return;
        }

        if (data['code'] == 200) {
          if (isLogin) {
            onRegisterPackage(
              phoneRegister.value,
              packSelected.value,
            );
          } else {
            onPressedContinueOtp(phoneRegister.value);
          }
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text(
          'Danh sách gói cước',
          style: AppTextStyles.title,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TabItem(
                    title: 'Gói tháng',
                    isSelected: selectedTab.value == 'month',
                    onTap: () => selectedTab.value = 'month'),
                TabItem(
                    title: 'Gói ngày',
                    isSelected: selectedTab.value == 'day',
                    onTap: () => selectedTab.value = 'day'),
                TabItem(
                    title: 'Gói bổ sung',
                    isSelected: selectedTab.value == 'supplement',
                    onTap: () => selectedTab.value = 'supplement'),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SearchPackage(
              onChanged: (value) {
                search.value = value;
              },
            ),
            isLoading.value
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: RefreshIndicator(
                    onRefresh: () async {
                      page.value = 1;
                      fetchOutStandingPackage();
                    },
                    child: packages.value.isEmpty
                        ? const Center(
                            child: Text(
                              'Không có dữ liệu',
                              style: AppTextStyles.body,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenPadding,
                              vertical: AppSpacing.md,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: packages.value.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                PackageInsite(
                                  package: packages.value[index],
                                  onTapRegister: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: ModalInputPhone(
                                          phone: phoneRegister.value,
                                          onPressedContinue: (phone) {
                                            packSelected.value =
                                                packages.value[index].code;
                                            onPressedContinue(phone);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: AppSpacing.sm,
                            ),
                            physics: const BouncingScrollPhysics(),
                          ),
                  )),
          ],
        ),
      ),
    );
  }
}
