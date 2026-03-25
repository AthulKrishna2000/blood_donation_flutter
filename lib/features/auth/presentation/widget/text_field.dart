import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator; // ✅ added
  final bool obscureText; // ✅ for password
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator, // ✅ added
      obscureText: obscureText, // ✅ added
      style: const TextStyle(
        color: Colors.white, // typed text color
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.35),

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),

        // ✅ SHOW ERROR TEXT CLEARLY
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),

        // ✅ NORMAL BORDER
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),

        // ✅ FOCUSED BORDER
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),

        // 🔴 VERY IMPORTANT (YOU MISSED THIS)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
