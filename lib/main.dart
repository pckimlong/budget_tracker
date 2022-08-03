import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/src/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

const String appVersion = "1.0.0";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
