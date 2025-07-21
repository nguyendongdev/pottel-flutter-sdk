import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import '../../routers/routers.dart';
import 'provider/ekyc_provider.dart';
import 'provider/save_log_dktt_provider.dart';
import 'widgets/id_card_preview.dart';
import 'widgets/step_indicator.dart';

class PrepareChipCardScreen extends HookConsumerWidget {
  const PrepareChipCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ekycType = ref.watch(typesScreenProvider);
    final saveLog = ref.watch(saveLogDkttNotifierProvider);
    // print('saveLog: $saveLog');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.text,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const StepIndicator(
          total: 4,
          current: 1,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(
              context.l10n.translate('id_document_info'),
              style: AppTextStyles.heading.copyWith(
                fontSize: 22,
              ),
            ),
          ),
          // height screen
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          const Center(child: IdCardPreview()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
        ),
        child: BottomButton(
          onPressed: () {
            ref
                .read(typesScreenProvider.notifier)
                .setEkycType(EkycType.cartFront);
            context.pushNamed(AppRouter.captureChipCard,
                extra: EkycType.cartFront);
          },
          text: context.l10n.translate('take_photo'),
          textStyle: AppTextStyles.button.copyWith(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
