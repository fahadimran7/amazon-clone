import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    this.isPassword,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.transparent),
          ),
          fillColor: const Color.fromARGB(255, 248, 248, 248),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14)),
      controller: controller,
      obscureText: isPassword ?? false,
    );
  }
}
