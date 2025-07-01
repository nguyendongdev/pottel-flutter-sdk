import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/app_input.dart';
import '../../core/widgets/bottom_button.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../routers/routers.dart';
import 'provider/save_log_dktt_provider.dart';
import 'widgets/info_display.dart';
import 'widgets/step_indicator.dart';

class DoubleCheckInfoScreen extends HookConsumerWidget {
  const DoubleCheckInfoScreen({super.key, this.sod});
  final String? sod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveLog = ref.watch(saveLogDkttNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const StepIndicator(
          total: 4,
          current: 3,
        ),
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kiểm tra lại thông tin',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.text,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(title: 'Họ và tên', value: saveLog.fullName ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(title: 'Giới tính', value: saveLog.gender ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: 'Số Căn cước công dân', value: saveLog.idNumber ?? ''),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: InfoDisplay(
                        title: 'Ngày cấp', value: saveLog.issueDate ?? ''),
                  ),
                  Expanded(
                    child: InfoDisplay(
                        title: 'Ngày hết hạn', value: saveLog.expireDate ?? ''),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(title: 'Ngày sinh', value: saveLog.birthDay ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(title: 'Nơi cấp', value: saveLog.issuePlace ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: 'Nơi thường trú', value: saveLog.address ?? ''),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: BottomButton(
          onPressed: () {
            if (sod?.isNotEmpty ?? false) {
              SnackBarApp.showSuccess(context,
                  message: 'Số đối chiếu đã được lưu');
              ref.read(saveLogDkttNotifierProvider.notifier).setSob(sod);
            }
            context.pushNamed(AppRouter.previewContact);
          },
          text: 'Tiếp tục',
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
