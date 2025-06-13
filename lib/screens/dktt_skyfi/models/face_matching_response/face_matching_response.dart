import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'face_matching_response.freezed.dart';
part 'face_matching_response.g.dart';

@freezed
class FaceMatchingResponse with _$FaceMatchingResponse {
  factory FaceMatchingResponse({
    String? requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _FaceMatchingResponse;

  factory FaceMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$FaceMatchingResponseFromJson(json);
}
