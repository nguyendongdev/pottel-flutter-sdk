import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'topup_history.dart';

part 'response_history_toup.g.dart';

@JsonSerializable()
class ResponseHistoryToup {
  final dynamic requestId;
  final int? code;
  final String? message;
  final int? totalRecords;
  final List<TopUpHistory>? result;
  final dynamic extra;

  const ResponseHistoryToup({
    this.requestId,
    this.code,
    this.message,
    this.totalRecords,
    this.result,
    this.extra,
  });

  @override
  String toString() {
    return 'ResponseHistoryToup(requestId: $requestId, code: $code, message: $message, totalRecords: $totalRecords, result: $result, extra: $extra)';
  }

  factory ResponseHistoryToup.fromJson(Map<String, dynamic> json) {
    return _$ResponseHistoryToupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseHistoryToupToJson(this);

  ResponseHistoryToup copyWith({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    List<TopUpHistory>? result,
    dynamic extra,
  }) {
    return ResponseHistoryToup(
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
    if (other is! ResponseHistoryToup) return false;
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
