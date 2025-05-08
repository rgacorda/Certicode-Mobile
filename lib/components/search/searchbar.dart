import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final void Function(String)? onSubmitted;

  const Searchbar({ Key? key,this.controller, this.onChanged, this.onSubmitted }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      onChanged: onChanged,
      // controller: controller,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: GestureDetector(
          onTap: () {
            if (onSubmitted != null) {
              onSubmitted!(controller!.text);
            }
          },
          child: Icon(Icons.search, color: Colors.white),
        ),
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