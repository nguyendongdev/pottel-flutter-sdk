import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_add_data.g.dart';

@JsonSerializable()
class ResultAddData {
  @JsonKey(name: 'order_number')
  String? orderNumber;

  ResultAddData({this.orderNumber});

  @override
  String toString() => 'Result(orderNumber: $orderNumber)';

  factory ResultAddData.fromJson(Map<String, dynamic> json) {
    return _$ResultAddDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultAddDataToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResultAddData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => orderNumber.hashCode;
}
