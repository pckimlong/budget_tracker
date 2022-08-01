import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

typedef UserId = String;

@freezed
class Account with _$Account {
  factory Account({
    @Default(0) double totalBalance,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

@freezed
class BalanceResolver with _$BalanceResolver {
  /// Allow to resovle earch balance of transaction. This help when previous balance has been
  /// modified and need to adjust to that. because we cannot read all balance again
  factory BalanceResolver({
    required double amount,

    /// balance resolver should being applied only if the transaction date is below
    /// [effectingDate]
    required DateTime effectingDate,
  }) = _BalanceResolver;

  factory BalanceResolver.fromJson(Map<String, dynamic> json) =>
      _$BalanceResolverFromJson(json);
}
