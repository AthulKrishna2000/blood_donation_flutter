import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  const MyTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white, // typed text color
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.35),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
