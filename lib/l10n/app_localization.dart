import 'package:flutter/material.dart';
import 'package:skyfi_sdk/l10n/locales/en.dart';
import 'package:skyfi_sdk/l10n/locales/vi.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('vi', ''),
  ];

  Map<String, String> get localizedStrings {
    switch (locale.languageCode) {
      case 'vi':
        return viStrings;
      case 'en':
      default:
        return enStrings;
    }
  }

  String translate(String key) {
    return localizedStrings[key] ?? key;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalization.supportedLocales.contains(locale);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
