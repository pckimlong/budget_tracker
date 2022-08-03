import 'package:budget_tracker/src/common_providers.dart';
import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../../../exports.dart';
import '../root_page.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: context.theme.accentColor,
        accentColor: context.theme.accentColor,
      ),
      onSubmitAnimationCompleted: () => Navigator.of(context).pushAndRemoveUntil(
        FluentPageRoute(builder: (_) => const RootPage()),
        (route) => false,
      ),
      onLogin: (data) async {
        try {
          final result = await ref
              .read(firebaseAuthProvider)
              .signInWithEmailAndPassword(email: data.name, password: data.password);

          if (result.user != null) {
            return null;
          }
          return "Cannot login";
        } catch (e) {
          return e.toString();
        }
      },
      onConfirmRecover: (otp, p1) async {
        try {
          await ref
              .read(firebaseAuthProvider)
              .confirmPasswordReset(code: otp, newPassword: p1.password);
          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onRecoverPassword: (data) async {
        try {
          await ref.read(firebaseAuthProvider).sendPasswordResetEmail(email: data);
          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onSignup: (data) async {
        try {
          final result = await ref
              .read(firebaseAuthProvider)
              .createUserWithEmailAndPassword(
                  email: data.name!, password: data.password!);

          if (result.user != null) {
            return null;
          }
          return "Cannot register";
        } catch (e) {
          return e.toString();
        }
      },
    );
  }
}
