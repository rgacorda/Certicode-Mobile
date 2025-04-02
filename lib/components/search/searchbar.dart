import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  // final TextEditingController? controller;

  const Searchbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(Icons.search, color: Colors.white),
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