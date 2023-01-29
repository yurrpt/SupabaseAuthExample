import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_example/core/constants/app/app_constants.dart';
import 'package:flutter_supabase_example/core/extension/snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  /// [registerUser] function that handles login
  Future<bool> registerUser({required String email, required String password, required BuildContext context}) async {
    bool isRegistered = false;
    try {
      final res = await AppConstants().client.auth.signUp(email: email, password: password);
      if (res.user != null) {
        isRegistered = true;
        await Navigator.pushNamed(context, '/home');
      }
    } on AuthException catch (err) {
      context.showSnackBar(err.message);
    } catch (error) {
      context.showSnackBar('Unexpected error occurred');
    }
    return isRegistered;
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
        title: const Text('Register Page'),
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
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

                    await registerUser(
                        email: _emailController.text, password: _passwordController.text, context: context);

                    setState(() {
                      isLoading = false;
                    });
                  },
            child: const Text('Register'),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text:
                  TextSpan(text: AppConstants.registerMessage, style: const TextStyle(color: Colors.black), children: [
            TextSpan(
              text: 'Login',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/login');
                },
            )
          ])),
        ],
      ),
    );
  }
}
