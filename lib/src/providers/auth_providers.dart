import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/data/model/account.dart';

import '../../exports.dart';
part "auth_providers.freezed.dart";

class AuthProviders {
  const AuthProviders._();

  static final state = StreamProvider<AuthState>((ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges().map((event) {
      if (event == null) return const AuthState.uauthenticated();
      return AuthState.authenticated(event.uid);
    });
  });
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(UserId uuid) = _Authenticated;
  const factory AuthState.uauthenticated() = _Unauthenticated;
}
