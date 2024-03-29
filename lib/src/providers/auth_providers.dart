import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/data/model/account.dart';

import '../../exports.dart';
part "auth_providers.freezed.dart";

class AuthProviders {
  const AuthProviders._();

  static final uuid = Provider<UserId?>((ref) {
    return ref.watch(
        state.select((value) => value.valueOrNull?.whenOrNull(authenticated: id)));
  });

  static final state = StreamProvider<AuthState>((ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges().map((event) {
      if (event == null) return const AuthState.unauthenticated();
      return AuthState.authenticated(event.uid);
    });
  });
}

class ChangePasswordNotifier extends StateNotifier<AsyncValue<bool>> {
  ChangePasswordNotifier(this._reader) : super(const AsyncValue.data(false));
  final Reader _reader;

  // Future<void> call() async {
  //   state = AsyncValue.loading();
  //   final result = _reader(firebaseAuthProvider).pas;
  // }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(UserId uuid) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
