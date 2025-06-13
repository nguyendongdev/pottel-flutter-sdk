import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'respone_cards_ekyc.freezed.dart';
part 'respone_cards_ekyc.g.dart';

@freezed
class ResponeCardsEkyc with _$ResponeCardsEkyc {
  factory ResponeCardsEkyc({
    String? requestId,
    int? code,
    String? message,
    int? totalRecords,
    Result? result,
    dynamic extra,
  }) = _ResponeCardsEkyc;

  factory ResponeCardsEkyc.fromJson(Map<String, dynamic> json) =>
      _$ResponeCardsEkycFromJson(json);
}
