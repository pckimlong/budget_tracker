// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return _Setting.fromJson(json);
}

/// @nodoc
mixin _$Setting {
  int get appAccentColorIndex => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingCopyWith<Setting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res>;
  $Res call({int appAccentColorIndex, ThemeMode themeMode});
}

/// @nodoc
class _$SettingCopyWithImpl<$Res> implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  final Setting _value;
  // ignore: unused_field
  final $Res Function(Setting) _then;

  @override
  $Res call({
    Object? appAccentColorIndex = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      appAccentColorIndex: appAccentColorIndex == freezed
          ? _value.appAccentColorIndex
          : appAccentColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$$_SettingCopyWith(
          _$_Setting value, $Res Function(_$_Setting) then) =
      __$$_SettingCopyWithImpl<$Res>;
  @override
  $Res call({int appAccentColorIndex, ThemeMode themeMode});
}

/// @nodoc
class __$$_SettingCopyWithImpl<$Res> extends _$SettingCopyWithImpl<$Res>
    implements _$$_SettingCopyWith<$Res> {
  __$$_SettingCopyWithImpl(_$_Setting _value, $Res Function(_$_Setting) _then)
      : super(_value, (v) => _then(v as _$_Setting));

  @override
  _$_Setting get _value => super._value as _$_Setting;

  @override
  $Res call({
    Object? appAccentColorIndex = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_$_Setting(
      appAccentColorIndex: appAccentColorIndex == freezed
          ? _value.appAccentColorIndex
          : appAccentColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Setting implements _Setting {
  const _$_Setting(
      {this.appAccentColorIndex = 5, this.themeMode = ThemeMode.light});

  factory _$_Setting.fromJson(Map<String, dynamic> json) =>
      _$$_SettingFromJson(json);

  @override
  @JsonKey()
  final int appAccentColorIndex;
  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'Setting(appAccentColorIndex: $appAccentColorIndex, themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Setting &&
            const DeepCollectionEquality()
                .equals(other.appAccentColorIndex, appAccentColorIndex) &&
            const DeepCollectionEquality().equals(other.themeMode, themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appAccentColorIndex),
      const DeepCollectionEquality().hash(themeMode));

  @JsonKey(ignore: true)
  @override
  _$$_SettingCopyWith<_$_Setting> get copyWith =>
      __$$_SettingCopyWithImpl<_$_Setting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingToJson(
      this,
    );
  }
}

abstract class _Setting implements Setting {
  const factory _Setting(
      {final int appAccentColorIndex, final ThemeMode themeMode}) = _$_Setting;

  factory _Setting.fromJson(Map<String, dynamic> json) = _$_Setting.fromJson;

  @override
  int get appAccentColorIndex;
  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_SettingCopyWith<_$_Setting> get copyWith =>
      throw _privateConstructorUsedError;
}
