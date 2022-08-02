// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tran _$$_TranFromJson(Map<String, dynamic> json) => _$_Tran(
      id: json['id'] as int?,
      categoryId: json['category_id'] as int,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
      amount: (json['amount'] as num).toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      income: (json['income'] as num?)?.toDouble() ?? 0,
      expense: (json['expense'] as num?)?.toDouble() ?? 0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_TranToJson(_$_Tran instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'amount': instance.amount,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
      'income': instance.income,
      'expense': instance.expense,
      'balance': instance.balance,
    };
