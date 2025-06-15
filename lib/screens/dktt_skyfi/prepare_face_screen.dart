import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            context.pop();
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
              'Chụp ảnh xác thực khuôn mặt',
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
                  'Đảm bảo ánh sáng tốt.',
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
                    'Không đội mũ, đeo kính hoặc khẩu trang.',
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
                  'Giữ mặt ở giữa khung hình.',
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xl,
        ),
        child: BottomButton(
          onPressed: () {
            context.pushNamed(AppRouter.captureChipCard,
                extra: EkycType.selfie);
          },
          text: 'Chụp ảnh',
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
