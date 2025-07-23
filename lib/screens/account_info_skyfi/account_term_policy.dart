import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/network/api.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:skyfi_sdk/screens/account_info_skyfi/account_list_pdf.dart';
import 'package:skyfi_sdk/screens/account_info_skyfi/widgets/menu_item.dart';

class AccountTermPolicy extends HookConsumerWidget {
  const AccountTermPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();

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
        title: const Text(
          'Điều khoản và chính sách',
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
                title: 'Chính sách bảo vệ dữ liệu cá nhân',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  checkTermAndCondition();
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url':
                          'https://skyfi.vn/vi/personal-data-protection-policy?src=app',
                      'title': 'Chính sách bảo vệ dữ liệu cá nhân',
                      'isCheckbox': true,
                    },
                  );
                },
              ),
              MenuItem(
                title: 'Chính sách hoàn tiền',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url': 'https://skyfi.vn/vi/refund-policy?src=app',
                      'title': 'Chính sách hoàn tiền',
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: 'Chính sách thanh toán',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url': 'https://skyfi.vn/vi/payment-policy?src=app',
                      'title': 'Chính sách thanh toán',
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: 'Điều khoản giao dịch chung',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url': 'https://skyfi.vn/vi/terms-and-conditions?src=app',
                      'title': 'Điều khoản giao dịch chung',
                      'isCheckbox': false,
                    },
                  );
                },
              ),
              MenuItem(
                title: 'Chính sách bảo mật và Cookies',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.webviewTermsSkyfi,
                    extra: {
                      'url': 'https://skyfi.vn/vi/cookies-policy?src=app',
                      'title': 'Chính sách bảo mật và Cookies',
                      'isCheckbox': false,
                    },
                  );
                },
                showDivider: false,
              ),
              MenuItem(
                title: 'Hợp đồng mẫu',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.accountListPdf,
                    extra: {
                      'items': [
                        ItemPdf(
                          title:
                              'Bản xác nhận thông tin thuê bao đăng ký dịch vụ viên thông di động mặt đất',
                          link:
                              'https://skyfi.vn/assets/document/sample-contract/BAN_XAC_NHAN_THONG_TIN_THUE_BAO.pdf',
                        ),
                        ItemPdf(
                          title:
                              'Hợp đồng cung cấp và sử dụng DV viên thông di động mặt đất',
                          link:
                              'https://skyfi.vn/assets/document/sample-contract/HOP_DONG_CUNG_CAP_VA_SU_DUNG_DICH_VU.pdf',
                        ),
                        ItemPdf(
                          title:
                              'BM01-Danh sách thuê bao đăng ký sử dụng DV viên thông',
                          link:
                              'https://skyfi.vn/assets/document/sample-contract/BIEU_MAU_01_DANH_SACH_THUE_BAO_KH_CA_NHAN_TU_THUE_BAO_THU_4_TRO.pdf',
                        ),
                        ItemPdf(
                          title:
                              'BM02-Danh sách thuê bao đăng ký sử dụng DV viên thông',
                          link:
                              'https://skyfi.vn/assets/document/sample-contract/BIEU_MAU_02_DANH_SACH_CA_NHAN_DUOC_GIAO_SU_DUNG_SO_THUE_BAO_KH.pdf',
                        ),
                        ItemPdf(
                          title: 'Biên bản chuyển quyền sử dụng DV viên thông',
                          link:
                              'https://skyfi.vn/assets/document/sample-contract/BIEN_BAN_CHUYEN_QUYEN_SU_DUNG.pdf',
                        ),
                      ],
                      'title': 'Hợp đồng mẫu',
                    },
                  );
                },
                showDivider: false,
              ),
              MenuItem(
                title: 'Quản lý chất lượng dịch vụ',
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  context.pushNamed(
                    AppRouter.accountListPdf,
                    extra: {
                      'items': [
                        ItemPdf(
                          title: 'Công bố CLDV_DV điện thoại trên mạng VTDĐ',
                          link:
                              'https://skyfi.vn/assets/document/service-quality-management/38_2025_Cong_bo_CLDV_DV_dien_thoai_tren_mang_VTDD.pdf',
                        ),
                        ItemPdf(
                          title:
                              'Công bố CLDV_Truy cập internet WCDMA, LTE, LTE',
                          link:
                              'https://skyfi.vn/assets/document/service-quality-management/39_2025_Cong_bo_CLDV_Truy_cap_internet_WCDMA_LTE_LTE_A.pdf',
                        ),
                        ItemPdf(
                          title:
                              'BAN TIEP NHAN CONG BO CLDV INTERNET DI DONG 2025',
                          link:
                              'https://skyfi.vn/assets/document/service-quality-management/BAN_TIEP_NHAN_CONG_BO_CLDV_INTERNET_DI_DONG_2025.pdf',
                        ),
                        ItemPdf(
                          title:
                              'BAN TIEP NHAN CONG BO CLDV THOAI DI DONG 2025',
                          link:
                              'https://skyfi.vn/assets/document/service-quality-management/BAN_TIEP_NHAN_CONG_BO_CLDV_THOAI_DI_DONG_2025.pdf',
                        ),
                      ],
                      'title': 'Quản lý chất lượng dịch vụ',
                    },
                  );
                },
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
