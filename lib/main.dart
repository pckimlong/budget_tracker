import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/src/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
