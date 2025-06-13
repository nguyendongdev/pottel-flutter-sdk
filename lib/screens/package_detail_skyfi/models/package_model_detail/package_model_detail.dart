import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'package_model_detail.freezed.dart';
part 'package_model_detail.g.dart';

@freezed
class PackageModelDetail with _$PackageModelDetail {
  factory PackageModelDetail({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _PackageModelDetail;

  factory PackageModelDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageModelDetailFromJson(json);
}
