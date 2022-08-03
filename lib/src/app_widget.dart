import 'package:budget_tracker/src/presentation/modules/splash/splash_page.dart';
import 'package:budget_tracker/src/providers/setting_providers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../exports.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(SettingProviders.appColor);
    final themeMode =
        ref.watch(SettingProviders.setting.select((value) => value.themeMode));

    return FluentApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Battambang',
        accentColor: color,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Battambang',
        accentColor: color,
      ),
      themeMode: themeMode,
      builder: EasyLoading.init(),
      home: const SplashPage(),
    );
  }
}
