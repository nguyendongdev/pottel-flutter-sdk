import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: 'iframeUrl') String? iframeUrl,
    String? redirectUrl,
    String? orderNumber,
    String? orderCode,
    String? token,
    String? baseUrl,
    String? socketUrl,
    String? requestId,
    String? paymentId,
    int? amount,
    String? showPTTT,
    int? expireIn,
    int? orderAmount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
