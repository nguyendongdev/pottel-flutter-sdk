import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/screens/manager_sim/models/response_package/result_package.dart';
import 'package:pottel_sdk/screens/manager_sim/providers/provider_manager_esim.dart';
import 'package:pottel_sdk/utilities/modal.dart';

import '../../../l10n/localization_extension.dart';

class PackageRegisterButton extends HookConsumerWidget {
  final ResultPackage package;
  final String iccid;

  const PackageRegisterButton({
    super.key,
    required this.package,
    required this.iccid,
  });

  Future<void> _handleRegistration(
    BuildContext context,
    WidgetRef ref,
    String packageId,
    ValueNotifier<bool> isLoading,
  ) async {
    if (packageId.isEmpty) {
      Modal.showError(
          title: context.l10n.translate('notification'),
          message: context.l10n.translate('package_id_error'));
      return;
    }

    isLoading.value = true;

    try {
      await ref
          .read(managerESimListDataProvider(iccid).notifier)
          .addDataAndNavigateToPayment(packageId, iccid, context);
    } catch (e) {
      if (context.mounted) {
        Modal.showError(
            title: context.l10n.translate('notification'),
            message: context.l10n
                .translate('registration_error')
                .replaceAll('{0}', e.toString()));
      }
    } finally {
      if (context.mounted) {
        isLoading.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final packageId =
        package.productId?.toString() ?? package.id?.toString() ?? '';

    return ElevatedButton(
      onPressed: isLoading.value
          ? null
          : () => _handleRegistration(context, ref, packageId, isLoading),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFAA61A),
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: isLoading.value
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              context.l10n.translate('register_button_sim'),
              style: AppTextStyles.button.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
