import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/auth_response/auth_response.dart';
import 'package:panakj_app/core/model/update_student_data/update_student_data.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signInWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print('haai this is my user ${userCredential.user}');
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       print('Login failed: ${e.message}');
//       return null;
//     }
//   }

//   // Add other authentication methods (e.g., sign up, sign out) as needed

//   // Example of sign out method:
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }

class AuthService {
  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://pankajtrust.org/api/login');

    final formData = {
      'email': 'rishi1@gmail.com',
      'password': '12345',
      'role': '2', // Converting to string
    };

    // Encode the form data using JSON encoding
    final encodedFormData = jsonEncode(formData);

    try {
      final response = await http.post(
        url,
        body: encodedFormData,
        headers: {
          'Content-Type': 'application/json', // Specify content type
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final AuthResponse updateStudentData = AuthResponse.fromJson(data);
        print(updateStudentData);
        return updateStudentData;
      } else {
        // Handle error gracefully
        print('Failed to sign in, status code: ${response.statusCode}');
        throw Exception('Failed to sign in: ${response.body}');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error signing in: $e');
      throw e;
    }
  }
}
