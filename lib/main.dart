import 'package:flutter/material.dart';
import 'package:flutter_supabase_example/ui/auth/login/login_view.dart';
import 'package:flutter_supabase_example/ui/auth/register/register_view.dart';
import 'package:flutter_supabase_example/ui/auth/splash/splash_view.dart';
import 'package:flutter_supabase_example/ui/home/home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app/app_constants.dart';

Future<void> main() async {
  await Supabase.initialize(
    anonKey: AppConstants.anonKey,
    url: AppConstants.supabaseUrl,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomeView(),
        '/register': (context) => const RegisterView(),
        '/login': (context) => const LoginView(),
      },
    );
  }
}
