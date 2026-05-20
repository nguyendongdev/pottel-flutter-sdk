import 'package:pottel_sdk/skyfi_sdk.dart';

class SkyfiSdkConfig {
  final SkyfiEnv environment;

  static const String _devBaseUrl = 'https://bss-api.pottel.dev/api';
  static const String _devBaseUrlEKYC =
      'https://ocr-api-dev.ekyc.solutions/api';
  static const String _devBaseUrlSocket = 'https://socket.skyfi.network/';
  static const String _devBaseUrlJitsi = 'https://meet.skyfi.network/';
  static const String _devTokenEKYC =
      'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTcwMDAxNzg4MywiaWF0IjoxNzAwMDE3ODgzfQ.F_nnc-SaoTSWYgNWhCxqikDna2TrMmfKunNPhCVQIKY';

  SkyfiSdkConfig({this.environment = SkyfiEnv.dev}) {
    if (environment == SkyfiEnv.dev) {
      _baseUrl = _devBaseUrl;
      _baseUrlEKYC = _devBaseUrlEKYC;
      _baseUrlSocket = _devBaseUrlSocket;
      _baseUrlJitsi = _devBaseUrlJitsi;
      _tokenEKYC = _devTokenEKYC;
    } else if (environment == SkyfiEnv.prod) {
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
