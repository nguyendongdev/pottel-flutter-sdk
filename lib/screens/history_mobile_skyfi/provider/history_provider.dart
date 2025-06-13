import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skyfi_sdk/screens/history_mobile_skyfi/services/historyService.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../models/history_item.dart';

part 'history_provider.g.dart';

enum HistoryTab {
  topup,
  service,
  call,
}

@riverpod
class SelectedHistoryTab extends _$SelectedHistoryTab {
  @override
  HistoryTab build() => HistoryTab.topup;
}

@riverpod
class TopupHistory extends _$TopupHistory {
  @override
  List<HistoryItem> build() {
    return [];
  }

  Future<void> getTopupHistory() async {
    try {
      final history = await Historyservice().getHistory();
      state = history.map((item) {
        return HistoryItem(
          title: 'Nạp tiền ',
          dateTime: item.transactionDate?.toString() ?? 'Unknown',
          amount: '+${Common.formatCurrency(item.amount.toString())} VND',
        );
      }).toList();
    } catch (e) {}
  }
}

@riverpod
class ServiceHistory extends _$ServiceHistory {
  @override
  List<HistoryItem> build() {
    return [];
  }

  String _formatDateTime(String dateTime) {
    // Assuming dateTime is in ISO 8601 format, e.g., "2023-10-01T12:00:00Z"
    final date = DateTime.parse(dateTime);
    return ' ${date.hour}:${date.minute} ${date.day}/${date.month}/${date.year}';
  }

  Future<void> getServiceHistory() async {
    try {
      final history = await Historyservice().getPackageHistory();
      state = history.map((item) {
        return HistoryItem(
          title: 'Mua gói cước ${item.packCode}',
          dateTime: _formatDateTime(item.transactionDate!),
          amount: '-${Common.formatCurrency(item.price.toString())} VND',
        );
      }).toList();
    } catch (e) {}
  }
}

@riverpod
class CallHistory extends _$CallHistory {
  @override
  List<HistoryItem> build() {
    return [
      const HistoryItem(
        title: '0987223731',
        dateTime: '09:26:01',
        amount: '-1.349 VND',
        duration: '01:08',
      ),
      const HistoryItem(
        title: '0772 123 555',
        dateTime: '09:26:01',
        amount: '-89 VND',
        duration: '00:08',
      ),
      const HistoryItem(
        title: '0772 123 555',
        dateTime: '09:26:01',
        amount: '-89 VND',
        duration: '00:08',
      ),
    ];
  }
}
