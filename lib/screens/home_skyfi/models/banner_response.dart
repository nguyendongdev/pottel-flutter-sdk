import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_response.freezed.dart';
part 'banner_response.g.dart';

@freezed
class BannerResponse with _$BannerResponse {
  const factory BannerResponse({
    @JsonKey(name: 'requestId') dynamic requestId,
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'totalRecords') required int totalRecords,
    @JsonKey(name: 'result') required List<String> result,
    @JsonKey(name: 'extra') dynamic extra,
  }) = _BannerResponse;

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
}
