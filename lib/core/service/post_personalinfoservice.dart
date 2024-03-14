import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/personal_info_data/personal_info_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class PostPersonalInfoService {
//   // final SupabaseClient _client = SupabaseClient(
//   //   'https://nuijjfzzemdlzirwpahw.supabase.co',
//   //   'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
//   //   autoRefreshToken: true,
//   // );

//   // api service
//   Future<PersonalInfo> postPersonalInfoservice({
//     required String name,
//     required String gender,
//     required String dob,
//     required String phone,
//     required String address,
//     required String email,
//     required String bankAccName,
//     required String bankAccNo,
//     required int bankId,
//     required String bankIfsc,
//   }) async {
//     try {
//       final Map<String, dynamic> formData = {
//         'name': name,
//         'gender': gender,
//         'dob': dob,
//         'phone': phone,
//         'address': address,
//         'email': email,
//         'bank_acc_name': bankAccName,
//         'bank_acc_no': bankAccNo,
//         'bank_name': bankId.toString(),
//         'bank_ifsc': bankIfsc,
//       };

//       final response = await http.post(
//         Uri.parse('https://ptvue.tekpeak.in/api/personalInfo'),
//         body: formData,
//       );

//       if (response.statusCode == 200) {
//         // Assuming PersonalInfo is returned from the API response
//         return PersonalInfo.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to post personal info: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error posting personal info: $e');
//       throw e;
//     }
//   }

//   // Future<PersonalInfo> postPersonalInfoservice({
//   //   required String name,
//   //   required String gender,
//   //   required String dob,
//   //   required String phone,
//   //   required String address,
//   //   required String email,
//   //   required String bankAccName,
//   //   required String bankAccNo,
//   //   required int bankId,
//   //   required String bankIfsc,
//   // }) async {
//   //   try {
//   //     // Create a map of data to be added to Supabase
//   //     final response = await _client.from('student_2_list').upsert({
//   //       'id': 9999999,
//   //       'name': name,
//   //       'gender': gender,
//   //       'dob': 'dob',
//   //       'phone': phone,
//   //       'address': address,
//   //       'email': email,
//   //       'bank_acc_name': bankAccName,
//   //       'bank_acc_no': bankAccNo,
//   //       'bank_name': bankId,
//   //       'bank_ifsc': bankIfsc,
//   //     }).execute();

//   //     if (response == null) {
//   //       throw Exception('Error posting personal info: ${response}');
//   //     }
//   //   } catch (e) {
//   //     print('Error posting personal info: $e');
//   //     throw e;
//   //   }
//   //   return PersonalInfo();
//   // }
// }

// class Poststudent1InviteService {
//   final SupabaseClient _client = SupabaseClient(
//     'https://nuijjfzzemdlzirwpahw.supabase.co',
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
//     autoRefreshToken: true,
//   );

//   Future<PersonalInfo> poststudent1InviteService({
//     required int id,
//     required var appl_status,
//   }) async {
//     try {
//       // Create a map of data to be added to Supabase
//       final response = await _client.from('student_1_invite_list').upsert({
//         'id': id,
//         'appl_status': appl_status,
//       }).execute();

//       if (response == null) {
//         throw Exception('Error posting personal info: ${response}');
//       }
//     } catch (e) {
//       print('Error posting personal info: $e');
//       throw e;
//     }
//     return PersonalInfo();
//   }
// }

// ----------------------------------- above is backup ---------------------------------------

// class PostPersonalInfoService {
//   // api service
//   Future<PersonalInfo> postPersonalInfoservice({
//     required String name,
//     required String gender,
//     required String dob,
//     required String phone,
//     required String address,
//     required String email,
//     required String bankAccName,
//     required String bankAccNo,
//     required  bankId,
//     required String bankIfsc,
//   }) async {
//     try {
//       final Map<String, dynamic> formData = {
//         // 'name': name,
//         // 'gender': gender,
//         // 'dob': dob,
//         // 'phone': phone,
//         // 'address': address,
//         // 'email': email,
//         // 'bank_acc_name': bankAccName,
//         // 'bank_acc_no': bankAccNo,
//         // 'bank_name': bankId.toString(),
//         // 'bank_ifsc': bankIfsc,

//         'name': 'cdfd',
//         'gender': 'm',
//         'dob': '2022-10-03',
//         'phone': '56368046',
//         'address': 'vfbdfsbdfb',
//         'email': 'rishi@gmail.com',
//         'bank_id': '1',
//         'bank_acc_no': '435342534656',
//         'bank_acc_name': 'fdfsdfds',
//         'bank_ifsc': 'gfsgfsgs'
//       };

//       final response = await http.post(
//         Uri.parse('https://pankajtrust.org/api/student/personal_info'),
//         body: formData,
//       );

//       if (response.statusCode == 200) {
//         // Assuming PersonalInfo is returned from the API response
//         return PersonalInfo.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to post personal info: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error posting personal info: $e');
//       throw e;
//     }
//   }
// }

class Poststudent1InviteService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future<PersonalInfoData> poststudent1InviteService({
    required int id,
    required var appl_status,
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('student_1_invite_list').upsert({
        'id': id,
        'appl_status': appl_status,
      }).execute();

      if (response == null) {
        throw Exception('Error posting personal info: ${response}');
      }
    } catch (e) {
      print('Error posting personal info: $e');
      throw e;
    }
    return PersonalInfoData();
  }
}

class PostPersonalInfoService {
  Future<PersonalInfoData> postPersonalInfoservice({
    required String name,
    required String gender,
    required String dob,
    required String phone,
    required String address,
    required String email,
    required bankId,
    required String bankAccNo,
    required String bankAccName,
    required String bankIfsc,
  }) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedBankId = prefs.getInt('selectedBank') ?? -1;
    final formData = {
      'name': name,
      'gender': gender,
      'dob': dob,
      'phone': phone,
      'address': address,
      'email': email,
 
     // 'bank_id': bankId.toString(),
     'bank_id': storedBankId.toString(),
      'bank_acc_no': bankAccNo,
      'bank_acc_name': bankAccName,
      'bank_ifsc': bankIfsc,
    };

    final response = await http.post(
      Uri.parse('https://pankajtrust.org/api/student/personal_info'),
      body: formData,
    );

    if (response.statusCode == 200) {
      print('response fro aaaaaaaaaapi ${response.body.toString()}');
      return PersonalInfoData.fromJson(json.decode(response.body));
    } else {
      // Handle error response if needed
      print('Failed to post personal info: ${response.statusCode}');
      throw Exception('Failed to post personal info: ${response.statusCode}');
    }
  }
}
