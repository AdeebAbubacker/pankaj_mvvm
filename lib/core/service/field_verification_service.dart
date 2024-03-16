import 'package:panakj_app/core/model/residential_data/residential_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FieldVerificationService {
  final SupabaseClient _client = SupabaseClient(
    'https://nuijjfzzemdlzirwpahw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY',
    autoRefreshToken: true,
  );

  Future fieldVerificationService({
    required int app_id,
    required int hall_ticket,
    required int group,
    required int f_life_status,
    required int m_life_status,
    required int f_education,
    required int m_education,
    required int plot_size,
    required int water_source,
    required int rental_house,
  }) async {
    try {
      // Create a map of data to be added to Supabase
      final response = await _client.from('field_verification').upsert({
        'id': 12,
        'application_id': 14,
        'hall_ticket': 1,
        'group': 1,
        'father_life_status': f_life_status,
        'mother_life_status': m_life_status,
        'father_education': 2,
        'mother_education': 2,
        'plot_size': 2,
        'roof': 2,
        'plastering': 2,
        'water_source': 2,
        'rental_house': 2,
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
