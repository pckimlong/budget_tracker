// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

typedef UserId = int;

@freezed
class Account with _$Account {
  static const totalBalanceKey = "totalBalance";

  factory Account({
    @JsonKey(name: Account.totalBalanceKey) @Default(0) double totalBalance,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
