import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'get_number_id_regis.freezed.dart';
part 'get_number_id_regis.g.dart';

@freezed
class GetNumberIdRegis with _$GetNumberIdRegis {
  factory GetNumberIdRegis({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _GetNumberIdRegis;

  factory GetNumberIdRegis.fromJson(Map<String, dynamic> json) =>
      _$GetNumberIdRegisFromJson(json);
}
