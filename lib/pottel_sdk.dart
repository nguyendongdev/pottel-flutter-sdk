library pottel_sdk;

export 'skyfi_sdk.dart';

import 'package:flutter/widgets.dart';

import 'skyfi_sdk.dart';

/// Branded wrapper for new integrations while preserving legacy Skyfi API.
class PottelSdk extends SkyfiSdk {
  PottelSdk({
    super.key,
    super.initialLocation,
    super.phone,
    super.env,
    super.locale,
  });

  static Widget toScreen({
    String? initialLocation,
    String? phone,
    PottelEnv env = SkyfiEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) {
    return SkyfiSdk.toScreen(
      initialLocation: initialLocation,
      phone: phone,
      env: env,
      locale: locale,
    );
  }

  static Future<void> openRegisPottel({
    PottelEnv env = SkyfiEnv.dev,
    AppLocale locale = AppLocale.vi,
  }) async {
    await SkyfiSdk.openRegisSkyFi(env: env, locale: locale);
  }
}

typedef PottelEnv = SkyfiEnv;

/// Branded route facade that maps to existing Skyfi routes.
class PottelRoute {
  static const SkyfiRoute home = SkyfiRoute.home;
  static const SkyfiRoute topup = SkyfiRoute.topup;
  static const SkyfiRoute infoRegis = SkyfiRoute.infoRegis;
  static const SkyfiRoute scanBarcode = SkyfiRoute.scanBarcode;
  static const SkyfiRoute scanNfcChipcardNew = SkyfiRoute.scanNfcChipcardNew;

  // Branded aliases for legacy route enums.
  static const SkyfiRoute topupPottel = SkyfiRoute.topupSkyFi;
  static const SkyfiRoute infoRegisPottel = SkyfiRoute.infoRegisSkyFi;
}
