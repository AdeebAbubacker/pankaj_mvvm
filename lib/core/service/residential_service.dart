import 'package:panakj_app/core/model/residential_data/residential_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirebaseResponse<T> {
  final bool success;
  final T? data;
  final String? errorMessage;

  FirebaseResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });
}

// class ResidentialService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<ResidentialData> postResidentailService({
//     required String houselandSize,
//     required String housedrinkingwater,
//     required String houseroof,
//     required String houseOwnership,
//   }) async {
//     try {
//       // Get the currently logged-in user
//       User? user = _auth.currentUser;

//       if (user != null) {
//         Map<String, dynamic> data = {
//           "house_land_size": houselandSize,
//           "house_drinking_water": housedrinkingwater,
//           "house_roof": houseroof,
//           "house_ownership": houseOwnership,
//         };

//         // Use the set method to create a new document
//         await _firestore
//             .collection('post_home')
//             .doc(user.email) // Use the user's email as the document ID
//             .set(data);

//         return ResidentialData();
//       } else {
//         throw Exception("User not logged in.");
//       }
//     } catch (e) {
//       print('Error posting personal info: $e');

//       return ResidentialData();
//     }
//   }
// }

class ResidentialService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future<ResidentialData> postResidentailService({
    required String houselandSize,
    required String housedrinkingwater,
    required String houseroof,
    required String houseOwnership,
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('student_2_list').upsert({
        'id': 999999,
        'house_drinking_water': housedrinkingwater,
        'house_ownership': houseOwnership,
        'house_roof': houseroof,
        'house_land_size': houselandSize,
      }).execute();

      if (response == null) {
        throw Exception('Error posting personal info: ${response}');
      }
    } catch (e) {
      print('Error posting personal info: $e');
      throw e;
    }
    return ResidentialData();
  }
}
