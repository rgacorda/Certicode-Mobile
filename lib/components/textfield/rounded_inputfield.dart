import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String textHint; // Make this required
  final TextEditingController controller; // Add a controller
  final IconData? icon; // Optional icon for additional customization
  final bool isObscure; // For password text fields

  const RoundedInputField({
    Key? key,
    required this.textHint,
    required this.controller, // Make this required
    this.icon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Attach the controller
      obscureText: isObscure, // Manage obscure text,
      decoration: InputDecoration(
        hintText: textHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        prefixIcon: icon != null ? Icon(icon) : null, // Add icon if available
      ),
    );
  }
}