import 'package:freezed_annotation/freezed_annotation.dart';

import 'filters.dart';

part 'params_sims.freezed.dart';
part 'params_sims.g.dart';

@freezed
class ParamsSims with _$ParamsSims {
  factory ParamsSims({
    Filters? filters,
    int? page,
    int? pageSize,
  }) = _ParamsSims;

  factory ParamsSims.fromJson(Map<String, dynamic> json) =>
      _$ParamsSimsFromJson(json);
}
