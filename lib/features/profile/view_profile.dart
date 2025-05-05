import 'dart:io';
import 'package:certicode_mobile/components/Menu/menu_item.dart';
import 'package:certicode_mobile/features/auth/service/auth_service.dart'; // Import AuthService
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String name = 'Loading...';
  String email = 'Loading...';
  String? profileImagePath;
  Map<String, dynamic>? _userData;

  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _loadProfileImagePath(); // Load saved profile image path on startup
  }

  // Load the saved image path from SharedPreferences
  Future<void> _loadProfileImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedPath = prefs.getString('profileImagePath');

    setState(() {
      profileImagePath = savedPath; // Load the saved image path
    });
  }

  // Load user data from backend
  Future<void> _loadUserProfile() async {
    final user = await _authService.fetchUserData();
    if (user != null) {
      setState(() {
        _userData = user;
        name = user['name'] ?? '${user['first_name'] ?? ''} ${user['last_name'] ?? ''}';
        email = user['email'] ?? 'N/A';
      });
    } else {
      print('User data not available. Redirecting to login.');
      context.go('/login');
    }
  }

  // Pick an image from the gallery and save it locally
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });

      // Save the image path to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImagePath', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBG(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.left_chevron),
          color: Colors.white,
        ),
        title: Text('Profile', style: TextStyle(color: AppColors.secondary)),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
      body: _userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: profileImagePath != null
                      ? FileImage(File(profileImagePath!)) // Use local image
                      : (_userData != null && _userData!['profile_image'] != null)
                      ? NetworkImage(_userData!['profile_image']) // Use network image
                      : null, // No image
                  backgroundColor: AppColors.secondary,
                  child: (profileImagePath == null && (_userData == null || _userData!['profile_image'] == null))
                      ? Icon(Icons.person, size: 70) // Default icon if no image
                      : null,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            final result = await context.push<Map<String, dynamic>>(
                              '/editProfile', // Ensure this matches your GoRouter path
                              extra: {
                                'name': name,
                                'email': email,
                                'profileImagePath': profileImagePath,
                              },
                            );

                            if (result != null) {
                              setState(() {
                                // Cast the result to Map<String, dynamic>
                                name = result['name'] ?? name;
                                email = result['email'] ?? email;
                                profileImagePath = result['profileImagePath'] ?? profileImagePath;
                              });
                              _loadUserProfile();
                            }
                          },
                          child: Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.secondary,
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  MenuItem(
                    icon: Icons.favorite,
                    title: 'Favourites',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: CupertinoIcons.person_3,
                    title: 'Seminars',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () async {
                      await _authService.logout();
                      context.go('/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage, // Pick image from gallery
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
