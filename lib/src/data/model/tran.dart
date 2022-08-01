import 'package:budget_tracker/src/data/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) = _Tran;

  factory Tran.fromJson(Map<String, dynamic> json) => _$TranFromJson(json);
}
