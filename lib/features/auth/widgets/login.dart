import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/components/textfield/circular_inputfield.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ResponsiveDesign.screenWidth(context)/10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Please, Log In.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 20,),
            Inputfield(textHint: "Username or Email", icon: Icons.verified_user_outlined,),
            SizedBox(height: 15,),
            Inputfield(textHint: "Password", icon: Icons.password_outlined,),
            SizedBox(height: 15,),
            Button(title: "Log In", bgcolor: Colors.white, textcolor: AppColors.primary,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              '· or ·',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
            SizedBox(height: 20,),
            Button(title: "Google", bgcolor: Colors.white, textcolor: AppColors.primary, ImagePath: 'assets/icons/google.png',)
          ],
      ),
    );
  }
}