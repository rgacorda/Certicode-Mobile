import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../components/button/button.dart';
import '../../../components/textfield/rounded_inputfield.dart';
import '../service/auth_service.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  @override
  _RegisterDetailsState createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final AuthService authService = AuthService(); // Instance of AuthService
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void _register() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String gender = genderController.text.trim();
    String ageText = ageController.text.trim();
    String address = addressController.text.trim();

    if ([firstName, lastName, phoneNumber, email, password, confirmPassword, gender, ageText, address]
        .any((element) => element.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all fields.')));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }

    int age = int.tryParse(ageText) ?? -1;
    if (age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid age.')));
      return;
    }

    bool success = await authService.register(
      firstName, // first_name
      lastName,  // last_name
      email,     // email
      password,  // password
      confirmPassword,  // password_confirmation
      gender,    // gender
      age,       // age
      address,   // address
      phoneNumber,  // phone
    );

    if (success) {
      // Navigate to login page using GoRouter
      context.go('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed. Please try again.')));
    }
  }


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
            RoundedInputField(
              textHint: 'First Name',
              controller: firstNameController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Last Name',
              controller: lastNameController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Gender',
              controller: genderController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Age',
              controller: ageController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Address',
              controller: addressController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Phone Number',
              controller: phoneNumberController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Password',
              controller: passwordController,
              isObscure: true,
            ),
            SizedBox(height: 10),
            RoundedInputField(
              textHint: 'Confirm Password',
              controller: confirmPasswordController,
              isObscure: true,
            ),
            SizedBox(height: 20),
            Button(
              title: "Register",
              bgcolor: AppColors.primary,
              textcolor: Colors.white,
              onPressed: _register, // Call _register
            ),
          ],
        ),
      ),
    );
  }
}
