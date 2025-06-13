import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'check_sim.freezed.dart';
part 'check_sim.g.dart';

@freezed
class CheckSim with _$CheckSim {
  factory CheckSim({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _CheckSim;

  factory CheckSim.fromJson(Map<String, dynamic> json) =>
      _$CheckSimFromJson(json);
}
