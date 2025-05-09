import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  // Import the ImagePicker package
import '../../services/profile_service.dart';  // Import the ProfileService
import 'package:go_router/go_router.dart';  // Import GoRouter
import 'package:shared_preferences/shared_preferences.dart';  // Import SharedPreferences

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String? profileImageUrl; // from backend
  final String? profileImagePath; // local file (when editing)

  EditProfileScreen({
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.profileImagePath,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _profileImagePath;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _profileImagePath = widget.profileImagePath;
    _profileImageUrl = widget.profileImageUrl;
  }

  // Pick a profile image (example using ImagePicker)
  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImagePath = image.path;  // Update the image path with the selected image
      });

      // Save the image path to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImagePath', image.path);
    }
  }

  // Save profile data
  void _saveProfileData() async {
    final success = await ProfileService().updateUserProfile(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      profileImagePath: _profileImagePath,
    );

    if (success) {
      // Profile updated successfully
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully!')));

      // Navigate back and pass the updated data using context.pop()
      context.pop({
        'name': _nameController.text,
        'email': _emailController.text,
        'profileImagePath': _profileImagePath,
        'profileImageUrl': _profileImagePath == null ? _profileImageUrl : null,
      });
    } else {
      // Profile update failed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update profile')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage, // Pick image when tapped
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImagePath != null
                    ? FileImage(File(_profileImagePath!)) // local image
                    : _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!) // remote image
                    : AssetImage('assets/images/default_profile.jpg') as ImageProvider,
                child: (_profileImagePath == null && _profileImageUrl == null)
                    ? Icon(Icons.camera_alt, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfileData, // Save profile data when tapped
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
