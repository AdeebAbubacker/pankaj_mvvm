import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/model/academic_data_model/academic_data_model.dart';
import 'package:panakj_app/core/model/achievments_data/achievments_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AcademicService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future<AcademicDataModel> postAcademicService({
    final int? school,
    final int? reg_no,
    final int? sslc,
    final int? plus_one,
    final int? plus_two,
    final int? course_pref,
   
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('student_2_list').upsert({
        'id': 999999,
        'school_id': school,
        'hall_ticket': reg_no,
        'mark_sslc': sslc,
        'mark_p1': plus_one,
        'mark_p2': plus_two,
        'preferred_course': course_pref,
      }).execute();

  
    } catch (e) {
      print('Error posting personal info: $e');
      throw e;
    }
    return AcademicDataModel();
  }

  // Assuming you have initialized Supabase
  final SupabaseClient client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future postAchievementsToSupabase({
    final int? student_id,
    final String? title,
    final String? description,
    final String? attachment,
  }) async {
    final response = await _client.from('student_6_achievements').upsert({
      'student_id': student_id,
      'title': title,
      'description': description,
      'attachment': attachment
    }).execute();
  }
}
