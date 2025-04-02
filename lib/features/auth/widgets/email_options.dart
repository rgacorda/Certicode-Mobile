import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailOptions extends StatelessWidget {
const EmailOptions({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveDesign.screenWidth(context)/10),
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
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.textColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/Register_Icon.png',
                width: 300,
                height: 300,
              ),
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                )
              ),
              Text(
                'Please proceed to create your account.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 20,),
              Button(title: "Continue with Email", bgcolor: AppColors.primary, textcolor: Colors.white, onPressed: () => context.push('/register_details'),),
              SizedBox(height: 10,),
              Text(
                '· or ·',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 10,),
              Button(title: "Google", bgcolor: Colors.white, textcolor: AppColors.primary, ImagePath: 'assets/icons/google.png',),
              SizedBox(height: 10,),
            ],
          ),
        ),
    );
  }
}

