// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tran.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tran _$TranFromJson(Map<String, dynamic> json) {
  return _Tran.fromJson(json);
}

/// @nodoc
mixin _$Tran {
  @JsonKey(name: Tran.idKey)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.categoryIdKey)
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.dateKey)
  @JsonKey(name: Tran.dateKey)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.noteKey)
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.amountKey)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.createdAtKey)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: Tran.modifiedAtKey)
  DateTime? get modifiedAt => throw _privateConstructorUsedError; // read only
  double get income => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranCopyWith<Tran> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranCopyWith<$Res> {
  factory $TranCopyWith(Tran value, $Res Function(Tran) then) =
      _$TranCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: Tran.idKey) int? id,
      @JsonKey(name: Tran.categoryIdKey) int categoryId,
      @JsonKey(name: Tran.dateKey) @JsonKey(name: Tran.dateKey) DateTime date,
      @JsonKey(name: Tran.noteKey) String note,
      @JsonKey(name: Tran.amountKey) double amount,
      @JsonKey(name: Tran.createdAtKey) DateTime? createdAt,
      @JsonKey(name: Tran.modifiedAtKey) DateTime? modifiedAt,
      double income,
      double expense,
      double balance});
}

/// @nodoc
class _$TranCopyWithImpl<$Res> implements $TranCopyWith<$Res> {
  _$TranCopyWithImpl(this._value, this._then);

  final Tran _value;
  // ignore: unused_field
  final $Res Function(Tran) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? date = freezed,
    Object? note = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? income = freezed,
    Object? expense = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      income: income == freezed
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: expense == freezed
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_TranCopyWith<$Res> implements $TranCopyWith<$Res> {
  factory _$$_TranCopyWith(_$_Tran value, $Res Function(_$_Tran) then) =
      __$$_TranCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: Tran.idKey) int? id,
      @JsonKey(name: Tran.categoryIdKey) int categoryId,
      @JsonKey(name: Tran.dateKey) @JsonKey(name: Tran.dateKey) DateTime date,
      @JsonKey(name: Tran.noteKey) String note,
      @JsonKey(name: Tran.amountKey) double amount,
      @JsonKey(name: Tran.createdAtKey) DateTime? createdAt,
      @JsonKey(name: Tran.modifiedAtKey) DateTime? modifiedAt,
      double income,
      double expense,
      double balance});
}

/// @nodoc
class __$$_TranCopyWithImpl<$Res> extends _$TranCopyWithImpl<$Res>
    implements _$$_TranCopyWith<$Res> {
  __$$_TranCopyWithImpl(_$_Tran _value, $Res Function(_$_Tran) _then)
      : super(_value, (v) => _then(v as _$_Tran));

  @override
  _$_Tran get _value => super._value as _$_Tran;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? date = freezed,
    Object? note = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? income = freezed,
    Object? expense = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_Tran(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      income: income == freezed
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: expense == freezed
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tran extends _Tran {
  _$_Tran(
      {@JsonKey(name: Tran.idKey)
          this.id,
      @JsonKey(name: Tran.categoryIdKey)
          required this.categoryId,
      @JsonKey(name: Tran.dateKey)
      @JsonKey(name: Tran.dateKey)
          required this.date,
      @JsonKey(name: Tran.noteKey)
          this.note = '',
      @JsonKey(name: Tran.amountKey)
          required this.amount,
      @JsonKey(name: Tran.createdAtKey)
          this.createdAt,
      @JsonKey(name: Tran.modifiedAtKey)
          this.modifiedAt,
      this.income = 0,
      this.expense = 0,
      this.balance = 0})
      : super._();

  factory _$_Tran.fromJson(Map<String, dynamic> json) => _$$_TranFromJson(json);

  @override
  @JsonKey(name: Tran.idKey)
  final int? id;
  @override
  @JsonKey(name: Tran.categoryIdKey)
  final int categoryId;
  @override
  @JsonKey(name: Tran.dateKey)
  @JsonKey(name: Tran.dateKey)
  final DateTime date;
  @override
  @JsonKey(name: Tran.noteKey)
  final String note;
  @override
  @JsonKey(name: Tran.amountKey)
  final double amount;
  @override
  @JsonKey(name: Tran.createdAtKey)
  final DateTime? createdAt;
  @override
  @JsonKey(name: Tran.modifiedAtKey)
  final DateTime? modifiedAt;
// read only
  @override
  @JsonKey()
  final double income;
  @override
  @JsonKey()
  final double expense;
  @override
  @JsonKey()
  final double balance;

  @override
  String toString() {
    return 'Tran(id: $id, categoryId: $categoryId, date: $date, note: $note, amount: $amount, createdAt: $createdAt, modifiedAt: $modifiedAt, income: $income, expense: $expense, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tran &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.modifiedAt, modifiedAt) &&
            const DeepCollectionEquality().equals(other.income, income) &&
            const DeepCollectionEquality().equals(other.expense, expense) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(modifiedAt),
      const DeepCollectionEquality().hash(income),
      const DeepCollectionEquality().hash(expense),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_TranCopyWith<_$_Tran> get copyWith =>
      __$$_TranCopyWithImpl<_$_Tran>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TranToJson(
      this,
    );
  }
}

abstract class _Tran extends Tran {
  factory _Tran(
      {@JsonKey(name: Tran.idKey)
          final int? id,
      @JsonKey(name: Tran.categoryIdKey)
          required final int categoryId,
      @JsonKey(name: Tran.dateKey)
      @JsonKey(name: Tran.dateKey)
          required final DateTime date,
      @JsonKey(name: Tran.noteKey)
          final String note,
      @JsonKey(name: Tran.amountKey)
          required final double amount,
      @JsonKey(name: Tran.createdAtKey)
          final DateTime? createdAt,
      @JsonKey(name: Tran.modifiedAtKey)
          final DateTime? modifiedAt,
      final double income,
      final double expense,
      final double balance}) = _$_Tran;
  _Tran._() : super._();

  factory _Tran.fromJson(Map<String, dynamic> json) = _$_Tran.fromJson;

  @override
  @JsonKey(name: Tran.idKey)
  int? get id;
  @override
  @JsonKey(name: Tran.categoryIdKey)
  int get categoryId;
  @override
  @JsonKey(name: Tran.dateKey)
  @JsonKey(name: Tran.dateKey)
  DateTime get date;
  @override
  @JsonKey(name: Tran.noteKey)
  String get note;
  @override
  @JsonKey(name: Tran.amountKey)
  double get amount;
  @override
  @JsonKey(name: Tran.createdAtKey)
  DateTime? get createdAt;
  @override
  @JsonKey(name: Tran.modifiedAtKey)
  DateTime? get modifiedAt;
  @override // read only
  double get income;
  @override
  double get expense;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_TranCopyWith<_$_Tran> get copyWith => throw _privateConstructorUsedError;
}
