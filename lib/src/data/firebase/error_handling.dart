import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../../../exports.dart';
import '../../core/app_failure.dart';

Future<Either<Failure, T>> errorHandler<T>(
    FutureOr<Either<Failure, T>> Function() callback) async {
  try {
    return await callback();
  } on FirebaseAuthException catch (e) {
    // FirebaseCrashlytics.instance.recordError(e, str);
    log("${e.message ?? "FirebaseAuthException"} code: ${e.code}", error: e);

    if (e.code == "network-request-failed") {
      return left(Failure.internetError(e.message));
    }

    if (e.code == "user-not-found") {
      return left(Failure.userNotFound(e.message));
    }

    return left(Failure.exception(e.message));
  } on FirebaseException catch (e) {
    // FirebaseCrashlytics.instance.recordError(e, str);
    log(e.message ?? "FirebaseException", error: e);
    return left(Failure.exception(e.message));
  } on Exception catch (e) {
    // FirebaseCrashlytics.instance.recordError(e, str);
    log("Exception", error: e.toString());
    if (e is Failure) return left(e);
    return left(Failure.exception(e.toString()));
  }
}

extension StreamEitherFailure<T> on Stream<Either<Failure, T>> {
  Stream<Either<Failure, T>> onErrorReturnFailure() {
    return onErrorReturnWith(
      ((error, stackTrace) {
        log("Stream error:", error: error);
        return left(Failure.exception(error.toString()));
      }),
    );
  }
}
