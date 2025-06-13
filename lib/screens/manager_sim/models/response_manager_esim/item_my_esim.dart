import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'item_my_esim.g.dart';

@JsonSerializable()
class ItemMyEsim {
  String? iccid;
  String? status;
  @JsonKey(name: 'data_amount')
  int? dataAmount;
  @JsonKey(name: 'data_unit')
  String? dataUnit;
  @JsonKey(name: 'validity_days')
  int? validityDays;
  String? qrcode;
  @JsonKey(name: 'qrcode_url')
  String? qrcodeUrl;
  @JsonKey(name: 'region_id')
  int? regionId;
  @JsonKey(name: 'region_name')
  String? regionName;
  @JsonKey(name: 'provider_name')
  String? providerName;
  DataMyEsim? data;

  ItemMyEsim({
    this.iccid,
    this.status,
    this.dataAmount,
    this.dataUnit,
    this.validityDays,
    this.qrcode,
    this.qrcodeUrl,
    this.regionId,
    this.regionName,
    this.providerName,
    this.data,
  });

  @override
  String toString() {
    return 'List(iccid: $iccid, status: $status, dataAmount: $dataAmount, dataUnit: $dataUnit, validityDays: $validityDays, qrcode: $qrcode, qrcodeUrl: $qrcodeUrl, regionId: $regionId, regionName: $regionName, providerName: $providerName, data: $data)';
  }

  factory ItemMyEsim.fromJson(Map<String, dynamic> json) =>
      _$ItemMyEsimFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyEsimToJson(this);

  ItemMyEsim copyWith({
    String? iccid,
    String? status,
    int? dataAmount,
    String? dataUnit,
    int? validityDays,
    String? qrcode,
    String? qrcodeUrl,
    int? regionId,
    String? regionName,
    String? providerName,
    DataMyEsim? data,
  }) {
    return ItemMyEsim(
      iccid: iccid ?? this.iccid,
      status: status ?? this.status,
      dataAmount: dataAmount ?? this.dataAmount,
      dataUnit: dataUnit ?? this.dataUnit,
      validityDays: validityDays ?? this.validityDays,
      qrcode: qrcode ?? this.qrcode,
      qrcodeUrl: qrcodeUrl ?? this.qrcodeUrl,
      regionId: regionId ?? this.regionId,
      regionName: regionName ?? this.regionName,
      providerName: providerName ?? this.providerName,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ItemMyEsim) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      iccid.hashCode ^
      status.hashCode ^
      dataAmount.hashCode ^
      dataUnit.hashCode ^
      validityDays.hashCode ^
      qrcode.hashCode ^
      qrcodeUrl.hashCode ^
      regionId.hashCode ^
      regionName.hashCode ^
      providerName.hashCode ^
      data.hashCode;
}
