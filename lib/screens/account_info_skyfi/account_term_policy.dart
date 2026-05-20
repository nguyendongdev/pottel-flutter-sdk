import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/network/api.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:pottel_sdk/screens/account_info_skyfi/account_list_pdf.dart';
import 'package:pottel_sdk/screens/account_info_skyfi/widgets/menu_item.dart';

class AccountTermPolicy extends HookConsumerWidget {
  const AccountTermPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();
    String languageCode = context.l10n.locale.languageCode;
    checkTermAndCondition() async {
      try {
        final response = await api.get('/bss/app/confirm-terms-policy');
        print('Response: ${response.data}');
      } catch (e) {}
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          context.translate('price_policy'),
          style: AppTextStyles.heading,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              MenuItem(
                title: context.translate('personal_data_protection_policy'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  checkTermAndCondition();
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://pottel.dev/${languageCode}/personal-data-protection-policy?src=app',
                      'title':
                          context.translate('personal_data_protection_policy'),
                      'isCheckbox': true,
                    },
                  );
                },
              ),
              MenuItem(
                title: context.translate('refund_policy'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://pottel.dev/${languageCode}/refund-policy?src=app',
                      'title': context.translate('refund_policy'),
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: context.translate('payment_policy'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://pottel.dev/${languageCode}/payment-policy?src=app',
                      'title': context.translate('payment_policy'),
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: context.translate('general_transaction_terms'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://pottel.dev/${languageCode}/terms-and-conditions?src=app',
                      'title': context.translate('general_transaction_terms'),
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: context.translate('cookies_policy'),
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://pottel.dev/${languageCode}/cookies-policy?src=app',
                      'title': context.translate('cookies_policy'),
                      'isCheckbox': false,
                    },
                  );
                },
                showDivider: false,
              ),
              // MenuItem(
              //   title: context.translate('sample_contract'),
              //   iconPath: 'assets/icons/file-edit.svg',
              //   onTap: () {
              //     context.pushNamed(
              //       AppRouter.accountListPdf,
              //       extra: {
              //         'items': [
              //           ItemPdf(
              //             title: context.translate('contract_1'),
              //             link:
              //                 'https://pottel.dev/assets/document/sample-contract/BAN_XAC_NHAN_THONG_TIN_THUE_BAO.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('contract_2'),
              //             link:
              //                 'https://pottel.dev/assets/document/sample-contract/HOP_DONG_CUNG_CAP_VA_SU_DUNG_DICH_VU.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('contract_3'),
              //             link:
              //                 'https://pottel.dev/assets/document/sample-contract/BIEU_MAU_01_DANH_SACH_THUE_BAO_KH_CA_NHAN_TU_THUE_BAO_THU_4_TRO.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('contract_4'),
              //             link:
              //                 'https://pottel.dev/assets/document/sample-contract/BIEU_MAU_02_DANH_SACH_CA_NHAN_DUOC_GIAO_SU_DUNG_SO_THUE_BAO_KH.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('contract_5'),
              //             link:
              //                 'https://pottel.dev/assets/document/sample-contract/BIEN_BAN_CHUYEN_QUYEN_SU_DUNG.pdf',
              //           ),
              //         ],
              //         'title': context.translate('sample_contract'),
              //       },
              //     );
              //   },
              //   showDivider: false,
              // ),
              // MenuItem(
              //   title: context.translate('service_quality_management'),
              //   iconPath: 'assets/icons/file-edit.svg',
              //   onTap: () {
              //     context.pushNamed(
              //       AppRouter.accountListPdf,
              //       extra: {
              //         'items': [
              //           ItemPdf(
              //             title: context.translate('service_1'),
              //             link:
              //                 'https://pottel.dev/assets/document/service-quality-management/38_2025_Cong_bo_CLDV_DV_dien_thoai_tren_mang_VTDD.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('service_2'),
              //             link:
              //                 'https://pottel.dev/assets/document/service-quality-management/39_2025_Cong_bo_CLDV_Truy_cap_internet_WCDMA_LTE_LTE_A.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('service_3'),
              //             link:
              //                 'https://pottel.dev/assets/document/service-quality-management/BAN_TIEP_NHAN_CONG_BO_CLDV_INTERNET_DI_DONG_2025.pdf',
              //           ),
              //           ItemPdf(
              //             title: context.translate('service_4'),
              //             link:
              //                 'https://pottel.dev/assets/document/service-quality-management/BAN_TIEP_NHAN_CONG_BO_CLDV_THOAI_DI_DONG_2025.pdf',
              //           ),
              //         ],
              //         'title': context.translate('service_quality_management'),
              //       },
              //     );
              //   },
              //   showDivider: false,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
