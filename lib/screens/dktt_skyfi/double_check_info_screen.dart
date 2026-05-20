import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
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
                context.l10n.translate('check_info_again'),
                style: AppTextStyles.title.copyWith(
                  color: AppColors.text,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('full_name_dktt'),
                  value: saveLog.fullName ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('gender_dktt'),
                  value: saveLog.gender ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('citizen_id_number'),
                  value: saveLog.idNumber ?? ''),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: InfoDisplay(
                        title: context.l10n.translate('issue_date_dktt'),
                        value: saveLog.issueDate ?? ''),
                  ),
                  Expanded(
                    child: InfoDisplay(
                        title: context.l10n.translate('expiry_date_dktt'),
                        value: saveLog.expireDate ?? ''),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('date_of_birth'),
                  value: saveLog.birthDay ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('place_of_issue_dktt'),
                  value: saveLog.issuePlace ?? ''),
              const SizedBox(height: AppSpacing.sm),
              InfoDisplay(
                  title: context.l10n.translate('permanent_address'),
                  value: saveLog.address ?? ''),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
        ),
        child: BottomButton(
          onPressed: () {
            if (sod?.isNotEmpty ?? false) {
              SnackBarApp.showSuccess(context,
                  message: context.l10n.translate('reference_number_saved'));
              ref.read(saveLogDkttNotifierProvider.notifier).setSob(sod);
            }
            context.pushNamed(AppRouter.previewContact);
          },
          text: context.l10n.translate('continue_dktt'),
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
