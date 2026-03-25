import 'package:flutter/material.dart';
import 'package:watch_app/core/theme/color_pallete.dart';
import 'package:watch_app/features/pages/signin_page.dart';

class AuthButton extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => SigninPage());
  final String text;
  const AuthButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.actionButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, AuthButton.route());
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(450, 60),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(text),
      ),
    );
  }
}
