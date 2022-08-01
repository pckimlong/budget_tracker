// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tran _$$_TranFromJson(Map<String, dynamic> json) => _$_Tran(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
      amount: (json['amount'] as num).toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
    );

Map<String, dynamic> _$$_TranToJson(_$_Tran instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'amount': instance.amount,
      'balance': instance.balance,
      'createdAt': instance.createdAt?.toIso8601String(),
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
    };
