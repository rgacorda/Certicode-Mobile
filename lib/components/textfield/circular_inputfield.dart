import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData? icon;
  final String textHint;
  final TextEditingController controller; // Add the TextEditingController
  final bool isObscure; // Add a flag for obscuring text (for passwords)

  const InputField({
    Key? key,
    this.icon,
    required this.textHint,
    required this.controller, // Make this required
    this.isObscure = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Add this line
      obscureText: isObscure, // Use this for password fields
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );
  }
}