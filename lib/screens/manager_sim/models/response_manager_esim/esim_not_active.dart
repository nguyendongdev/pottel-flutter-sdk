import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_my_esim.dart';

part 'esim_not_active.g.dart';

@JsonSerializable()
class EsimNotActive {
  String? title;
  List<ItemMyEsim>? list;

  EsimNotActive({this.title, this.list});

  @override
  String toString() => 'EsimNotActive(title: $title, list: $list)';

  factory EsimNotActive.fromJson(Map<String, dynamic> json) {
    return _$EsimNotActiveFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EsimNotActiveToJson(this);

  EsimNotActive copyWith({
    String? title,
    List<ItemMyEsim>? list,
  }) {
    return EsimNotActive(
      title: title ?? this.title,
      list: list ?? this.list,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EsimNotActive) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ list.hashCode;
}
