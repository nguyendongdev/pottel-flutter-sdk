import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'save_log_respone.freezed.dart';
part 'save_log_respone.g.dart';

@freezed
class SaveLogRespone with _$SaveLogRespone {
  factory SaveLogRespone({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _SaveLogRespone;

  factory SaveLogRespone.fromJson(Map<String, dynamic> json) =>
      _$SaveLogResponeFromJson(json);
}
