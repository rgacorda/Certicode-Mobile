import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 33, 78, 156);
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);
  static const Color textColor = Colors.black87;
  static Color defaultBG(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }
}
