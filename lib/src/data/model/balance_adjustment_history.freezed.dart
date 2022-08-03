// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'balance_adjustment_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceAdjustmentHistory _$BalanceAdjustmentHistoryFromJson(
    Map<String, dynamic> json) {
  return _BalanceAdjustmentHistory.fromJson(json);
}

/// @nodoc
mixin _$BalanceAdjustmentHistory {
  String? get id => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  double? get oldBalance => throw _privateConstructorUsedError;
  double get newBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceAdjustmentHistoryCopyWith<BalanceAdjustmentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceAdjustmentHistoryCopyWith<$Res> {
  factory $BalanceAdjustmentHistoryCopyWith(BalanceAdjustmentHistory value,
          $Res Function(BalanceAdjustmentHistory) then) =
      _$BalanceAdjustmentHistoryCopyWithImpl<$Res>;
  $Res call(
      {String? id, DateTime? date, double? oldBalance, double newBalance});
}

/// @nodoc
class _$BalanceAdjustmentHistoryCopyWithImpl<$Res>
    implements $BalanceAdjustmentHistoryCopyWith<$Res> {
  _$BalanceAdjustmentHistoryCopyWithImpl(this._value, this._then);

  final BalanceAdjustmentHistory _value;
  // ignore: unused_field
  final $Res Function(BalanceAdjustmentHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? oldBalance = freezed,
    Object? newBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldBalance: oldBalance == freezed
          ? _value.oldBalance
          : oldBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      newBalance: newBalance == freezed
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_BalanceAdjustmentHistoryCopyWith<$Res>
    implements $BalanceAdjustmentHistoryCopyWith<$Res> {
  factory _$$_BalanceAdjustmentHistoryCopyWith(
          _$_BalanceAdjustmentHistory value,
          $Res Function(_$_BalanceAdjustmentHistory) then) =
      __$$_BalanceAdjustmentHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, DateTime? date, double? oldBalance, double newBalance});
}

/// @nodoc
class __$$_BalanceAdjustmentHistoryCopyWithImpl<$Res>
    extends _$BalanceAdjustmentHistoryCopyWithImpl<$Res>
    implements _$$_BalanceAdjustmentHistoryCopyWith<$Res> {
  __$$_BalanceAdjustmentHistoryCopyWithImpl(_$_BalanceAdjustmentHistory _value,
      $Res Function(_$_BalanceAdjustmentHistory) _then)
      : super(_value, (v) => _then(v as _$_BalanceAdjustmentHistory));

  @override
  _$_BalanceAdjustmentHistory get _value =>
      super._value as _$_BalanceAdjustmentHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? oldBalance = freezed,
    Object? newBalance = freezed,
  }) {
    return _then(_$_BalanceAdjustmentHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldBalance: oldBalance == freezed
          ? _value.oldBalance
          : oldBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      newBalance: newBalance == freezed
          ? _value.newBalance
          : newBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceAdjustmentHistory implements _BalanceAdjustmentHistory {
  _$_BalanceAdjustmentHistory(
      {this.id, this.date, this.oldBalance, required this.newBalance});

  factory _$_BalanceAdjustmentHistory.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceAdjustmentHistoryFromJson(json);

  @override
  final String? id;
  @override
  final DateTime? date;
  @override
  final double? oldBalance;
  @override
  final double newBalance;

  @override
  String toString() {
    return 'BalanceAdjustmentHistory(id: $id, date: $date, oldBalance: $oldBalance, newBalance: $newBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceAdjustmentHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.oldBalance, oldBalance) &&
            const DeepCollectionEquality()
                .equals(other.newBalance, newBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(oldBalance),
      const DeepCollectionEquality().hash(newBalance));

  @JsonKey(ignore: true)
  @override
  _$$_BalanceAdjustmentHistoryCopyWith<_$_BalanceAdjustmentHistory>
      get copyWith => __$$_BalanceAdjustmentHistoryCopyWithImpl<
          _$_BalanceAdjustmentHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceAdjustmentHistoryToJson(
      this,
    );
  }
}

abstract class _BalanceAdjustmentHistory implements BalanceAdjustmentHistory {
  factory _BalanceAdjustmentHistory(
      {final String? id,
      final DateTime? date,
      final double? oldBalance,
      required final double newBalance}) = _$_BalanceAdjustmentHistory;

  factory _BalanceAdjustmentHistory.fromJson(Map<String, dynamic> json) =
      _$_BalanceAdjustmentHistory.fromJson;

  @override
  String? get id;
  @override
  DateTime? get date;
  @override
  double? get oldBalance;
  @override
  double get newBalance;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceAdjustmentHistoryCopyWith<_$_BalanceAdjustmentHistory>
      get copyWith => throw _privateConstructorUsedError;
}
