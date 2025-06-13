import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package_history.dart';

part 'response_history_pack.g.dart';

@JsonSerializable()
class ResponseHistoryPack {
  final dynamic requestId;
  final int? code;
  final String? message;
  final int? totalRecords;
  final List<PackageHistory>? result;
  final dynamic extra;

  const ResponseHistoryPack({
    this.requestId,
    this.code,
    this.message,
    this.totalRecords,
    this.result,
    this.extra,
  });

  @override
  String toString() {
    return 'ResponseHistoryPack(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  factory ResponseHistoryPack.fromJson(Map<String, dynamic> json) {
    return _$ResponseHistoryPackFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseHistoryPackToJson(this);

  ResponseHistoryPack copyWith({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<PackageHistory>? result,
    dynamic extra,
  }) {
    return ResponseHistoryPack(
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
    if (other is! ResponseHistoryPack) return false;
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
