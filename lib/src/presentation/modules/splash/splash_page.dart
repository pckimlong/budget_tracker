import 'package:budget_tracker/src/presentation/modules/root_page.dart';
import 'package:lottie/lottie.dart';

import '../../../../exports.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() async {
      final nav = Navigator.of(context);
      await Future.delayed(const Duration(milliseconds: 300));
      nav.pushReplacement(
        FluentPageRoute(
          builder: (_) => const RootPage(),
        ),
      );
    });

    return Center(child: Lottie.asset('assets/lotties/money.json', width: 300));
  }
}
