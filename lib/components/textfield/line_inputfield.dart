import 'package:flutter/material.dart';

class LineInputfield extends StatelessWidget {
  final IconData? icon;
  final String? textHint;

const LineInputfield({ Key? key, this.icon, this.textHint }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(color: Colors.black54),
        prefixIcon: icon != null ? Icon(icon, color: Colors.black54) : null,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
      style: TextStyle(color: Colors.black54),
      cursorColor: Colors.black54,
    );
  }
}
