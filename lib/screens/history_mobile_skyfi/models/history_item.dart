import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_item.freezed.dart';

@freezed
class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    required String title,
    required String dateTime,
    required String amount,
    String? duration,
  }) = _HistoryItem;
}
