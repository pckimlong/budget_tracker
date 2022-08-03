// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tran _$$_TranFromJson(Map<String, dynamic> json) => _$_Tran(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String,
      date: Tran._dateParserFromJsonNonNull(json['date'] as int),
      note: json['note'] as String? ?? '',
      amount: (json['amount'] as num).toDouble(),
      createdAt: Tran._dateParserFromJson(json['createdAt'] as int?),
      modifiedAt: Tran._dateParserFromJson(json['modifiedAt'] as int?),
    );

Map<String, dynamic> _$$_TranToJson(_$_Tran instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'date': Tran._dateParserToJsonNonNull(instance.date),
      'note': instance.note,
      'amount': instance.amount,
      'createdAt': Tran._dateParserToJson(instance.createdAt),
      'modifiedAt': Tran._dateParserToJson(instance.modifiedAt),
    };
