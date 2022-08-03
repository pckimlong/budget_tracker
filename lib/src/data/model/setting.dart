import 'package:budget_tracker/exports.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    @Default(5) int appAccentColorIndex,
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
}
