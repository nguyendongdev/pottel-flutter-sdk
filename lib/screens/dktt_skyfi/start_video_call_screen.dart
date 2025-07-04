import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/screens/video_call/RecordVideoScreen.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/outline_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../routers/routers.dart';

class StartVideoCallScreen extends StatelessWidget {
  const StartVideoCallScreen({
    super.key,
    required this.id,
    required this.phone,
  });
  final String id;
  final String phone;

  @override
  Widget build(BuildContext context) {
    print('id start video call: $id');
    print('phone start video call: $phone');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: const Text(
          'Hướng dẫn video call',
          style: AppTextStyles.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/img_agent.png',
                  width: 303,
                  height: 188,
                  fit: BoxFit.contain,
                  package: 'skyfi_sdk',
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Hướng dẫn thực hiện cuộc gọi Video',
              style: AppTextStyles.title.copyWith(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '● ',
                  style: AppTextStyles.body,
                ),
                Expanded(
                  child: Text(
                    'Thiết bị đang sử dụng có CAMERA ĐƯỢC CẤP QUYỀN',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '● ',
                  style: AppTextStyles.body,
                ),
                Expanded(
                  child: Text(
                    'Theo quy định của Bộ Thông tin truyền thông, để hoàn tất thủ tục đăng ký/cập nhật thông tin thuê bao, Bạn vui lòng thực hiện cuộc Video với tổng đài viên.',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            Text(
              '*Lưu ý: cấp quyền truy cập CAMERA cho thiết bị',
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlineButton(
                  height: 48,
                  text: 'Về trang chủ',
                  textStyle: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    context.pushNamed(AppRouter.homeSkyFiNew);
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                GradientButton(
                  height: 48,
                  text: 'Bắt đầu cuộc gọi Video',
                  onPressed: () async {
                    final result =
                        await context.push('/video-call-jitsi', extra: {
                      'msisdn': phone,
                      'serial': id,
                    });

                    // Xử lý data trả về từ VideoCallViewJitsiScreen
                    if (result != null && result is Map<String, dynamic>) {
                      final status = result['status'];
                      print('status: $status');
                      if (status == 'no-free-teller') {
                        // Hiển thị thông báo khi không có teller rảnh
                        if (context.mounted) {
                          print('message: ${result['message']}');
                          // SnackBarApp.showWarning(context,
                          //     message: result['message'] ??
                          //         'Không có teller nào rảnh');

                          Common.showDialogConfirm(
                            context,
                            'Thông báo',
                            result['message'] ?? 'Không có teller nào rảnh',
                            () {
                              context.pop();
                              context.pushNamed(AppRouter.recordVideo, extra: {
                                'idCall': id,
                                'phoneNumber': phone,
                                'type': EnumServiceSim.activity,
                              });
                            },
                            () {
                              context.pop();
                            },
                            primaryButtonText: 'Quay Video',
                            secondaryButtonText: 'Đóng',
                          );
                          return;
                        }
                      } else if (status == 'connecting-teller') {
                        // Xử lý khi đang kết nối teller
                        if (context.mounted) {
                          SnackBarApp.showWarning(context,
                              message: result['message'] ??
                                  'Đang kết nối với teller...');
                        }
                      } else if (status == 'admin-stop-call') {
                        // Xử lý khi admin dừng cuộc gọi
                        if (context.mounted) {
                          SnackBarApp.showError(context,
                              message:
                                  result['message'] ?? 'Cuộc gọi đã được tắt');
                        }
                      } else if (status == 'client-end-call') {
                        // Xử lý khi client kết thúc cuộc gọi
                        if (context.mounted) {
                          SnackBarApp.showSuccess(context,
                              message:
                                  result['message'] ?? 'Cuộc gọi đã kết thúc');
                        }
                      }
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
