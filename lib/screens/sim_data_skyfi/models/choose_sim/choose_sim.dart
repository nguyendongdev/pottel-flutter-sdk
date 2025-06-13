import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'choose_sim.freezed.dart';
part 'choose_sim.g.dart';

@freezed
class ChooseSim with _$ChooseSim {
  factory ChooseSim({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<Result>? result,
    dynamic extra,
  }) = _ChooseSim;

  factory ChooseSim.fromJson(Map<String, dynamic> json) =>
      _$ChooseSimFromJson(json);
}
