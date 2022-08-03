// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  @JsonKey(name: Account.totalBalanceKey)
  @JsonKey(name: Account.totalBalanceKey)
  double get totalBalance => throw _privateConstructorUsedError;
  Setting get setting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: Account.totalBalanceKey)
      @JsonKey(name: Account.totalBalanceKey)
          double totalBalance,
      Setting setting});

  $SettingCopyWith<$Res> get setting;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  final Account _value;
  // ignore: unused_field
  final $Res Function(Account) _then;

  @override
  $Res call({
    Object? totalBalance = freezed,
    Object? setting = freezed,
  }) {
    return _then(_value.copyWith(
      totalBalance: totalBalance == freezed
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting,
    ));
  }

  @override
  $SettingCopyWith<$Res> get setting {
    return $SettingCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: Account.totalBalanceKey)
      @JsonKey(name: Account.totalBalanceKey)
          double totalBalance,
      Setting setting});

  @override
  $SettingCopyWith<$Res> get setting;
}

/// @nodoc
class __$$_AccountCopyWithImpl<$Res> extends _$AccountCopyWithImpl<$Res>
    implements _$$_AccountCopyWith<$Res> {
  __$$_AccountCopyWithImpl(_$_Account _value, $Res Function(_$_Account) _then)
      : super(_value, (v) => _then(v as _$_Account));

  @override
  _$_Account get _value => super._value as _$_Account;

  @override
  $Res call({
    Object? totalBalance = freezed,
    Object? setting = freezed,
  }) {
    return _then(_$_Account(
      totalBalance: totalBalance == freezed
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  _$_Account(
      {@JsonKey(name: Account.totalBalanceKey)
      @JsonKey(name: Account.totalBalanceKey)
          this.totalBalance = 0,
      this.setting = const Setting()});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  @JsonKey(name: Account.totalBalanceKey)
  @JsonKey(name: Account.totalBalanceKey)
  final double totalBalance;
  @override
  @JsonKey()
  final Setting setting;

  @override
  String toString() {
    return 'Account(totalBalance: $totalBalance, setting: $setting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            const DeepCollectionEquality()
                .equals(other.totalBalance, totalBalance) &&
            const DeepCollectionEquality().equals(other.setting, setting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalBalance),
      const DeepCollectionEquality().hash(setting));

  @JsonKey(ignore: true)
  @override
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      __$$_AccountCopyWithImpl<_$_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  factory _Account(
      {@JsonKey(name: Account.totalBalanceKey)
      @JsonKey(name: Account.totalBalanceKey)
          final double totalBalance,
      final Setting setting}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  @JsonKey(name: Account.totalBalanceKey)
  @JsonKey(name: Account.totalBalanceKey)
  double get totalBalance;
  @override
  Setting get setting;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}
