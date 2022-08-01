import 'dart:async';

import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/common_providers.dart';
part "auth_providers.freezed.dart";

class AuthProviders {
  const AuthProviders._();

  static final signIn =
      StateNotifierProvider.autoDispose<SignInNotifier, AsyncValue<bool>>((ref) {
    return SignInNotifier(ref.read);
  });

  static final state =
      StateNotifierProvider<AuthNotifier, AsyncValue<AuthState>>((ref) {
    return AuthNotifier(ref.read);
  });
}

class SignInNotifier extends StateNotifier<AsyncValue<bool>> {
  SignInNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> call({
    required String email,
    required String password,
  }) async {
    if (state.isLoading || state == const AsyncValue.data(true)) {
      return;
    }
    state = const AsyncValue.loading();
    final response = await _reader(supabaseProvider)
        .client
        .auth
        .signIn(email: email, password: password);
    final error = response.error;
    if (error != null) {
      state = AsyncValue.error(error);
    } else {
      state = const AsyncValue.data(true);
    }
  }
}

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  AuthNotifier(this._reader) : super(const AsyncValue.loading()) {
    _recoverSupabaseSession();
    _authStateListener = SupabaseAuth.instance.onAuthChange.listen((event) {
      if (event == AuthChangeEvent.signedOut) {
        state = const AsyncValue.data(AuthState.unauthenticated());
      }
    });
  }

  final Reader _reader;
  late final StreamSubscription<AuthChangeEvent> _authStateListener;

  @override
  void dispose() {
    _authStateListener.cancel();
    super.dispose();
  }

  Future<AsyncValue<void>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _reader(supabaseProvider)
        .client
        .auth
        .signIn(email: email, password: password);
    final error = response.error;
    if (error != null) {
      return AsyncValue.error(error);
    } else {
      state = AsyncValue.data(AuthState.authenticated(response.data!.user!.id));
      return const AsyncValue.data(null);
    }
  }

  Future<AsyncValue<void>> signUp({
    required String email,
    required String password,
  }) async {
    final response =
        await _reader(supabaseProvider).client.auth.signUp(email, password);
    final error = response.error;
    if (error != null) {
      return AsyncValue.error(error);
    } else {
      state = AsyncValue.data(AuthState.authenticated(response.data!.user!.id));
      return const AsyncValue.data(null);
    }
  }

  Future<void> _recoverSupabaseSession() async {
    final exist = await _reader(supabaseAuthProvider).localStorage.hasAccessToken();
    if (!exist) {
      state = const AsyncValue.data(AuthState.unauthenticated());
      return;
    }

    final String? jsonStr = await SupabaseAuth.instance.localStorage.accessToken();
    if (jsonStr == null) {
      state = const AsyncValue.data(AuthState.unauthenticated());
      return;
    }

    final response = await Supabase.instance.client.auth.recoverSession(jsonStr);
    if (response.error != null) {
      _reader(supabaseAuthProvider).localStorage.removePersistedSession();
      state = AsyncValue.error(response.error!);
      return;
    } else {
      state = AsyncValue.data(AuthState.authenticated(response.data!.user!.id));
      return;
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(String uuid) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
