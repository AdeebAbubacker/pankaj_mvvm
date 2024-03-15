import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/personal_info_data/personal_info_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



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
