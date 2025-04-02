import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color? bgcolor;
  final Color? textcolor;
  final String? ImagePath;
  final VoidCallback? onPressed;

  const Button({
    Key? key,
    required this.title,
    required this.bgcolor,
    required this.textcolor,
    this.ImagePath,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgcolor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (ImagePath != null) 
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  ImagePath!,
                  height: 24,
                  width: 24,
                ),
              ),
            Text(
              title,
              style: TextStyle(
                color: textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

