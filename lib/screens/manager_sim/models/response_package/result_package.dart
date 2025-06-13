import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_package.g.dart';

@JsonSerializable()
class ResultPackage {
  String? id;
  String? type;
  int? price;
  int? amount;
  int? day;
  @JsonKey(name: 'is_unlimited')
  bool? isUnlimited;
  String? title;
  String? data;
  @JsonKey(name: 'short_info')
  dynamic shortInfo;
  dynamic voice;
  dynamic text;
  @JsonKey(name: 'net_price')
  int? netPrice;
  String? name;
  @JsonKey(name: 'selling_price')
  int? sellingPrice;
  String? currency;
  @JsonKey(name: 'product_id')
  int? productId;

  ResultPackage({
    this.id,
    this.type,
    this.price,
    this.amount,
    this.day,
    this.isUnlimited,
    this.title,
    this.data,
    this.shortInfo,
    this.voice,
    this.text,
    this.netPrice,
    this.name,
    this.sellingPrice,
    this.currency,
    this.productId,
  });

  @override
  String toString() {
    return 'Result(id: $id, type: $type, price: $price, amount: $amount, day: $day, isUnlimited: $isUnlimited, title: $title, data: $data, shortInfo: $shortInfo, voice: $voice, text: $text, netPrice: $netPrice, name: $name, sellingPrice: $sellingPrice, currency: $currency, productId: $productId)';
  }

  factory ResultPackage.fromJson(Map<String, dynamic> json) {
    return _$ResultPackageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultPackageToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResultPackage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      price.hashCode ^
      amount.hashCode ^
      day.hashCode ^
      isUnlimited.hashCode ^
      title.hashCode ^
      data.hashCode ^
      shortInfo.hashCode ^
      voice.hashCode ^
      text.hashCode ^
      netPrice.hashCode ^
      name.hashCode ^
      sellingPrice.hashCode ^
      currency.hashCode ^
      productId.hashCode;
}
