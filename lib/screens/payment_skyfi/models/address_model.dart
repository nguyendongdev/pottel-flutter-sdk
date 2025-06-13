import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String id,
    required String name,
    String? parentId,
    @Default(0) int level, // 0: Province, 1: District, 2: Ward
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
class SelectedAddress with _$SelectedAddress {
  const factory SelectedAddress({
    AddressModel? province,
    AddressModel? district,
    AddressModel? ward,
  }) = _SelectedAddress;

  factory SelectedAddress.fromJson(Map<String, dynamic> json) =>
      _$SelectedAddressFromJson(json);
}
