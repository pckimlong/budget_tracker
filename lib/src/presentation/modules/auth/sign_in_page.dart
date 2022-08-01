import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../../../exports.dart';
import '../../../providers/auth_providers.dart';
import '../root_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        final controller = ref.read(AuthProviders.state.notifier);
        final result = await controller.signIn(
          email: data.name,
          password: data.password,
        );
        return result.whenOrNull(error: (error, stackTrace) => error.toString());
      },
      onRecoverPassword: (_) {
        return null;
      },
      onSignup: (data) async {
        final controller = ref.read(AuthProviders.state.notifier);
        final result = await controller.signUp(
          email: data.name!,
          password: data.password!,
        );
        return result.whenOrNull(error: (error, stackTrace) => error.toString());
      },
    );
  }
}
