import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../l10n/localization_extension.dart';
import '../../../routers/routers.dart';
import '../../../utilities/common.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, this.balance = "0"});

  final String balance;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.translate('main_account'),
                    style: AppTextStyles.label,
                  ),
                  // SizedBox(height: AppSpacing.xs),
                  Text(
                    '${Common.formatCurrency(balance)} VND',
                    style: AppTextStyles.title,
                  ),
                ],
              ),
              OutlineButton(
                onPressed: () {
                  context.pushNamed(AppRouter.topupSkyFi);
                },
                text: context.l10n.translate('topup_money'),
                textStyle: AppTextStyles.button.copyWith(
                  color: AppColors.primary,
                ),
                height: 36,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
