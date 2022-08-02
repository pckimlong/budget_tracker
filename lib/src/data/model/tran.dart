// ignore_for_file: invalid_annotation_target

import 'package:budget_tracker/src/data/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tran.freezed.dart';
part 'tran.g.dart';

typedef TranId = String;

@freezed
class Tran with _$Tran {
  factory Tran({
    TranId? id,
    required CategoryId categoryId,
    CategoryType? type,
    @JsonKey(name: Tran.dateKey, fromJson: Tran._dateParserFromJsonNonNull, toJson: Tran._dateParserToJsonNonNull)
        required DateTime date,
    @Default('') String note,
    required double amount,
    @JsonKey(name: Tran.createdAtKey, fromJson: Tran._dateParserFromJson, toJson: Tran._dateParserToJson)
        DateTime? createdAt,
    @JsonKey(fromJson: Tran._dateParserFromJson, toJson: Tran._dateParserToJson)
        DateTime? modifiedAt,
  }) = _Tran;

  const Tran._();

  factory Tran.fromJson(Map<String, dynamic> json) => _$TranFromJson(json);

  static const createdAtKey = "createdAt";
  static const dateKey = "date";

  static int? _dateParserToJson(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch;
  }

  static DateTime? _dateParserFromJson(int? millisecondsSinceEpoch) {
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  static int _dateParserToJsonNonNull(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime _dateParserFromJsonNonNull(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}
