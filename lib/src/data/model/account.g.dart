// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      totalBalance: (json['totalBalance'] as num?)?.toDouble() ?? 0,
      setting: json['setting'] == null
          ? const Setting()
          : Setting.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'setting': instance.setting,
    };
