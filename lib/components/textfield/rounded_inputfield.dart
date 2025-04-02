import 'package:flutter/material.dart';

class RoundedInputfield extends StatelessWidget {
  final String? textHint;
const RoundedInputfield({ Key? key, this.textHint }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: textHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}