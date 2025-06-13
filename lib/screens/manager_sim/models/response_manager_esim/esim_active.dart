import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_my_esim.dart';

part 'esim_active.g.dart';

@JsonSerializable()
class EsimActive {
  String? title;
  List<ItemMyEsim>? list;

  EsimActive({this.title, this.list});

  @override
  String toString() => 'EsimActive(title: $title, list: $list)';

  factory EsimActive.fromJson(Map<String, dynamic> json) {
    return _$EsimActiveFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EsimActiveToJson(this);

  EsimActive copyWith({
    String? title,
    List<ItemMyEsim>? list,
  }) {
    return EsimActive(
      title: title ?? this.title,
      list: list ?? this.list,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EsimActive) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ list.hashCode;
}
