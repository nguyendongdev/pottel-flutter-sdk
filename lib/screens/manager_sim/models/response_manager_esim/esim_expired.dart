import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'item_my_esim.dart';

part 'esim_expired.g.dart';

@JsonSerializable()
class EsimExpired {
  String? title;
  List<ItemMyEsim>? list;

  EsimExpired({this.title, this.list});

  @override
  String toString() => 'EsimExpired(title: $title, list: $list)';

  factory EsimExpired.fromJson(Map<String, dynamic> json) {
    return _$EsimExpiredFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EsimExpiredToJson(this);

  EsimExpired copyWith({
    String? title,
    List<ItemMyEsim>? list,
  }) {
    return EsimExpired(
      title: title ?? this.title,
      list: list ?? this.list,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EsimExpired) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ list.hashCode;
}
