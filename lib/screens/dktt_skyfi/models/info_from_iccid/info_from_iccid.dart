import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'info_from_iccid.freezed.dart';
part 'info_from_iccid.g.dart';

@freezed
class InfoFromIccid with _$InfoFromIccid {
  factory InfoFromIccid({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _InfoFromIccid;

  factory InfoFromIccid.fromJson(Map<String, dynamic> json) =>
      _$InfoFromIccidFromJson(json);
}
