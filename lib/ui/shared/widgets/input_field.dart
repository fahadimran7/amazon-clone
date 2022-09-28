import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool? isPassword;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black54,
        ),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Colors.transparent,
          ),
        ),
        fillColor: const Color.fromARGB(255, 248, 248, 248),
        filled: true,
        labelText: label,
        hintText: hintText,
      ),
      controller: controller,
      obscureText: isPassword ?? false,
    );
  }
}
