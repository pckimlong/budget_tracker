// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tran_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TranWithBalance {
  Tran get tran => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TranWithBalanceCopyWith<TranWithBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranWithBalanceCopyWith<$Res> {
  factory $TranWithBalanceCopyWith(
          TranWithBalance value, $Res Function(TranWithBalance) then) =
      _$TranWithBalanceCopyWithImpl<$Res>;
  $Res call({Tran tran, double balance});

  $TranCopyWith<$Res> get tran;
}

/// @nodoc
class _$TranWithBalanceCopyWithImpl<$Res>
    implements $TranWithBalanceCopyWith<$Res> {
  _$TranWithBalanceCopyWithImpl(this._value, this._then);

  final TranWithBalance _value;
  // ignore: unused_field
  final $Res Function(TranWithBalance) _then;

  @override
  $Res call({
    Object? tran = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      tran: tran == freezed
          ? _value.tran
          : tran // ignore: cast_nullable_to_non_nullable
              as Tran,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $TranCopyWith<$Res> get tran {
    return $TranCopyWith<$Res>(_value.tran, (value) {
      return _then(_value.copyWith(tran: value));
    });
  }
}

/// @nodoc
abstract class _$$_TranWithBalanceCopyWith<$Res>
    implements $TranWithBalanceCopyWith<$Res> {
  factory _$$_TranWithBalanceCopyWith(
          _$_TranWithBalance value, $Res Function(_$_TranWithBalance) then) =
      __$$_TranWithBalanceCopyWithImpl<$Res>;
  @override
  $Res call({Tran tran, double balance});

  @override
  $TranCopyWith<$Res> get tran;
}

/// @nodoc
class __$$_TranWithBalanceCopyWithImpl<$Res>
    extends _$TranWithBalanceCopyWithImpl<$Res>
    implements _$$_TranWithBalanceCopyWith<$Res> {
  __$$_TranWithBalanceCopyWithImpl(
      _$_TranWithBalance _value, $Res Function(_$_TranWithBalance) _then)
      : super(_value, (v) => _then(v as _$_TranWithBalance));

  @override
  _$_TranWithBalance get _value => super._value as _$_TranWithBalance;

  @override
  $Res call({
    Object? tran = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_TranWithBalance(
      tran: tran == freezed
          ? _value.tran
          : tran // ignore: cast_nullable_to_non_nullable
              as Tran,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TranWithBalance implements _TranWithBalance {
  _$_TranWithBalance({required this.tran, required this.balance});

  @override
  final Tran tran;
  @override
  final double balance;

  @override
  String toString() {
    return 'TranWithBalance(tran: $tran, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TranWithBalance &&
            const DeepCollectionEquality().equals(other.tran, tran) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tran),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_TranWithBalanceCopyWith<_$_TranWithBalance> get copyWith =>
      __$$_TranWithBalanceCopyWithImpl<_$_TranWithBalance>(this, _$identity);
}

abstract class _TranWithBalance implements TranWithBalance {
  factory _TranWithBalance(
      {required final Tran tran,
      required final double balance}) = _$_TranWithBalance;

  @override
  Tran get tran;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_TranWithBalanceCopyWith<_$_TranWithBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
