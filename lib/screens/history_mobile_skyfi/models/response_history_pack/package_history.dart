import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_history.g.dart';

@JsonSerializable()
class PackageHistory {
  final int? id;
  final String? msisdn;
  @JsonKey(name: 'pack_code')
  final String? packCode;
  final int? price;
  @JsonKey(name: 'transaction_date')
  final String? transactionDate;
  final String? description;
  final String? status;

  const PackageHistory({
    this.id,
    this.msisdn,
    this.packCode,
    this.price,
    this.transactionDate,
    this.description,
    this.status,
  });

  @override
  String toString() {
    return 'Result(id: $id, msisdn: $msisdn, packCode: $packCode, price: $price, transactionDate: $transactionDate, description: $description, status: $status)';
  }

  factory PackageHistory.fromJson(Map<String, dynamic> json) {
    return _$PackageHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PackageHistoryToJson(this);

  PackageHistory copyWith({
    int? id,
    String? msisdn,
    String? packCode,
    int? price,
    String? transactionDate,
    String? description,
    String? status,
  }) {
    return PackageHistory(
      id: id ?? this.id,
      msisdn: msisdn ?? this.msisdn,
      packCode: packCode ?? this.packCode,
      price: price ?? this.price,
      transactionDate: transactionDate ?? this.transactionDate,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PackageHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      msisdn.hashCode ^
      packCode.hashCode ^
      price.hashCode ^
      transactionDate.hashCode ^
      description.hashCode ^
      status.hashCode;
}
