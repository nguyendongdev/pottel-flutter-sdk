import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: 'face_match') String? faceMatch,
    @JsonKey(name: 'face_score') double? faceScore,
    String? threshold,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
