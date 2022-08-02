import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://rwroxvrrithtklirikej.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3cm94dnJyaXRodGtsaXJpa2VqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTkzNjg4ODYsImV4cCI6MTk3NDk0NDg4Nn0.rgJpRqeDsN2xE-HdH__bZx-HUetwB_3bNDlSmLYoNFk",
    // debug: kDebugMode,
  );

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
