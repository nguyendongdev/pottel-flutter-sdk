import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signature/signature.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';

class SignatureBox extends StatelessWidget {
  SignatureBox({super.key});
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: AppColors.blue,
    exportPenColor: AppColors.blue,
    exportBackgroundColor: AppColors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  package: 'skyfi_sdk',
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
    );
  }
}
