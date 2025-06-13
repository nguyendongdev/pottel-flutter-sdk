import 'package:freezed_annotation/freezed_annotation.dart';

part 'ward.freezed.dart';
part 'ward.g.dart';

@freezed
class Ward with _$Ward {
  factory Ward({
    @JsonKey(name: 'original_ward') String? originalWard,
    @JsonKey(name: 'ward_code') String? wardCode,
    @JsonKey(name: 'ward_name') String? wardName,
  }) = _Ward;

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);
}
