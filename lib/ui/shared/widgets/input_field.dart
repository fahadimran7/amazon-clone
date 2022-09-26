import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      obscureText: isPassword ?? false,
    );
  }
}
