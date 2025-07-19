import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/bottom_button.dart';
import 'provider/save_log_dktt_provider.dart';
import 'widgets/step_indicator.dart';

class PrepareScanChipCardScreen extends HookConsumerWidget {
  const PrepareScanChipCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveLog = ref.watch(saveLogDkttNotifierProvider);
    // get Phone,
    final phone = saveLog.phone;
    // get idnumber
    final idnumber = saveLog.idNumber;
    print('idnumber: ${idnumber?.substring(3)}');
    // get dob
    final dob = saveLog.birthDay;
    print('dob: $dob');
    // get expire date
    final expireDate = saveLog.expireDate;
    print('expireDate: $expireDate');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const StepIndicator(
          total: 4,
          current: 3,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.xxl),
            Text(
              'Chuẩn bị quét thông tin CCCD',
              style: AppTextStyles.title
                  .copyWith(color: AppColors.text, fontSize: 22),
            ),
            const SizedBox(height: AppSpacing.xxl),
            Text(
              'Xem video hướng dẫn',
              style: AppTextStyles.title.copyWith(
                color: AppColors.blue,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blue,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: BottomButton(
          onPressed: () {},
          text: 'Tôi đã sẵn sàng',
          textStyle: AppTextStyles.button.copyWith(
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
