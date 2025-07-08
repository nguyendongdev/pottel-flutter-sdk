import 'package:skyfi_sdk/skyfi_sdk.dart';

class SkyfiSdkConfig {
  final SkyfiEnv environment;
  SkyfiSdkConfig({this.environment = SkyfiEnv.dev}) {
    if (environment == SkyfiEnv.dev) {
      _baseUrl = 'https://bss-api.skyfi.network/api';
      _baseUrlEKYC = 'https://ocr-api-uat.ekyc.solutions/api';
      _baseUrlSocket = 'https://socket.skyfi.network/';
      _baseUrlJitsi = 'https://meet.skyfi.network/';
      _tokenEKYC =
          'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTcwMDAxNzg4MywiaWF0IjoxNzAwMDE3ODgzfQ.F_nnc-SaoTSWYgNWhCxqikDna2TrMmfKunNPhCVQIKY';
    } else if (environment == SkyfiEnv.prod) {
      _baseUrl = "https://bss-api.skyfi.pro/api";
      _baseUrlEKYC = "https://ocr-api.ekyc.solutions/api";
      _baseUrlSocket = "https://socket.skyfi.pro/";
      _baseUrlJitsi = "https://meet.skyfi.pro/";
      _tokenEKYC =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgZm9yIGFwb3RhIiwiaWF0IjoxNjkzMTg0MjYwLCJleHAiOjE3MjQ3MjAyNjAsImF1ZCI6InJhci5pZGNoZWNrLmNvbS52biIsInN1YiI6ImFwb3RhQGlkY2hlY2suZGV2IiwiUm9sZSI6Ik1hbmFnZXIifQ.aqrv1yApu2S-p53dZnhQLFLVShD92Xn5-1AmHpXE5RU";
    } else {
      throw ArgumentError('Invalid type: $environment. Use "dev" or "prod".');
    }
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
