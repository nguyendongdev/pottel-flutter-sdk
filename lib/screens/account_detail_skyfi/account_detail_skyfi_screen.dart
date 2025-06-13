import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/home_skyfi/models/user_info.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../home_skyfi/provider/user_info_provider.dart';
import 'widgets/info_field.dart';

class AccountDetailSkyfiScreen extends HookConsumerWidget {
  const AccountDetailSkyfiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserInfo userInfo = ref.watch(userInfoProviderProvider);

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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Thông tin tài khoản',
          style: AppTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            InfoField(
              label: 'Họ và tên',
              value: userInfo.fullName ?? '',
            ),
            InfoField(
              label: 'Giới tính',
              value: userInfo.gender ?? 'Chưa rõ',
            ),
            InfoField(
              label: 'Số Căn cước công dân',
              value: userInfo.idNumber ?? '',
            ),
            InfoField(
              label: 'Ngày sinh',
              value: 'Chưa có',
            ),
            Row(
              children: [
                Expanded(
                  child: InfoField(
                    label: 'Ngày cấp',
                    value: userInfo.idIssueDate?.substring(0, 10) ?? '',
                    isFullWidth: false,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoField(
                    label: 'Ngày hết hạn',
                    value: userInfo.idIssueDate?.substring(0, 10) ?? '',
                    isFullWidth: false,
                  ),
                ),
              ],
            ),
            InfoField(
              label: 'Nơi cấp',
              value: userInfo.idIssuePlace ?? '',
            ),
            InfoField(
              label: 'Nơi thường trú',
              value: userInfo.address ?? '',
            ),
            InfoField(
              label: 'Email',
              value: userInfo.email ?? 'Chưa có',
            ),
          ],
        ),
      ),
    );
  }
}
