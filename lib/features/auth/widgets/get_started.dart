import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ResponsiveDesign.screenWidth(context)/10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ResponsiveDesign.screenHeight(context)/2.2),
            Button(title: "Get Started", bgcolor: Colors.white, textcolor: AppColors.primary, onPressed: () => context.push('/register'),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
              'Already have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              )),
              GestureDetector(
                onTap: () {
                  context.push('/login');
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 204, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              )
            ])
          ],
        ),
      );
  }
}
