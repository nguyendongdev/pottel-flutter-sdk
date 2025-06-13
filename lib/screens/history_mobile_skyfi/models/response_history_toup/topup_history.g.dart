// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopUpHistory _$TopUpHistoryFromJson(Map<String, dynamic> json) => TopUpHistory(
      id: (json['id'] as num?)?.toInt(),
      subscriber: json['subscriber'] as String?,
      topupValueId: (json['topup_value_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      topupMethod: json['topup_method'] as String?,
      topupChannel: json['topup_channel'] as String?,
      targetMsisdn: json['target_msisdn'] as String?,
      transactionId: json['transaction_id'],
      orderId: json['order_id'] as String?,
      transactionDate: json['transaction_date'] == null
          ? null
          : DateTime.parse(json['transaction_date'] as String),
      balanceBefore: json['balance_before'],
      balanceAfter: json['balance_after'],
      objectType: json['object_type'] as String?,
      status: json['status'] as String?,
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      referenceInfo: json['reference_info'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TopUpHistoryToJson(TopUpHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscriber': instance.subscriber,
      'topup_value_id': instance.topupValueId,
      'amount': instance.amount,
      'topup_method': instance.topupMethod,
      'topup_channel': instance.topupChannel,
      'target_msisdn': instance.targetMsisdn,
      'transaction_id': instance.transactionId,
      'order_id': instance.orderId,
      'transaction_date': instance.transactionDate?.toIso8601String(),
      'balance_before': instance.balanceBefore,
      'balance_after': instance.balanceAfter,
      'object_type': instance.objectType,
      'status': instance.status,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'reference_info': instance.referenceInfo,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
