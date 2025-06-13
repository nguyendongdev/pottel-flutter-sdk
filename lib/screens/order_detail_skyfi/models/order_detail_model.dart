import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    @JsonKey(name: 'order_code') required String orderCode,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'total_usim') required int totalUsim,
    @JsonKey(name: 'total_esim') required int totalEsim,
    @JsonKey(name: 'total_esim_travel') required int totalEsimTravel,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}

@freezed
class OrderDetailResponse with _$OrderDetailResponse {
  const factory OrderDetailResponse({
    String? requestId,
    required int code,
    required String message,
    @JsonKey(name: 'totalRecords') int? totalRecords,
    required OrderDetailResult result,
    dynamic extra,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);
}

@freezed
class OrderDetailResult with _$OrderDetailResult {
  const factory OrderDetailResult({
    required OrderDetailModel order,
  }) = _OrderDetailResult;

  factory OrderDetailResult.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResultFromJson(json);
}
