import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ProfileService {
  final String baseUrl = "http://192.168.100.26:8000/api"; // Replace with your base URL

  // Update user profile data (name, email, and optional profile image)
  Future<bool> updateUserProfile({
    required String name,
    required String email,
    String? profileImagePath,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('No token found.');
      return false;
    }

    try {
      var uri = Uri.parse('$baseUrl/user/update');
      var request = http.MultipartRequest('POST', uri);

      request.fields['_method'] = 'PUT';
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['name'] = name;
      request.fields['email'] = email;

      // Only attach profile image if provided and valid
      if (profileImagePath != null && File(profileImagePath).existsSync()) {
        var profileImage = await http.MultipartFile.fromPath(
          'profile_image',
          profileImagePath,
        );
        request.files.add(profileImage);
      }

      // Send the request
      var streamedResponse = await request.send();

      // Convert streamed response to regular response for easier reading
      var responseBody = await streamedResponse.stream.bytesToString();

      print('Status Code: ${streamedResponse.statusCode}');
      print('Response Body: $responseBody');

      if (streamedResponse.statusCode == 200) {
        print('Profile updated successfully.');
        return true;
      } else {
        print('Failed to update profile.');
        return false;
      }
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }

  // Fetch user data (for showing profile information)
  Future<Map<String, dynamic>?> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('No token found.');
      return null;
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/auth/me'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final dynamic decodedData = jsonDecode(response.body);

        print('Fetched user data: $decodedData'); // ✅ Debug log

        // ✅ Access profile_image URL (and store it or return it)
        final profileImageUrl = decodedData['profile_image'];
        print('Profile Image URL: $profileImageUrl');

        return decodedData is Map<String, dynamic> ? decodedData : null;
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }


}
