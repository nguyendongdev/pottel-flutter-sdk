import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pottel_sdk/pottel_sdk.dart';

// Language provider
final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<Locale> {
  static const String _languageKey = 'selected_language';

  LanguageNotifier() : super(AppLocale.vi.locale) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? AppLocale.vi.code;
    state = AppLocale.fromCode(languageCode).locale;
  }

  Future<void> setLanguage(Locale locale) async {
    if (AppLocale.isSupported(locale)) {
      state = locale;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, locale.languageCode);
    }
  }

  Future<void> setLanguageByCode(String languageCode) async {
    if (AppLocale.isSupportedCode(languageCode)) {
      await setLanguage(AppLocale.fromCode(languageCode).locale);
    }
  }

  Future<void> setAppLocale(AppLocale appLocale) async {
    await setLanguage(appLocale.locale);
  }
}
