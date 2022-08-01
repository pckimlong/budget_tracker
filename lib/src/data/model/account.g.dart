// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      totalBalance: (json['totalBalance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
    };

_$_BalanceResolver _$$_BalanceResolverFromJson(Map<String, dynamic> json) =>
    _$_BalanceResolver(
      amount: (json['amount'] as num).toDouble(),
      effectingDate: DateTime.parse(json['effectingDate'] as String),
    );

Map<String, dynamic> _$$_BalanceResolverToJson(_$_BalanceResolver instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'effectingDate': instance.effectingDate.toIso8601String(),
    };
