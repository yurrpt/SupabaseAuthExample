import 'package:flutter/material.dart';
import 'package:flutter_supabase_example/core/constants/app/app_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> logOut(BuildContext context) async {
    await AppConstants().client.auth.signOut().then(
          (value) => Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Home Page, thats mean user is registered and logged in'),
            Text(
              AppConstants().client.auth.currentUser?.email ?? 'Ah be usta',
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await logOut(context);
                },
                child: const Text('Logout'))
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}
