import '../../exports.dart';

part "app_failure.freezed.dart";

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure.exception([String? message]) = _Exception;
  const factory Failure.unauthorized([String? message]) = _Anauthorized;
  const factory Failure.userNotFound([String? message]) = _UserNotFound;
  const factory Failure.accountNotRegistered([String? message]) = _AccountNotRegistered;
  const factory Failure.internetError([String? message]) = _InternetError;
  const factory Failure.invalidValue([String? message]) = _InvalidValue;
  const factory Failure.uniqueConstraint([String? message]) = _UniqueConstraint;
  const factory Failure.notFound([String? message]) = _NotFound;
}
