import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result_package.dart';

part 'response_package.g.dart';

@JsonSerializable()
class ResponsePackage {
  dynamic requestId;
  int? code;
  String? message;
  int? totalRecords;
  List<ResultPackage>? result;
  dynamic extra;

  ResponsePackage({
    this.requestId,
    this.code,
    this.message,
    this.totalRecords,
    this.result,
    this.extra,
  });

  @override
  String toString() {
    return 'ResponsePackage(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  factory ResponsePackage.fromJson(Map<String, dynamic> json) {
    return _$ResponsePackageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponsePackageToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponsePackage) return false;
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
