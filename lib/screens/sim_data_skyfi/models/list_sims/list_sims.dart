import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'list_sims.freezed.dart';
part 'list_sims.g.dart';

@freezed
class ListSims with _$ListSims {
  factory ListSims({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<Result>? result,
    dynamic extra,
  }) = _ListSims;

  factory ListSims.fromJson(Map<String, dynamic> json) =>
      _$ListSimsFromJson(json);
}
