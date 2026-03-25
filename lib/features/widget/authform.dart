import 'package:flutter/material.dart';

class Authform extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isobscureText;
  const Authform({
    super.key,
    required this.hintText,
    required this.controller,
    this.isobscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hint: Text(hintText),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "It is empty $hintText";
        }
        return null;
      },
      obscureText: isobscureText,
    );
  }
}
