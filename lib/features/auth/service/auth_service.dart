import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  // Factory constructor to return the singleton instance
  factory AuthService() {
    return _instance;
  }

  // Private constructor
  AuthService._internal();

  // Replace with your actual API URL
  // Using 10.0.2.2 for Android emulator to access localhost
  // For a real device or different setup, use your machine's local IP (e.g., 192.168.x.x)
  final String baseUrl = "http://192.168.100.26:8000/api";

  // Register User
  Future<bool> register(String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String gender,
      int age,
      String address,
      String phoneNumber,) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'name': '$firstName $lastName',
          // You might want to include this for consistency
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'gender': gender,
          'age': age,
          'address': address,
          'phone': phoneNumber,
        }),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) { // Assuming 200 or 201 for success
        print('Registration successful');
        return true;
      } else {
        print('Registration failed: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  // Login function
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['access_token'];
        // Save the token in shared preferences

        // --- Add this print statement ---
        print('Generated Token: $token');
        // --------------------------------

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        print('Login successful. Token saved.');
        return true;
      } else {
        print('Login failed: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  // Fetch user data (me)
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
        final dynamic decodedData = jsonDecode(
            response.body); // Decode the JSON

        // Check if the decoded data is a List and has at least one element
        if (decodedData is List && decodedData.isNotEmpty) {
          // Check if the first element of the list is a Map
          if (decodedData[0] is Map<String, dynamic>) {
            print('User data fetched successfully from list.');
            return decodedData[0] as Map<String,
                dynamic>; // Return the first element as a Map
          } else {
            print('Unexpected format: First element of the list is not a Map.');
            return null; // Or handle appropriately
          }
        } else if (decodedData is Map<String, dynamic>) {
          // This case handles if the API *sometimes* returns a single map
          print('User data fetched successfully as a single map.');
          return decodedData;
        }
        else {
          print('Unexpected API response format: Not a List or Map.');
          print('Response Body: ${response
              .body}'); // Print the body for debugging
          return null; // Or handle appropriately
        }
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
        print('Response Body: ${response.body}');
        // Consider clearing the token if the status code indicates an invalid or expired token
        if (response.statusCode == 401 || response.statusCode == 403) {
          // Assuming you have a logout method
          // await logout(); // Uncomment and implement if you have a logout
        }
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  // Update user profile
  Future<bool> updateUserProfile({required String name, required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('No token found.');
      return false;
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        print('✅ Profile updated successfully.');
        return true;
      } else {
        print('❌ Failed to update profile: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ Error updating profile: $e');
      return false;
    }
  }

  // Logout function
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(
        'token'); // Get the token before removing it

    await prefs.remove('token'); // Remove token locally first
    print('Token removed from shared preferences (Logged out).');

    // Optional: Call backend logout endpoint
    if (token != null) {
      try {
        // Replace with your actual backend logout endpoint
        final response = await http.post(
          Uri.parse('$baseUrl/auth/logout'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            // Adjust if your endpoint requires different headers
          },
          // You might send a body if your backend expects one, e.g., {'token': token}
        );

        if (response.statusCode == 200) {
          print('Backend logout successful.');
        } else {
          print('Backend logout failed: ${response.statusCode}');
          print('Backend Response Body: ${response.body}');
          // Note: Even if backend logout fails, the user is logged out on the client side
        }
      } catch (e) {
        print('Error calling backend logout: $e');
        // Note: Even if backend logout fails, the user is logged out on the client side
      }
    }
  }
}