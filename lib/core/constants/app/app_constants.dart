import 'package:supabase_flutter/supabase_flutter.dart';

class AppConstants {
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9jZmJncGlrbmdmbm5iYnB5enhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQ5OTIxODMsImV4cCI6MTk5MDU2ODE4M30.ZDw4ZANriXGKL_uLlm9yohEH0jon6WgwyEA_L2Jf6xY';

  static const String supabaseUrl = 'https://ocfbgpikngfnnbbpyzxo.supabase.co';

  final client = Supabase.instance.client;

  static const registerMessage = 'You have already account?';
}
