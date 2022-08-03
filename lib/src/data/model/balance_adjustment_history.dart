import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_adjustment_history.freezed.dart';
part 'balance_adjustment_history.g.dart';

@freezed
class BalanceAdjustmentHistory with _$BalanceAdjustmentHistory {
  factory BalanceAdjustmentHistory({
    String? id,
    DateTime? date,
    double? oldBalance,
    required double newBalance,
  }) = _BalanceAdjustmentHistory;

  factory BalanceAdjustmentHistory.fromJson(Map<String, dynamic> json) =>
      _$BalanceAdjustmentHistoryFromJson(json);
}
