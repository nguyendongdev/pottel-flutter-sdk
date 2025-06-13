import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topup_history.g.dart';

@JsonSerializable()
class TopUpHistory {
  final int? id;
  final String? subscriber;
  @JsonKey(name: 'topup_value_id')
  final int? topupValueId;
  final int? amount;
  @JsonKey(name: 'topup_method')
  final String? topupMethod;
  @JsonKey(name: 'topup_channel')
  final String? topupChannel;
  @JsonKey(name: 'target_msisdn')
  final String? targetMsisdn;
  @JsonKey(name: 'transaction_id')
  final dynamic transactionId;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(name: 'transaction_date')
  final DateTime? transactionDate;
  @JsonKey(name: 'balance_before')
  final dynamic balanceBefore;
  @JsonKey(name: 'balance_after')
  final dynamic balanceAfter;
  @JsonKey(name: 'object_type')
  final String? objectType;
  final String? status;
  @JsonKey(name: 'error_code')
  final dynamic errorCode;
  @JsonKey(name: 'error_message')
  final dynamic errorMessage;
  @JsonKey(name: 'reference_info')
  final dynamic referenceInfo;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const TopUpHistory({
    this.id,
    this.subscriber,
    this.topupValueId,
    this.amount,
    this.topupMethod,
    this.topupChannel,
    this.targetMsisdn,
    this.transactionId,
    this.orderId,
    this.transactionDate,
    this.balanceBefore,
    this.balanceAfter,
    this.objectType,
    this.status,
    this.errorCode,
    this.errorMessage,
    this.referenceInfo,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Result(id: $id, subscriber: $subscriber, topupValueId: $topupValueId, amount: $amount, topupMethod: $topupMethod, topupChannel: $topupChannel, targetMsisdn: $targetMsisdn, transactionId: $transactionId, orderId: $orderId, transactionDate: $transactionDate, balanceBefore: $balanceBefore, balanceAfter: $balanceAfter, objectType: $objectType, status: $status, errorCode: $errorCode, errorMessage: $errorMessage, referenceInfo: $referenceInfo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory TopUpHistory.fromJson(Map<String, dynamic> json) {
    return _$TopUpHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopUpHistoryToJson(this);

  TopUpHistory copyWith({
    int? id,
    String? subscriber,
    int? topupValueId,
    int? amount,
    String? topupMethod,
    String? topupChannel,
    String? targetMsisdn,
    dynamic transactionId,
    String? orderId,
    DateTime? transactionDate,
    dynamic balanceBefore,
    dynamic balanceAfter,
    String? objectType,
    String? status,
    dynamic errorCode,
    dynamic errorMessage,
    dynamic referenceInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TopUpHistory(
      id: id ?? this.id,
      subscriber: subscriber ?? this.subscriber,
      topupValueId: topupValueId ?? this.topupValueId,
      amount: amount ?? this.amount,
      topupMethod: topupMethod ?? this.topupMethod,
      topupChannel: topupChannel ?? this.topupChannel,
      targetMsisdn: targetMsisdn ?? this.targetMsisdn,
      transactionId: transactionId ?? this.transactionId,
      orderId: orderId ?? this.orderId,
      transactionDate: transactionDate ?? this.transactionDate,
      balanceBefore: balanceBefore ?? this.balanceBefore,
      balanceAfter: balanceAfter ?? this.balanceAfter,
      objectType: objectType ?? this.objectType,
      status: status ?? this.status,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      referenceInfo: referenceInfo ?? this.referenceInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TopUpHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      subscriber.hashCode ^
      topupValueId.hashCode ^
      amount.hashCode ^
      topupMethod.hashCode ^
      topupChannel.hashCode ^
      targetMsisdn.hashCode ^
      transactionId.hashCode ^
      orderId.hashCode ^
      transactionDate.hashCode ^
      balanceBefore.hashCode ^
      balanceAfter.hashCode ^
      objectType.hashCode ^
      status.hashCode ^
      errorCode.hashCode ^
      errorMessage.hashCode ^
      referenceInfo.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
