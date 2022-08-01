import 'package:budget_tracker/src/presentation/modules/auth/sign_in_page.dart';
import 'package:budget_tracker/src/presentation/modules/root_page.dart';
import 'package:budget_tracker/src/presentation/modules/splash/splash_page.dart';
import 'package:budget_tracker/src/providers/auth_providers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../exports.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Battambang',
        accentColor: Colors.teal,
      ),
      home: const SplashPage(),
    );
  }
}

class _AuthGate extends ConsumerWidget {
  const _AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthProviders.state);

    return authState.when(
      data: (state) {
        return state.when(
          authenticated: (_) => const RootPage(),
          unauthenticated: () => const LoginPage(),
        );
      },
      error: (err, _) => Center(
        child: Text(err.toString()),
      ),
      loading: () => const Center(child: ProgressRing()),
    );
  }
}
