import 'package:flutter/material.dart';
import 'package:skyfi_sdk/l10n/app_localization.dart';

// Extension for easy access to localization
extension LocalizationExtension on BuildContext {
  AppLocalization get l10n => AppLocalization.of(this);
}
