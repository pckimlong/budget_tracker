// ignore_for_file: library_private_types_in_public_api

import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/presentation/modules/root_page.dart';
import 'package:budget_tracker/src/providers/account_providers.dart';
import 'package:budget_tracker/src/providers/auth_providers.dart';
import 'package:lottie/lottie.dart';

import '../../../../exports.dart';
import '../auth/sign_in_page.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mounted = useIsMounted();
    final authState = ref.watch(AuthProviders.state);

    useEffect(() {
      final nav = Navigator.of(context);
      if (authState.hasValue && mounted()) {
        Future.microtask(
          () {
            authState.value!.when(
              unauthenticated: () {
                nav.pushAndRemoveUntil(
                  FluentPageRoute(builder: (_) => const SignInPage()),
                  (route) => false,
                );
              },
              authenticated: (_) async {
                try {
                  await ref.read(AccountProviders.stream.future);
                } catch (_) {}

                nav.pushAndRemoveUntil(
                  FluentPageRoute(builder: (_) => const RootPage()),
                  (route) => false,
                );
              },
            );
          },
        );
      }
      return null;
    }, [authState]);

    return Container(
      decoration: BoxDecoration(color: context.theme.acrylicBackgroundColor),
      child: Center(
        child: Lottie.asset('assets/lotties/money.json', width: 300),
      ),
    );
  }
}
