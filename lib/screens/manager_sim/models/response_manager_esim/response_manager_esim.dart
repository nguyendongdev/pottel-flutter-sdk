import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'response_manager_esim.g.dart';

@JsonSerializable()
class ResponseManagerEsim {
  dynamic requestId;
  int? code;
  String? message;
  int? totalRecords;
  ResultMyEsim? result;
  dynamic extra;

  ResponseManagerEsim({
    this.requestId,
    this.code,
    this.message,
    this.totalRecords,
    this.result,
    this.extra,
  });

  @override
  String toString() {
    return 'ResponseManagerEsim(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  factory ResponseManagerEsim.fromJson(Map<String, dynamic> json) {
    return _$ResponseManagerEsimFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseManagerEsimToJson(this);

  ResponseManagerEsim copyWith({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    ResultMyEsim? result,
    dynamic extra,
  }) {
    return ResponseManagerEsim(
      requestId: requestId ?? this.requestId,
      code: code ?? this.code,
      message: message ?? this.message,
      totalRecords: totalRecords ?? this.totalRecords,
      result: result ?? this.result,
      extra: extra ?? this.extra,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseManagerEsim) return false;
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
