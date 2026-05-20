import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:signature/signature.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/modals/modalWebview.dart';
import 'package:pottel_sdk/screens/account_info_skyfi/account_list_pdf.dart';
import 'package:pottel_sdk/screens/dktt_skyfi/provider/ekyc_provider.dart';
import 'package:pottel_sdk/screens/dktt_skyfi/provider/save_log_dktt_provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_checkbox.dart';
import '../../core/widgets/bottom_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../network/api.dart';
import '../../routers/routers.dart';
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
      if (isLoading.value) return;
      isLoading.value = true;
      try {
        final image = await _controller.toPngBytes();
        if (image != null) {
          final base64 = base64Encode(image!);
          ref.read(saveLogDkttNotifierProvider.notifier).setImg4(base64);
        }
        // Common.startLoadingDialog(context, 'Đang lấy thông tin hợp đồng...');
        final response = await api.post(
          '/bss/videocall/get_img4_app',
          data: ref.read(saveLogDkttNotifierProvider).toJson(),
        );
        isLoading.value = false;
        final ing4 = response.data['result'];
        if (ing4 != null) {
          context.pushNamed(AppRouter.contactDetail, extra: ing4);
        } else {
          SnackBarApp.showError(context,
              message: context.l10n.translate('contract_info_error'));
        }
        // Common.stopLoadingDialog(context);
      } catch (e) {
        isLoading.value = false;
        // Common.stopLoadingDialog(context);
        SnackBarApp.showError(context,
            message: context.l10n.translate('contract_view_error'));
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
          throw Exception(data.message ?? context.l10n.translate('error_dktt'));
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
                    context.l10n.translate('sign_contract'),
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
                    text: context.l10n.translate('agree_to_terms'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text(
                      '● ',
                      style: AppTextStyles.small,
                    ),
                    Expanded(
                      child: Text(
                        context.l10n
                            .translate('subscription_registration_info'),
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
                        context.l10n.translate('dispute_resolution_agreement'),
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
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: context.l10n
                                  .translate('agree_terms_conditions')
                                  .split('#')[0],
                              style: AppTextStyles.small.copyWith(
                                color: AppColors.text,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: context.l10n
                                  .translate('agree_terms_conditions')
                                  .split('#')[1],
                              style: AppTextStyles.small.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.red),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  WebViewModal.showWebContent(
                                    context: context,
                                    url:
                                        'https://pottel.dev/vi/terms-and-conditions?src=app',
                                    title: 'Điều khoản & Điều kiện ',
                                  );
                                },
                            ),
                          ],
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
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: context.l10n
                                  .translate('auto_fill_info_notice')
                                  .split('#')[0],
                              style: AppTextStyles.small.copyWith(
                                color: AppColors.text,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: context.l10n
                                  .translate('auto_fill_info_notice')
                                  .split('#')[1],
                              style: AppTextStyles.small.copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showPdfViewer(
                                    context,
                                    'https://pottel.dev/assets/document/dktt/GT_Chap_thuan_xu_ly_du_lieu_ca_nhan.pdf',
                                    title:
                                        'Giấy tờ chấp thuận xử lý dữ liệu cá nhân',
                                  );
                                },
                            ),
                          ],
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
                              text: context.l10n
                                  .translate('sign_and_check_contract'),
                              style: AppTextStyles.label.copyWith(
                                color: AppColors.text,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: context.l10n.translate('here_link'),
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
                            context.l10n.translate('customer_signature'),
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
                        message: context.l10n.translate('please_sign_in_box'));
                    return;
                  }
                  if (!isAgree.value) {
                    SnackBarApp.showWarning(context,
                        message:
                            context.l10n.translate('please_read_and_agree'));
                    return;
                  }
                  final base64 = base64Encode(image!);
                  ref
                      .read(saveLogDkttNotifierProvider.notifier)
                      .setImg4(base64);
                  if (numberIdRegis == 0) {
                    saveLog();
                  } else {
                    // Navigator.of(context).pushNamed(AppRouter.verifyOtp);
                    context.pushNamed(AppRouter.verifyOtp);
                    return;
                  }
                },
                text: numberIdRegis == 0
                    ? context.l10n.translate('start_video_call')
                    : context.l10n.translate('continue_dktt'),
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
