import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import '../../routers/routers.dart';
import 'provider/ekyc_provider.dart';
import 'widgets/step_indicator.dart';

class PrepareFaceScreen extends HookConsumerWidget {
  const PrepareFaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          current: 2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.xxl),
            Text(
              context.l10n.translate('face_authentication_photo'),
              style: AppTextStyles.heading.copyWith(
                color: AppColors.text,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/pre_face_1.svg',
                  width: 62,
                  height: 62,
                  package: 'skyfi_sdk',
                ),
                const SizedBox(width: AppSpacing.lg),
                Text(
                  context.l10n.translate('ensure_good_lighting'),
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/pre_face_2.svg',
                  width: 62,
                  height: 62,
                  package: 'skyfi_sdk',
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Text(
                    context.l10n.translate('no_hat_glasses_mask'),
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.text,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/pre_face_3.svg',
                  width: 62,
                  height: 62,
                  package: 'skyfi_sdk',
                ),
                const SizedBox(width: AppSpacing.lg),
                Text(
                  context.l10n.translate('keep_face_centered'),
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
        ),
        child: BottomButton(
          onPressed: () {
            context.pushNamed(AppRouter.captureChipCard,
                extra: EkycType.selfie);
          },
          text: context.l10n.translate('take_photo'),
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
