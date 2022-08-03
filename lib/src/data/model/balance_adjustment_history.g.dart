// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_adjustment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceAdjustmentHistory _$$_BalanceAdjustmentHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_BalanceAdjustmentHistory(
      id: json['id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      oldBalance: (json['oldBalance'] as num?)?.toDouble(),
      newBalance: (json['newBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BalanceAdjustmentHistoryToJson(
        _$_BalanceAdjustmentHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'oldBalance': instance.oldBalance,
      'newBalance': instance.newBalance,
    };
