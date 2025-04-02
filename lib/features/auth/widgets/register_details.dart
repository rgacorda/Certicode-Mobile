import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/components/textfield/rounded_inputfield.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class RegisterDetails extends StatelessWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveDesign.screenWidth(context) / 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.textColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Text(
              'Please proceed to create your account.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 20),
            RoundedInputfield(textHint: 'First Name',),
            SizedBox(height: 10),
            RoundedInputfield(textHint: 'Last Name',),
            SizedBox(height: 10),
            RoundedInputfield(textHint: 'Phone Number',),
            SizedBox(height: 10),
            RoundedInputfield(textHint: 'Email',),
            SizedBox(height: 10),
            RoundedInputfield(textHint: 'Password',),
            SizedBox(height: 10),
            RoundedInputfield(textHint: 'Confirm Password',),
            SizedBox(height: 20),
            Button(title: "Register", bgcolor: AppColors.primary, textcolor: Colors.white,),
          ],
        ),
      ),
    );
  }
}
