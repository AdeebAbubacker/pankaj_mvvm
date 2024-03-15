import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/family_data/family_data.dart';
import 'package:panakj_app/core/model/sibling_data/sibling_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class FamilyInfoService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<FamilyData> postfamilyInfoservice({
//     final String? fathername,
//     final int? falive,
//     final int? fdisabled,
//     final int? focupation,
//     final int? fincome,
//     final String? frelation,
//     final String? mothername,
//     final int? malive,
//     final int? mdisabled,
//     final int? mocupation,
//     final int? mincome,
//     final String? mrelation,
//     final String? guardainame,
//     final int? galive,
//     final int? gdisabled,
//     final int? gocupation,
//     final int? gincome,
//     final String? grelation,
//     final List<SiblingData>? siblings,
//   }) async {
//     try {
//       // Get the currently logged-in user
//       User? user = _auth.currentUser;

//       if (user != null) {
//         // Create a map of data to be added to Firestore
//         Map<String, dynamic> data = {
//           "guardians": [
//             {
//               "name": guardainame,
//               "alive": galive,
//               "disabled": gdisabled,
//               "ocupation": gocupation,
//               "income": gincome,
//               "relation": grelation,
//             },
//             {
//               "name": mothername,
//               "alive": malive,
//               "disabled": mdisabled,
//               "ocupation": mocupation,
//               "income": mincome,
//               "relation": mrelation,
//             },
//             {
//               "name": fathername,
//               "alive": falive,
//               "disabled": fdisabled,
//               "ocupation": focupation,
//               "income": fincome,
//               "relation": frelation,
//             },
//           ],
//           "siblings": siblings?.map((sibling) => sibling.toJson()).toList(),
//         };

//         // Use the set method to create a new document
//         await _firestore
//             .collection('post_familyinfo')
//             .doc(user.email) // Use the user's email as the document ID
//             .set(data);

//         // Return a dummy PersonalInfo for demonstration
//         return FamilyData(); // You may adjust this based on your model
//       } else {
//         throw Exception("User not logged in.");
//       }
//     } catch (e) {
//       print('Error posting personal info: $e');
//       throw e;
//     }
//   }
// }

class FamilyInfoService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future<FamilyData> postfamilyInfoservice({
    final String? fathername,
    final int? falive,
    final int? fdisabled,
    final int? focupation,
    final int? fincome,
    final String? frelation,
    final String? mothername,
    final int? malive,
    final int? mdisabled,
    final int? mocupation,
    final int? mincome,
    final String? mrelation,
    final String? guardainame,
    final int? galive,
    final int? gdisabled,
    final int? gocupation,
    final int? gincome,
    final String? grelation,
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('student_3_parents').upsert({
        'student_id': 99999,
        'name': fathername,
        'relation': 'father',
//'phone': 99999,
        //   'email': 'adeeb@gmail.com',
        'dob': '2018-09-23',
        'highest_qualification': 1,
        'occupation': focupation,
        'income': fincome,
        'alive': falive,
        'disabled': fdisabled,
      }).execute();

      final response2 = await _client.from('student_3_parents').upsert({
        'student_id': 99999,
        'name': mothername,
        'relation': 'mother',
        'phone': 99999,
        'email': 'adeeb@gmail.com',
        'dob': '2018-09-23',
        'highest_qualification': 1,
        'occupation': mocupation,
        'income': mincome,
        'alive': malive,
        'disabled': mdisabled,
      }).execute();

      final response3 = await _client.from('student_3_parents').upsert({
        'student_id': 99999,
        'relation': 'guardian',
        'name': guardainame,
        'phone': 99999,
        'email': 'adeeb@gmail.com',
        'dob': '2018-09-23',
        'highest_qualification': 1,
        'occupation': gocupation,
        'income': gincome,
        'alive': galive,
        'disabled': gdisabled,
      }).execute();

      if (response == null) {
        throw Exception('Error posting personal info: ${response}');
      }
    } catch (e) {
      print('Error posting personal info: $e');
      throw e;
    }
    return FamilyData();
  }

  Future postSiblingsToSupabase({
    final int? student_id,
 
  }) async {
    final response = await _client.from('student_4_siblings').upsert({
      'name': student_id,
    }).execute();
  }
}




class SampleServcie {
  Future<FamilyData> sampleServcie() async {
     
     final rawData = {
      "guardians": [
        {
          "name": "Ravi11",
          "alive": 1,
          "disabled": 1,
          "ocupation": 99,
          "income": 12000,
          "relation": "father"
        },
        {
          "name": "Sathi",
          "alive": 1,
          "disabled": 1,
          "ocupation": 99,
          "income": 0,
          "relation": "mother"
        },
        {
          "name": "akash11",
          "alive": 1,
          "disabled": 1,
          "ocupation": 89,
          "income": 12000,
          "relation": "guardian"
        }
      ],
      "siblings": [
        {
          "name": "Shyam",
          "gender": "m",
          "qualification": 2,
          "course": 5,
          "occupation": 9
        }
      ]
    };

    final response = await http.post(
      Uri.parse('https://pankajtrust.org/api/student/family_info?id=513491'),
      body: jsonEncode(rawData),
      headers: {
          'Content-Type': 'application/json', // Set content type to JSON
        },
    );

    if (response.statusCode == 200) {
      print('response fro aaaaaaaaaapi ${response.body.toString()}');
      return FamilyData.fromJson(json.decode(response.body));
    } else {
      // Handle error response if needed
      print('Failed to post personal info: ${response.statusCode}');
      throw Exception('Failed to post personal info: ${response.statusCode}');
    }
  }
}
