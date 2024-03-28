import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/auth_response/auth_response.dart';



class AuthService {
  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://pankajtrust.org/api/login');

    final formData = {
      'email': email,
      'password': password,
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
