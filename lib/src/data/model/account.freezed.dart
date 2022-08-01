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
  double get totalBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call({double totalBalance});
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
  }) {
    return _then(_value.copyWith(
      totalBalance: totalBalance == freezed
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$_AccountCopyWith(
          _$_Account value, $Res Function(_$_Account) then) =
      __$$_AccountCopyWithImpl<$Res>;
  @override
  $Res call({double totalBalance});
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
  }) {
    return _then(_$_Account(
      totalBalance: totalBalance == freezed
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  _$_Account({this.totalBalance = 0});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  @JsonKey()
  final double totalBalance;

  @override
  String toString() {
    return 'Account(totalBalance: $totalBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Account &&
            const DeepCollectionEquality()
                .equals(other.totalBalance, totalBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(totalBalance));

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
  factory _Account({final double totalBalance}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  double get totalBalance;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCopyWith<_$_Account> get copyWith =>
      throw _privateConstructorUsedError;
}

BalanceResolver _$BalanceResolverFromJson(Map<String, dynamic> json) {
  return _BalanceResolver.fromJson(json);
}

/// @nodoc
mixin _$BalanceResolver {
  double get amount => throw _privateConstructorUsedError;

  /// balance resolver should being applied only if the transaction date is below
  /// [effectingDate]
  DateTime get effectingDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceResolverCopyWith<BalanceResolver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceResolverCopyWith<$Res> {
  factory $BalanceResolverCopyWith(
          BalanceResolver value, $Res Function(BalanceResolver) then) =
      _$BalanceResolverCopyWithImpl<$Res>;
  $Res call({double amount, DateTime effectingDate});
}

/// @nodoc
class _$BalanceResolverCopyWithImpl<$Res>
    implements $BalanceResolverCopyWith<$Res> {
  _$BalanceResolverCopyWithImpl(this._value, this._then);

  final BalanceResolver _value;
  // ignore: unused_field
  final $Res Function(BalanceResolver) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? effectingDate = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      effectingDate: effectingDate == freezed
          ? _value.effectingDate
          : effectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BalanceResolverCopyWith<$Res>
    implements $BalanceResolverCopyWith<$Res> {
  factory _$$_BalanceResolverCopyWith(
          _$_BalanceResolver value, $Res Function(_$_BalanceResolver) then) =
      __$$_BalanceResolverCopyWithImpl<$Res>;
  @override
  $Res call({double amount, DateTime effectingDate});
}

/// @nodoc
class __$$_BalanceResolverCopyWithImpl<$Res>
    extends _$BalanceResolverCopyWithImpl<$Res>
    implements _$$_BalanceResolverCopyWith<$Res> {
  __$$_BalanceResolverCopyWithImpl(
      _$_BalanceResolver _value, $Res Function(_$_BalanceResolver) _then)
      : super(_value, (v) => _then(v as _$_BalanceResolver));

  @override
  _$_BalanceResolver get _value => super._value as _$_BalanceResolver;

  @override
  $Res call({
    Object? amount = freezed,
    Object? effectingDate = freezed,
  }) {
    return _then(_$_BalanceResolver(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      effectingDate: effectingDate == freezed
          ? _value.effectingDate
          : effectingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceResolver implements _BalanceResolver {
  _$_BalanceResolver({required this.amount, required this.effectingDate});

  factory _$_BalanceResolver.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceResolverFromJson(json);

  @override
  final double amount;

  /// balance resolver should being applied only if the transaction date is below
  /// [effectingDate]
  @override
  final DateTime effectingDate;

  @override
  String toString() {
    return 'BalanceResolver(amount: $amount, effectingDate: $effectingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceResolver &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.effectingDate, effectingDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(effectingDate));

  @JsonKey(ignore: true)
  @override
  _$$_BalanceResolverCopyWith<_$_BalanceResolver> get copyWith =>
      __$$_BalanceResolverCopyWithImpl<_$_BalanceResolver>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceResolverToJson(
      this,
    );
  }
}

abstract class _BalanceResolver implements BalanceResolver {
  factory _BalanceResolver(
      {required final double amount,
      required final DateTime effectingDate}) = _$_BalanceResolver;

  factory _BalanceResolver.fromJson(Map<String, dynamic> json) =
      _$_BalanceResolver.fromJson;

  @override
  double get amount;
  @override

  /// balance resolver should being applied only if the transaction date is below
  /// [effectingDate]
  DateTime get effectingDate;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceResolverCopyWith<_$_BalanceResolver> get copyWith =>
      throw _privateConstructorUsedError;
}
