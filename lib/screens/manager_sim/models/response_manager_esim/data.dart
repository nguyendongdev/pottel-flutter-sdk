import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class DataMyEsim {
  int? remaining;
  int? total;
  @JsonKey(name: 'expired_at')
  String? expiredAt;
  @JsonKey(name: 'is_unlimited')
  bool? isUnlimited;
  String? status;
  @JsonKey(name: 'remaining_voice')
  int? remainingVoice;
  @JsonKey(name: 'remaining_text')
  int? remainingText;
  @JsonKey(name: 'total_voice')
  int? totalVoice;
  @JsonKey(name: 'total_text')
  int? totalText;

  DataMyEsim({
    this.remaining,
    this.total,
    this.expiredAt,
    this.isUnlimited,
    this.status,
    this.remainingVoice,
    this.remainingText,
    this.totalVoice,
    this.totalText,
  });

  @override
  String toString() {
    return 'Data(remaining: $remaining, total: $total, expiredAt: $expiredAt, isUnlimited: $isUnlimited, status: $status, remainingVoice: $remainingVoice, remainingText: $remainingText, totalVoice: $totalVoice, totalText: $totalText)';
  }

  factory DataMyEsim.fromJson(Map<String, dynamic> json) =>
      _$DataMyEsimFromJson(json);

  Map<String, dynamic> toJson() => _$DataMyEsimToJson(this);

  DataMyEsim copyWith({
    int? remaining,
    int? total,
    String? expiredAt,
    bool? isUnlimited,
    String? status,
    int? remainingVoice,
    int? remainingText,
    int? totalVoice,
    int? totalText,
  }) {
    return DataMyEsim(
      remaining: remaining ?? this.remaining,
      total: total ?? this.total,
      expiredAt: expiredAt ?? this.expiredAt,
      isUnlimited: isUnlimited ?? this.isUnlimited,
      status: status ?? this.status,
      remainingVoice: remainingVoice ?? this.remainingVoice,
      remainingText: remainingText ?? this.remainingText,
      totalVoice: totalVoice ?? this.totalVoice,
      totalText: totalText ?? this.totalText,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataMyEsim) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      remaining.hashCode ^
      total.hashCode ^
      expiredAt.hashCode ^
      isUnlimited.hashCode ^
      status.hashCode ^
      remainingVoice.hashCode ^
      remainingText.hashCode ^
      totalVoice.hashCode ^
      totalText.hashCode;
}
