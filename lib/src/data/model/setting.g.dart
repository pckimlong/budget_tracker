// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setting _$$_SettingFromJson(Map<String, dynamic> json) => _$_Setting(
      appAccentColorIndex: json['appAccentColorIndex'] as int? ?? 5,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.light,
    );

Map<String, dynamic> _$$_SettingToJson(_$_Setting instance) =>
    <String, dynamic>{
      'appAccentColorIndex': instance.appAccentColorIndex,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
