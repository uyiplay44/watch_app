import 'package:flutter/material.dart';
import 'package:watch_app/features/pages/signup_page.dart';
import 'package:watch_app/features/widget/auth_button.dart';
import 'package:watch_app/features/widget/authform.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('User LogIn', style: TextStyle(fontSize: 20)),
              SizedBox(height: 15),
              Authform(hintText: 'Email', controller: emailController),
              SizedBox(height: 15),
              Authform(
                hintText: 'Password',
                controller: passwordController,
                isobscureText: true,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignupPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an Account?',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              AuthButton(text: 'Sign In'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
