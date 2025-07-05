import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:signature/signature.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/provider/ekyc_provider.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/provider/save_log_dktt_provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_checkbox.dart';
import '../../core/widgets/bottom_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../network/api.dart';
import '../../routers/routers.dart';
import '../../utilities/common.dart';
import 'models/save_log_respone/save_log_respone.dart';
import 'widgets/step_indicator.dart';

class PreviewContactScreen extends HookConsumerWidget {
  const PreviewContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberIdRegis = ref.watch(numberIdRegisProvider);
    final isLoading = useState(false);
    API api = API();
    final isAgree = useState(false);

    final _controller = useMemoized(() => SignatureController(
          penStrokeWidth: 3,
          penColor: AppColors.blue,
          exportPenColor: AppColors.blue,
          exportBackgroundColor: AppColors.white,
          onDrawStart: () => print('onDrawStart called!'),
          onDrawEnd: () => print('onDrawEnd called!'),
        ));

    void onGetContactDetail() async {
      try {
        final image = await _controller.toPngBytes();
        if (image != null) {
          final base64 = base64Encode(image!);
          ref.read(saveLogDkttNotifierProvider.notifier).setImg4(base64);
        }
        Common.startLoadingDialog(context, 'Đang lấy thông tin hợp đồng...');
        final response = await api.post(
          '/bss/videocall/get_img4_app',
          data: ref.read(saveLogDkttNotifierProvider).toJson(),
        );
        final ing4 = response.data['result'];
        if (ing4 != null) {
          context.pushNamed(AppRouter.contactDetail, extra: ing4);
        } else {
          SnackBarApp.showError(context, message: 'Lỗi xem thông tin hợp đồng');
        }
        Common.stopLoadingDialog(context);
      } catch (e) {
        Common.stopLoadingDialog(context);
        SnackBarApp.showError(context, message: 'Lỗi xem thông tin hợp đồng');
      }
    }

    void saveLog() async {
      try {
        // Common.startLoadingDialog(context, 'Đang lưu thông tin...');
        isLoading.value = true;
        final response = await api.post(
          '/bss/videocall/save-log-video-call',
          data: ref.read(saveLogDkttNotifierProvider).toJson(),
        );
        final data = SaveLogRespone.fromJson(response.data);
        if (data.code == 200) {
          context.pushNamed(AppRouter.startVideoCall, extra: {
            'id': data.result?.id,
            'phone': data.result?.phone,
          });
          return;
        } else {
          // SnackBarApp.showError(context, message: data.message ?? '');
          throw Exception(data.message ?? 'Lỗi');
        }
      } catch (e) {
        print("error: $e");
        SnackBarApp.showError(context, message: e.toString());
      } finally {
        isLoading.value = false;
        // Common.stopLoadingDialog(context);
      }
    }

    useEffect(() {
      _controller.clear();
      return () => _controller.dispose();
    }, []);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const StepIndicator(
          total: 4,
          current: 4,
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ký hợp đồng',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.text,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppCheckbox(
                    value: isAgree.value,
                    onChanged: (value) {
                      isAgree.value = value ?? false;
                    },
                    text: 'Tôi hiểu và đồng ý với các điều kiện dưới đây:',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text(
                      '● ',
                      style: AppTextStyles.small,
                    ),
                    Expanded(
                      child: Text(
                        'Việc đăng ký thông tin thuê bao trên hệ thống sẽ chỉ được thực hiện sau khi cung cấp đầy đủ các giấy tờ, thông tin theo quy định của pháp luật.',
                        style: AppTextStyles.small.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: AppSpacing.md),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text(
                      '● ',
                      style: AppTextStyles.small,
                    ),
                    Expanded(
                      child: Text(
                        'Trong quá trình chờ và sau khi hoàn thành đăng ký thông tin trên hệ thống, nếu có xảy ra bất kỳ khiếu kiện, tranh chấp nào liên quan đến số thuê bao trên, tôi đồng ý để SkyFi thu hồi số thuê bao để giải quyết khiếu nại, đồng thời tôi cam kết sẽ phối hợp SkyFi để giải quyết và chịu hoàn toàn trách nhiệm trước pháp luật.',
                        style: AppTextStyles.small.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: AppSpacing.md),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text(
                      '● ',
                      style: AppTextStyles.small,
                    ),
                    Expanded(
                      child: Text(
                        'Các thông tin và chữ ký của bạn sẽ được tự đồng điền vào Phiếu xác nhận thông tin thuê bao dưới đây.',
                        style: AppTextStyles.small.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: AppSpacing.md),
                  GestureDetector(
                    onTap: () {
                      onGetContactDetail();
                      // context.pushNamed(AppRouter.contactDetail, extra: "");
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Vui lòng ký tên của bạn tại phía dưới cùng của hợp đồng và kiểm tra lại thông tin hợp đồng',
                              style: AppTextStyles.label.copyWith(
                                color: AppColors.text,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: ' Tại đây!',
                              style: AppTextStyles.label.copyWith(
                                color: AppColors.blue,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Signature box
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 390,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background,
                ),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/feat_signature.svg',
                            width: 36,
                            height: 36,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Chữ ký khách hàng',
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.text,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              _controller.clear();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Signature(
                        backgroundColor: AppColors.white,
                        controller: _controller,
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              BottomButton(
                isLoading: isLoading.value,
                onPressed: () async {
                  final image = await _controller.toPngBytes();
                  if (image == null) {
                    SnackBarApp.showWarning(context,
                        message: 'Vui lòng ký vào ô chữ ký');
                    return;
                  }
                  if (!isAgree.value) {
                    SnackBarApp.showWarning(context,
                        message: 'Vui lòng đọc và đồng ý với các điều kiện');
                    return;
                  }
                  final base64 = base64Encode(image!);
                  ref
                      .read(saveLogDkttNotifierProvider.notifier)
                      .setImg4(base64);
                  if (numberIdRegis == 0) {
                    saveLog();
                  } else {
                    Navigator.of(context).pushNamed(AppRouter.verifyOtp);
                    return;
                  }
                },
                text:
                    numberIdRegis == 0 ? 'Bắt đầu cuộc gọi Video' : 'Tiếp tục',
                textStyle: AppTextStyles.button.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
