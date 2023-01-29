import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_example/core/constants/app/app_constants.dart';
import 'package:flutter_supabase_example/core/extension/snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  /// [loginUser] function that handles login
  Future<bool> loginUser({required String email, required String password, required BuildContext context}) async {
    bool isLogin = false;
    try {
      final res = await AppConstants().client.auth.signInWithPassword(password: password, email: email);
      if (res.user != null) {
        isLogin = true;

        await Navigator.pushNamed(context, '/home');
        context.showSnackBar('Login Successful');
      } else {
        context.showSnackBar('Login Failed');
      }
    } on AuthException catch (err) {
      context.showSnackBar(err.message);
    } catch (error) {
      context.showSnackBar('Unexpected error occurred');
    }
    return isLogin;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.destructiveRed,
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          const FlutterLogo(),
          const SizedBox(
            height: 150,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: isLoading
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });

                    await loginUser(email: _emailController.text, password: _passwordController.text, context: context);

                    setState(() {
                      isLoading = false;
                    });
                  },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
