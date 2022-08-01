import 'package:budget_tracker/src/data/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'account.dart';

part 'tran.freezed.dart';
part 'tran.g.dart';

typedef TranId = String;

@freezed
class Tran with _$Tran {
  const Tran._();

  factory Tran({
    TranId? id,
    required CategoryId categoryId,
    required DateTime date,
    @Default('') String note,
    required double amount,
    double? balance,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) = _Tran;

  double? resolvedBalance(BalanceResolver resolver) {
    if (balance == null) return null;
    if (modifiedAt == null) return balance;

    final modifiedTime = modifiedAt!;
    final resolvedTime = resolver.effectingDate;

    if (modifiedTime.isBefore(resolvedTime)) {
      return balance! + 10;
    }

    return balance;
  }

  factory Tran.fromJson(Map<String, dynamic> json) => _$TranFromJson(json);
}
