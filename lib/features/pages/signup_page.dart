import 'package:flutter/material.dart';
import 'package:watch_app/features/pages/signin_page.dart';
import 'package:watch_app/features/widget/auth_button.dart';
import 'package:watch_app/features/widget/authform.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New User', style: TextStyle(fontSize: 20)),
              SizedBox(height: 15),
              Authform(hintText: 'Name', controller: nameController),
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
                    MaterialPageRoute(builder: (_) => const SigninPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'I have an Account?',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              AuthButton(text: 'SignUp'),
              SizedBox(height: 20),
              AnimatedContainer(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 12, spreadRadius: 2)],
                ),
                duration: Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
