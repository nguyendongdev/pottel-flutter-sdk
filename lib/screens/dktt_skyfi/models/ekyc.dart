import 'package:freezed_annotation/freezed_annotation.dart';

part 'ekyc.freezed.dart';
part 'ekyc.g.dart';

@freezed
class Ekyc with _$Ekyc {
  const factory Ekyc({
    String? cartBack,
    String? cartFront,
    String? selfie,
  }) = _Ekyc;

  factory Ekyc.fromJson(Map<String, dynamic> json) => _$EkycFromJson(json);
}
