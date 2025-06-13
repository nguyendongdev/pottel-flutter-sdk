import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'esim_active.dart';
import 'esim_expired.dart';
import 'esim_not_active.dart';

part 'result.g.dart';

@JsonSerializable()
class ResultMyEsim {
  EsimNotActive? esimNotActive;
  EsimActive? esimActive;
  EsimExpired? esimExpired;

  ResultMyEsim({this.esimNotActive, this.esimActive, this.esimExpired});

  @override
  String toString() {
    return 'Result(esimNotActive: $esimNotActive, esimActive: $esimActive, esimExpired: $esimExpired)';
  }

  factory ResultMyEsim.fromJson(Map<String, dynamic> json) {
    return _$ResultMyEsimFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultMyEsimToJson(this);

  ResultMyEsim copyWith({
    EsimNotActive? esimNotActive,
    EsimActive? esimActive,
    EsimExpired? esimExpired,
  }) {
    return ResultMyEsim(
      esimNotActive: esimNotActive ?? this.esimNotActive,
      esimActive: esimActive ?? this.esimActive,
      esimExpired: esimExpired ?? this.esimExpired,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResultMyEsim) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      esimNotActive.hashCode ^ esimActive.hashCode ^ esimExpired.hashCode;
}
