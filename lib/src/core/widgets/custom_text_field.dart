import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    super.key,
    required this.validator,
    required this.hintext,
    required this.controller,
    this.obscureText = false, // Default to false
    this.keyboardType = TextInputType.text, // Default to TextInputType.text
  });

  final String? Function(String?)? validator;
  final String hintext;
  final TextEditingController controller;
  final bool obscureText; // No longer nullable
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintext,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
