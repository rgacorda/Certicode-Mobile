import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final IconData? icon;
  final String textHint;
  
const Inputfield({ Key? key, this.icon, required this.textHint}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
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