import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/models/code_error_handle/code_error_handle.dart';
import '../../core/widgets/bottom_button.dart';
import '../../network/api.dart';
import '../../routers/routers.dart';
import '../../utilities/common.dart';
import 'models/check_sim/check_sim.dart';
import 'models/info_from_iccid/info_from_iccid.dart';
import 'models/info_from_iccid/result.dart';
import 'provider/save_log_dktt_provider.dart';
import 'widgets/phone_display_field.dart';
import 'widgets/serial_input_field.dart';

class InfoRegisScreen extends HookConsumerWidget {
  const InfoRegisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serialController = useTextEditingController(
      text: '', // 03120000431 // 03120000449
    );
    final msisdnController = useTextEditingController(
      text: '', // 0772269816 // 0772224443
    );
    final isLoading = useState(false);
    final isUpdateMsisdn = useState(true);
    final api = API();

    Future<void> _checkPermissionCamera() async {
      final permission = await Permission.camera.request();
      if (permission.isGranted) {
        print('permission camera granted');
        // Either the permission was already granted before or the user just granted it.
      } else {
        // The permission was denied, either just once or permanently.
        Common.showToast(
            'Vui lòng cấp quyền truy cập camera để sử dụng tính năng này',
            context);
      }
    }

    Future<Object?> getInfoFromIccid(String iccid) async {
      try {
        // Show loading
        Common.loadingWithContext(context, show: true);

        final result = await api.post(
          '/bss/videocall/get-info-from-iccd',
          data: {
            'barcode': iccid,
          },
        );

        final response = result.data as Map<String, dynamic>;
        final statusCode = result.statusCode;

        // Check status code first
        if (statusCode == 200) {
          final codeErrorHandle = CodeErrorHandle.fromJson(response);

          // If code == 200, return InfoFromIccid result
          if (codeErrorHandle.code == 200) {
            final infoFromIccid = InfoFromIccid.fromJson(response);
            return infoFromIccid.result;
          }
          // If code == 400, return CodeErrorHandle
          else if (codeErrorHandle.code == 400) {
            return codeErrorHandle;
          }
          // For other codes, return CodeErrorHandle
          else {
            return codeErrorHandle;
          }
        } else {
          // If status code is not 200, create error response
          return CodeErrorHandle(
            code: statusCode,
            message: 'Lỗi kết nối server',
          );
        }
      } catch (e) {
        Common.showToast('Đã có lỗi xảy ra', context);
        return null;
      } finally {
        // Hide loading
        Common.loadingWithContext(context, show: false);
      }
    }

    Future<void> _onScanBarcode() async {
      isUpdateMsisdn.value = true;
      final result = await context.pushNamed<String>(AppRouter.scanBarcode);
      print("result $result");
      if (result != null) {
        final infoFromIccid = await getInfoFromIccid(result);
        if (infoFromIccid != null) {
          // Check if it's a successful result (InfoFromIccid result)
          if (infoFromIccid is! CodeErrorHandle) {
            // This means we got InfoFromIccid result (Result object)
            final info = infoFromIccid as Result;
            serialController.text =
                info.iccid!.substring(info.iccid!.length - 11) ?? '';
            msisdnController.text = info.msisdn ?? '';
            isUpdateMsisdn.value = false;
          } else {
            // This is a CodeErrorHandle (error case)
            final errorHandle = infoFromIccid;
            Common.showToast(
                errorHandle.message ?? 'Lỗi khi lấy thông tin từ ICCID',
                context);
          }
        }
      }
      print("serialController.text ${serialController.text}");
    }

    Future<void> _onCheckSim() async {
      try {
        isLoading.value = true;
        final result = await api.post(
          '/bss/videocall/check-sim-exist',
          data: {
            'iccid': serialController.text,
            "msisdn": msisdnController.text,
          },
        );
        // Common.startLoading(context);
        final response = CheckSim.fromJson(result.data);
        if (response.code == 200) {
          if (response.result?.checkExist == true) {
            Common.showDialogConfirm(
              context,
              'Thông báo',
              'Số thuê bao ${msisdnController.text} của Bạn đăng ký thông tin chưa thành công. Bạn có muốn tiếp tục cuộc gọi với SkyFi không?',
              () {
                context.pop();
                // open start video call
                context.pushNamed(AppRouter.startVideoCall, extra: {
                  'id': response.result?.callId,
                  'phone': msisdnController.text,
                });
              },
              () {
                ref
                    .read(saveLogDkttNotifierProvider.notifier)
                    .setImsi(response.result?.imsi);
                ref
                    .read(saveLogDkttNotifierProvider.notifier)
                    .setPhone(msisdnController.text);
                ref
                    .read(saveLogDkttNotifierProvider.notifier)
                    .setSeri(response.result?.iccid);
                context.pop();
                context.pushNamed(AppRouter.prepareChipCard);
              },
              primaryButtonText: 'Gọi lại',
              secondaryButtonText: 'Chụp lại',
            );
            return;
          }

          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setImsi(response.result?.imsi);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setPhone(msisdnController.text);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setSeri(response.result?.iccid);
          context.pushNamed(AppRouter.prepareChipCard);
        } else {
          Common.showToast(response.message ?? 'Lỗi khi kiểm tra sim', context);
        }
      } catch (e) {
        Common.showToast('Đã có lỗi xảy ra', context);
      } finally {
        isLoading.value = false;
        // Common.stopLoading();
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.text,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Kích hoạt SIM',
            style: AppTextStyles.title.copyWith(
              color: AppColors.text,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: true,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin SIM',
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      PhoneDisplayField(
                        label: 'Số thuê bao cần kích hoạt',
                        controller: msisdnController,
                        isEditable: isUpdateMsisdn.value,
                        onChanged: (value) {
                          msisdnController.text = value;
                        },
                        phoneNumber: msisdnController.text,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      SerialInputField(
                        controller: serialController,
                        onScanTap: _onScanBarcode,
                        onChanged: (value) {
                          serialController.text = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.xl,
          ),
          child: BottomButton(
            onPressed: () {
              if (msisdnController.text.length != 10) {
                Common.showToast('Số thuê bao phải có 10 chữ số', context);
                return;
              }

              if (serialController.text.length != 11) {
                Common.showToast('Số serial phải có 11 chữ số', context);
                return;
              }
              _onCheckSim();
            },
            text: isLoading.value ? 'Đang xử lý...' : 'Tiếp tục',
            textStyle: AppTextStyles.button.copyWith(color: AppColors.white),
            isLoading: isLoading.value,
          ),
        ),
      ),
    );
  }
}
