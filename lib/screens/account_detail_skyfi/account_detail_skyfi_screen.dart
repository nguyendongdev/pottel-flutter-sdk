import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/screens/home_skyfi/models/user_info.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../home_skyfi/provider/user_info_provider.dart';
import 'widgets/info_field.dart';

class AccountDetailSkyfiScreen extends HookConsumerWidget {
  const AccountDetailSkyfiScreen({super.key});

  String _convertIssuePlace(BuildContext context, String idIssuePlace) {
//     BCA  BỘ CÔNG AN
// CDD  Cục Trưởng Cục Cảnh sát ĐKQL cư trú và DLQG về dân cư
// CQH  Cục Trưởng Cục Cảnh sát Quản lý hành chính về trật tự xã hội
// CXN  Cục quản lý xuất nhập cảnh

    switch (idIssuePlace) {
      case 'BCA':
        return context.l10n.translate('ministry_public_security');
      case 'CDD':
        return context.l10n.translate('police_department_residence_management');
      case 'CQH':
        return context.l10n.translate('police_department_administrative_management');
      case 'CXN':
        return context.l10n.translate('immigration_department');
      default:
        return idIssuePlace;
    }
  }

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
          context.l10n.translate('account_information'),
          style: AppTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            InfoField(
              label: context.l10n.translate('full_name'),
              value: userInfo.fullName ?? '',
            ),
            InfoField(
              label: context.l10n.translate('gender'),
              value: userInfo.gender ?? context.l10n.translate('unknown_gender'),
            ),
            InfoField(
              label: context.l10n.translate('id_number'),
              value: userInfo.idNumber ?? '',
            ),
            InfoField(
              label: context.l10n.translate('birthday'),
              value: userInfo.birthday ?? '',
            ),
            Row(
              children: [
                Expanded(
                  child: InfoField(
                    label: context.l10n.translate('issue_date'),
                    value: userInfo.idIssueDate?.substring(0, 10) ?? '',
                    isFullWidth: false,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // Expanded(
                //   child: InfoField(
                //     label: 'Ngày hết hạn',
                //     value: userInfo.idIssueDate?.substring(0, 10) ?? '',
                //     isFullWidth: false,
                //   ),
                // ),
              ],
            ),
            InfoField(
              label: context.l10n.translate('issue_place'),
              value: _convertIssuePlace(context, userInfo.idIssuePlace ?? ''),
            ),
            InfoField(
              label: context.l10n.translate('address'),
              value: userInfo.address ?? '',
            ),
            InfoField(
              label: context.l10n.translate('email'),
              value: userInfo.email ?? context.l10n.translate('no_email'),
            ),
          ],
        ),
      ),
    );
  }
}
