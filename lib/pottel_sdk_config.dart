import 'package:pottel_sdk/pottel_sdk.dart';

class PottelSdkConfig {
  final PottelEnv environment;

  static const String _devBaseUrl = 'https://bss-api.pottel.dev/api';
  static const String _devBaseUrlEKYC =
      'https://ocr-api-dev.ekyc.solutions/api';
  static const String _devBaseUrlSocket = 'https://socket.skyfi.network/';
  static const String _devBaseUrlJitsi = 'https://meet.skyfi.network/';
  static const String _devTokenEKYC =
      'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTcwMDAxNzg4MywiaWF0IjoxNzAwMDE3ODgzfQ.F_nnc-SaoTSWYgNWhCxqikDna2TrMmfKunNPhCVQIKY';

  PottelSdkConfig({this.environment = PottelEnv.dev}) {
    if (environment == PottelEnv.dev) {
      _baseUrl = _devBaseUrl;
      _baseUrlEKYC = _devBaseUrlEKYC;
      _baseUrlSocket = _devBaseUrlSocket;
      _baseUrlJitsi = _devBaseUrlJitsi;
      _tokenEKYC = _devTokenEKYC;
    } else if (environment == PottelEnv.prod) {
      _baseUrl = _toProdUrl(_devBaseUrl);
      _baseUrlEKYC = _toProdUrl(_devBaseUrlEKYC);
      _baseUrlSocket = _toProdUrl(_devBaseUrlSocket);
      _baseUrlJitsi = _toProdUrl(_devBaseUrlJitsi);
      _tokenEKYC = _devTokenEKYC;
    } else {
      throw ArgumentError('Invalid type: $environment. Use "dev" or "prod".');
    }
  }

  static String _toProdUrl(String url) {
    return url.replaceAll('.dev', '.vn').replaceAll('.network', '.pro');
  }

  static late String _baseUrl;
  static late String _baseUrlEKYC;
  static late String _baseUrlSocket;
  static late String _baseUrlJitsi;
  static late String _tokenEKYC;

  static String get baseUrl => _baseUrl;
  static String get baseUrlEKYC => _baseUrlEKYC;
  static String get baseUrlSocket => _baseUrlSocket;
  static String get baseUrlJitsi => _baseUrlJitsi;
  static String get tokenEKYC => _tokenEKYC;
}

@Deprecated('Use PottelSdkConfig instead')
typedef SkyfiSdkConfig = PottelSdkConfig;
