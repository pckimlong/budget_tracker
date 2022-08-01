// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_ExceptionCopyWith(
          _$_Exception value, $Res Function(_$_Exception) then) =
      __$$_ExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_ExceptionCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_ExceptionCopyWith<$Res> {
  __$$_ExceptionCopyWithImpl(
      _$_Exception _value, $Res Function(_$_Exception) _then)
      : super(_value, (v) => _then(v as _$_Exception));

  @override
  _$_Exception get _value => super._value as _$_Exception;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Exception(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Exception implements _Exception {
  const _$_Exception([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.exception(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exception &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ExceptionCopyWith<_$_Exception> get copyWith =>
      __$$_ExceptionCopyWithImpl<_$_Exception>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return exception(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return exception?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class _Exception implements Failure {
  const factory _Exception([final String? message]) = _$_Exception;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ExceptionCopyWith<_$_Exception> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AnauthorizedCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_AnauthorizedCopyWith(
          _$_Anauthorized value, $Res Function(_$_Anauthorized) then) =
      __$$_AnauthorizedCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_AnauthorizedCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_AnauthorizedCopyWith<$Res> {
  __$$_AnauthorizedCopyWithImpl(
      _$_Anauthorized _value, $Res Function(_$_Anauthorized) _then)
      : super(_value, (v) => _then(v as _$_Anauthorized));

  @override
  _$_Anauthorized get _value => super._value as _$_Anauthorized;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Anauthorized(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Anauthorized implements _Anauthorized {
  const _$_Anauthorized([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unauthorized(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Anauthorized &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_AnauthorizedCopyWith<_$_Anauthorized> get copyWith =>
      __$$_AnauthorizedCopyWithImpl<_$_Anauthorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Anauthorized implements Failure {
  const factory _Anauthorized([final String? message]) = _$_Anauthorized;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AnauthorizedCopyWith<_$_Anauthorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserNotFoundCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_UserNotFoundCopyWith(
          _$_UserNotFound value, $Res Function(_$_UserNotFound) then) =
      __$$_UserNotFoundCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_UserNotFoundCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_UserNotFoundCopyWith<$Res> {
  __$$_UserNotFoundCopyWithImpl(
      _$_UserNotFound _value, $Res Function(_$_UserNotFound) _then)
      : super(_value, (v) => _then(v as _$_UserNotFound));

  @override
  _$_UserNotFound get _value => super._value as _$_UserNotFound;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_UserNotFound(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserNotFound implements _UserNotFound {
  const _$_UserNotFound([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.userNotFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserNotFound &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_UserNotFoundCopyWith<_$_UserNotFound> get copyWith =>
      __$$_UserNotFoundCopyWithImpl<_$_UserNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return userNotFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return userNotFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements Failure {
  const factory _UserNotFound([final String? message]) = _$_UserNotFound;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_UserNotFoundCopyWith<_$_UserNotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AccountNotRegisteredCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_AccountNotRegisteredCopyWith(_$_AccountNotRegistered value,
          $Res Function(_$_AccountNotRegistered) then) =
      __$$_AccountNotRegisteredCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_AccountNotRegisteredCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$_AccountNotRegisteredCopyWith<$Res> {
  __$$_AccountNotRegisteredCopyWithImpl(_$_AccountNotRegistered _value,
      $Res Function(_$_AccountNotRegistered) _then)
      : super(_value, (v) => _then(v as _$_AccountNotRegistered));

  @override
  _$_AccountNotRegistered get _value => super._value as _$_AccountNotRegistered;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_AccountNotRegistered(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AccountNotRegistered implements _AccountNotRegistered {
  const _$_AccountNotRegistered([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.accountNotRegistered(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountNotRegistered &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_AccountNotRegisteredCopyWith<_$_AccountNotRegistered> get copyWith =>
      __$$_AccountNotRegisteredCopyWithImpl<_$_AccountNotRegistered>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return accountNotRegistered(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return accountNotRegistered?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (accountNotRegistered != null) {
      return accountNotRegistered(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return accountNotRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return accountNotRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (accountNotRegistered != null) {
      return accountNotRegistered(this);
    }
    return orElse();
  }
}

abstract class _AccountNotRegistered implements Failure {
  const factory _AccountNotRegistered([final String? message]) =
      _$_AccountNotRegistered;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AccountNotRegisteredCopyWith<_$_AccountNotRegistered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InternetErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_InternetErrorCopyWith(
          _$_InternetError value, $Res Function(_$_InternetError) then) =
      __$$_InternetErrorCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_InternetErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_InternetErrorCopyWith<$Res> {
  __$$_InternetErrorCopyWithImpl(
      _$_InternetError _value, $Res Function(_$_InternetError) _then)
      : super(_value, (v) => _then(v as _$_InternetError));

  @override
  _$_InternetError get _value => super._value as _$_InternetError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_InternetError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_InternetError implements _InternetError {
  const _$_InternetError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.internetError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternetError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_InternetErrorCopyWith<_$_InternetError> get copyWith =>
      __$$_InternetErrorCopyWithImpl<_$_InternetError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return internetError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return internetError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (internetError != null) {
      return internetError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return internetError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return internetError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (internetError != null) {
      return internetError(this);
    }
    return orElse();
  }
}

abstract class _InternetError implements Failure {
  const factory _InternetError([final String? message]) = _$_InternetError;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_InternetErrorCopyWith<_$_InternetError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidValueCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_InvalidValueCopyWith(
          _$_InvalidValue value, $Res Function(_$_InvalidValue) then) =
      __$$_InvalidValueCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_InvalidValueCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_InvalidValueCopyWith<$Res> {
  __$$_InvalidValueCopyWithImpl(
      _$_InvalidValue _value, $Res Function(_$_InvalidValue) _then)
      : super(_value, (v) => _then(v as _$_InvalidValue));

  @override
  _$_InvalidValue get _value => super._value as _$_InvalidValue;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_InvalidValue(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_InvalidValue implements _InvalidValue {
  const _$_InvalidValue([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.invalidValue(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidValue &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_InvalidValueCopyWith<_$_InvalidValue> get copyWith =>
      __$$_InvalidValueCopyWithImpl<_$_InvalidValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return invalidValue(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return invalidValue?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (invalidValue != null) {
      return invalidValue(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return invalidValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return invalidValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (invalidValue != null) {
      return invalidValue(this);
    }
    return orElse();
  }
}

abstract class _InvalidValue implements Failure {
  const factory _InvalidValue([final String? message]) = _$_InvalidValue;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_InvalidValueCopyWith<_$_InvalidValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UniqueConstraintCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_UniqueConstraintCopyWith(
          _$_UniqueConstraint value, $Res Function(_$_UniqueConstraint) then) =
      __$$_UniqueConstraintCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_UniqueConstraintCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$_UniqueConstraintCopyWith<$Res> {
  __$$_UniqueConstraintCopyWithImpl(
      _$_UniqueConstraint _value, $Res Function(_$_UniqueConstraint) _then)
      : super(_value, (v) => _then(v as _$_UniqueConstraint));

  @override
  _$_UniqueConstraint get _value => super._value as _$_UniqueConstraint;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_UniqueConstraint(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UniqueConstraint implements _UniqueConstraint {
  const _$_UniqueConstraint([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.uniqueConstraint(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniqueConstraint &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_UniqueConstraintCopyWith<_$_UniqueConstraint> get copyWith =>
      __$$_UniqueConstraintCopyWithImpl<_$_UniqueConstraint>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return uniqueConstraint(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return uniqueConstraint?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (uniqueConstraint != null) {
      return uniqueConstraint(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return uniqueConstraint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return uniqueConstraint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (uniqueConstraint != null) {
      return uniqueConstraint(this);
    }
    return orElse();
  }
}

abstract class _UniqueConstraint implements Failure {
  const factory _UniqueConstraint([final String? message]) =
      _$_UniqueConstraint;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_UniqueConstraintCopyWith<_$_UniqueConstraint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotFoundCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_NotFoundCopyWith(
          _$_NotFound value, $Res Function(_$_NotFound) then) =
      __$$_NotFoundCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_NotFoundCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_NotFoundCopyWith<$Res> {
  __$$_NotFoundCopyWithImpl(
      _$_NotFound _value, $Res Function(_$_NotFound) _then)
      : super(_value, (v) => _then(v as _$_NotFound));

  @override
  _$_NotFound get _value => super._value as _$_NotFound;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_NotFound(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotFound &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_NotFoundCopyWith<_$_NotFound> get copyWith =>
      __$$_NotFoundCopyWithImpl<_$_NotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) exception,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) userNotFound,
    required TResult Function(String? message) accountNotRegistered,
    required TResult Function(String? message) internetError,
    required TResult Function(String? message) invalidValue,
    required TResult Function(String? message) uniqueConstraint,
    required TResult Function(String? message) notFound,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? exception,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? userNotFound,
    TResult Function(String? message)? accountNotRegistered,
    TResult Function(String? message)? internetError,
    TResult Function(String? message)? invalidValue,
    TResult Function(String? message)? uniqueConstraint,
    TResult Function(String? message)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exception value) exception,
    required TResult Function(_Anauthorized value) unauthorized,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_AccountNotRegistered value) accountNotRegistered,
    required TResult Function(_InternetError value) internetError,
    required TResult Function(_InvalidValue value) invalidValue,
    required TResult Function(_UniqueConstraint value) uniqueConstraint,
    required TResult Function(_NotFound value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exception value)? exception,
    TResult Function(_Anauthorized value)? unauthorized,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_AccountNotRegistered value)? accountNotRegistered,
    TResult Function(_InternetError value)? internetError,
    TResult Function(_InvalidValue value)? invalidValue,
    TResult Function(_UniqueConstraint value)? uniqueConstraint,
    TResult Function(_NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements Failure {
  const factory _NotFound([final String? message]) = _$_NotFound;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotFoundCopyWith<_$_NotFound> get copyWith =>
      throw _privateConstructorUsedError;
}
