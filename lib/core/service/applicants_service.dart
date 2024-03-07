import 'package:panakj_app/core/model/applicant_data/applicant_model.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicantService {
  Future<List<Applicants>> getAllApplicant() async {
    final response =
        await Supabase.instance.client.rpc('get_applicants').execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];
    // ignore: avoid_print
    print(response.data[40].toString());
    // ignore: avoid_print
    print('my response from applicants ${data.length}');
    return data
        .map((json) => Applicants.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Applicants>> applicationCompleted() async {
    final response = await Supabase.instance.client
        .from('student_1_invite_list')
        .select()
        .eq('appl_status', 100) // Filter where appl_status is not equal to 100
        .execute();

    if (response == null || response.data == null) {
      print('Error fetching applicants: ${response}');
      throw Exception('Failed to fetch applicants');
    }

    final List<dynamic> data = response.data!;

    // Mapping data to Applicants objects
    final List<Applicants> applicantsList = data
        .map((json) => Applicants.fromJson(json as Map<String, dynamic>))
        .toList();

    return applicantsList;
  }

  Future<List<Applicants>> applicationInCompleted() async {
    final response = await Supabase.instance.client
        .from('student_1_invite_list')
        .select()
        .not('appl_status', 'eq', 100)
        
        .execute();

    if (response == null || response.data == null) {
      print('Error fetching applicants: ${response}');
      throw Exception('Failed to fetch applicants');
    }

    final List<dynamic> data = response.data!;

    // Mapping data to Applicants objects
    final List<Applicants> applicantsList = data
        .map((json) => Applicants.fromJson(json as Map<String, dynamic>))
        .toList();

    return applicantsList;
  }
}
