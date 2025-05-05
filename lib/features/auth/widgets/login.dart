import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../components/button/button.dart';
import '../../../components/textfield/circular_inputfield.dart';
import '../service/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService(); // Instance of AuthService

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      bool success = await authService.login(email, password);
      if (success) {
        // Navigate to home screen after successful login
        context.go('/home');// Update with the actual route
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed. Please try again.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all fields.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveDesign.screenWidth(context) / 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text('Welcome Back!', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('Please, Log In.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 20),
              InputField(textHint: "Email", icon: Icons.email, controller: emailController),
              SizedBox(height: 15),
              InputField(textHint: "Password", icon: Icons.password, controller: passwordController, isObscure: true),
              SizedBox(height: 15),
              Button(title: "Log In", bgcolor: Colors.white, textcolor: AppColors.primary, onPressed: _login),
              SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
