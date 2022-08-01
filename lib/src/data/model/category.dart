// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

enum CategoryType { income, expense }

typedef CategoryId = String;

@freezed
class Category with _$Category {
  static const createdAtKey = "createdAt";
  static const nameKey = "name";

  factory Category({
    CategoryId? id,
    required CategoryType type,
    @JsonKey(name: Category.nameKey) required String name,
    @JsonKey(name: Category.createdAtKey) DateTime? createdAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
