import 'package:budget_tracker/src/presentation/modules/splash/splash_page.dart';
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
        accentColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Battambang',
        accentColor: Colors.teal,
      ),
      themeMode: ThemeMode.light,
      home: const SplashPage(),
    );
  }
}
