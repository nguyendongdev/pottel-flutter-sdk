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

  // Common translations
  String get appName => translate('app_name');
  String get loading => translate('loading');
  String get error => translate('error');
  String get success => translate('success');
  String get cancel => translate('cancel');
  String get ok => translate('ok');
  String get retry => translate('retry');
  String get back => translate('back');
  String get next => translate('next');
  String get previous => translate('previous');
  String get save => translate('save');
  String get delete => translate('delete');
  String get edit => translate('edit');
  String get close => translate('close');

  // Authentication
  String get login => translate('login');
  String get logout => translate('logout');
  String get phoneNumber => translate('phone_number');
  String get password => translate('password');
  String get forgotPassword => translate('forgot_password');
  String get rememberMe => translate('remember_me');
  String get loginSuccess => translate('login_success');
  String get loginFailed => translate('login_failed');
  String get invalidPhone => translate('invalid_phone');
  String get userNotLoggedIn => translate('user_not_logged_in');

  // TopUp
  String get topUp => translate('topup');
  String get topUpSkyFi => translate('topup_skyfi');
  String get selectAmount => translate('select_amount');
  String get enterAmount => translate('enter_amount');
  String get paymentMethod => translate('payment_method');
  String get confirmPayment => translate('confirm_payment');
  String get paymentSuccess => translate('payment_success');
  String get paymentFailed => translate('payment_failed');

  // Data Usage
  String get dataUsage => translate('data_usage');
  String get detailDataUsage => translate('detail_data_usage');
  String get remainingData => translate('remaining_data');
  String get usedData => translate('used_data');
  String get totalData => translate('total_data');

  // Info Registration
  String get infoRegistration => translate('info_registration');
  String get personalInfo => translate('personal_info');
  String get contactInfo => translate('contact_info');
  String get address => translate('address');
  String get fullName => translate('full_name');
  String get email => translate('email');
  String get dateOfBirth => translate('date_of_birth');
  String get gender => translate('gender');
  String get male => translate('male');
  String get female => translate('female');

  // Notifications
  String get notification => translate('notification');
  String get notifications => translate('notifications');
  String get noNotifications => translate('no_notifications');
  String get markAsRead => translate('mark_as_read');
  String get clearAll => translate('clear_all');

  // Settings
  String get settings => translate('settings');
  String get language => translate('language');
  String get theme => translate('theme');
  String get lightTheme => translate('light_theme');
  String get darkTheme => translate('dark_theme');
  String get systemTheme => translate('system_theme');
  String get about => translate('about');
  String get version => translate('version');
  String get contactSupport => translate('contact_support');
  String get privacyPolicy => translate('privacy_policy');
  String get termsOfService => translate('terms_of_service');

  // Home Screen
  String get home => translate('home');
  String get dashboard => translate('dashboard');
  String get quickActions => translate('quick_actions');
  String get recentActivity => translate('recent_activity');
  String get balance => translate('balance');
  String get accountInfo => translate('account_info');

  // Packages
  String get packages => translate('packages');
  String get hotPackages => translate('hot_packages');
  String get changePackage => translate('change_package');
  String get currentPackage => translate('current_package');
  String get packageDetails => translate('package_details');
  String get activatePackage => translate('activate_package');
  String get packageActivated => translate('package_activated');

  // Cart
  String get cart => translate('cart');
  String get addToCart => translate('add_to_cart');
  String get removeFromCart => translate('remove_from_cart');
  String get emptyCart => translate('empty_cart');
  String get checkout => translate('checkout');
  String get total => translate('total');

  // SIM Data
  String get simData => translate('sim_data');
  String get simInfo => translate('sim_info');
  String get simNumber => translate('sim_number');
  String get simStatus => translate('sim_status');
  String get activeSim => translate('active_sim');
  String get inactiveSim => translate('inactive_sim');

  // Mobile History
  String get mobileHistory => translate('mobile_history');
  String get callHistory => translate('call_history');
  String get smsHistory => translate('sms_history');
  String get dataHistory => translate('data_history');
  String get transactionHistory => translate('transaction_history');

  // Error Messages
  String get networkError => translate('network_error');
  String get serverError => translate('server_error');
  String get unknownError => translate('unknown_error');
  String get timeoutError => translate('timeout_error');
  String get connectionError => translate('connection_error');
  String get authenticationError => translate('authentication_error');
  String get permissionDenied => translate('permission_denied');
  String get serviceUnavailable => translate('service_unavailable');

  // Validation Messages
  String get required => translate('required');
  String get invalidEmail => translate('invalid_email');
  String get invalidPhoneNumber => translate('invalid_phone_number');
  String get passwordTooShort => translate('password_too_short');
  String get passwordMismatch => translate('password_mismatch');
  String get invalidInput => translate('invalid_input');

  // Date and Time
  String get today => translate('today');
  String get yesterday => translate('yesterday');
  String get tomorrow => translate('tomorrow');
  String get thisWeek => translate('this_week');
  String get thisMonth => translate('this_month');
  String get thisYear => translate('this_year');

  // Units
  String get mb => translate('mb');
  String get gb => translate('gb');
  String get tb => translate('tb');
  String get minutes => translate('minutes');
  String get seconds => translate('seconds');
  String get hours => translate('hours');
  String get days => translate('days');

  // Actions
  String get refresh => translate('refresh');
  String get search => translate('search');
  String get filter => translate('filter');
  String get sort => translate('sort');
  String get share => translate('share');
  String get copy => translate('copy');
  String get paste => translate('paste');
  String get select => translate('select');
  String get selectAll => translate('select_all');
  String get deselect => translate('deselect');
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
