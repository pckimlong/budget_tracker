// ignore_for_file: invalid_annotation_target

import 'package:budget_tracker/src/data/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tran.freezed.dart';
part 'tran.g.dart';

typedef TranId = int;

@freezed
class Tran with _$Tran {
  static const idKey = "id";
  static const categoryIdKey = "category_id";
  static const dateKey = "date";
  static const noteKey = "note";
  static const amountKey = "amount";
  static const createdAtKey = "created_at";
  static const modifiedAtKey = "modified_at";

  factory Tran({
    @JsonKey(name: Tran.idKey) TranId? id,
    @JsonKey(name: Tran.categoryIdKey) required CategoryId categoryId,
    @JsonKey(name: Tran.dateKey) @JsonKey(name: Tran.dateKey) required DateTime date,
    @JsonKey(name: Tran.noteKey) @Default('') String note,
    @JsonKey(name: Tran.amountKey) required double amount,
    @JsonKey(name: Tran.createdAtKey) DateTime? createdAt,
    @JsonKey(name: Tran.modifiedAtKey) DateTime? modifiedAt,

    // read only
    @Default(0) double income,
    @Default(0) double expense,
    @Default(0) double balance,
  }) = _Tran;

  const Tran._();

  factory Tran.fromJson(Map<String, dynamic> json) => _$TranFromJson(json);

  // static int? _dateParserToJson(DateTime? dateTime) {
  //   return dateTime?.millisecondsSinceEpoch;
  // }

  // static DateTime? _dateParserFromJson(int? millisecondsSinceEpoch) {
  //   if (millisecondsSinceEpoch == null) return null;
  //   return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  // }

  // static int _dateParserToJsonNonNull(DateTime dateTime) {
  //   return dateTime.millisecondsSinceEpoch;
  // }

  // static DateTime _dateParserFromJsonNonNull(int millisecondsSinceEpoch) {
  //   return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  // }
}
