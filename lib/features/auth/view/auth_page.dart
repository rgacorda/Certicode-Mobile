import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final Widget child;

  const AuthPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: Column(
          children: [
            SizedBox(height: ResponsiveDesign.screenHeight(context)/8),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/logo2.png',
                width: 300,
                height: 100,
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
