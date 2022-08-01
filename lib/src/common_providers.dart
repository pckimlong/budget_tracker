

import '../exports.dart';

final supabaseProvider = Provider<Supabase>((ref) {
  return Supabase.instance;
});
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return ref.watch(supabaseProvider).client;
});
final supabaseAuthProvider = Provider<SupabaseAuth>((ref) {
  return SupabaseAuth.instance;
});
