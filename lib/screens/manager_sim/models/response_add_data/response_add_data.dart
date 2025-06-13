import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result_add_data.dart';

part 'response_add_data.g.dart';

@JsonSerializable()
class ResponseAddData {
  dynamic requestId;
  int? code;
  String? message;
  int? totalRecords;
  ResultAddData? result;
  dynamic extra;

  ResponseAddData({
    this.requestId,
    this.code,
    this.message,
    this.totalRecords,
    this.result,
    this.extra,
  });

  @override
  String toString() {
    return 'ResponseAddData(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  factory ResponseAddData.fromJson(Map<String, dynamic> json) {
    return _$ResponseAddDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseAddDataToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseAddData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      requestId.hashCode ^
      code.hashCode ^
      message.hashCode ^
      totalRecords.hashCode ^
      result.hashCode ^
      extra.hashCode;
}
