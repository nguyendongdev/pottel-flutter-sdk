import 'package:freezed_annotation/freezed_annotation.dart';

part 'topup_amount.freezed.dart';

@freezed
class TopupAmount with _$TopupAmount {
  const factory TopupAmount({
    required int amount,
    @Default(false) bool isSelected,
  }) = _TopupAmount;
}
