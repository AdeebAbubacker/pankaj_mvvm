import 'package:panakj_app/core/model/recipient/recipient.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RecepientService {
  Future<List<Recipient>> recipients() async {
    // final response = await Supabase.instance.client
    //     .from('recipient_1_list')
    //     .select()
    //     .execute();
    final response = await Supabase.instance.client
        .from('recipient_1_list')
        .select('id, start_year,name, duration,school_id,college_id,course_id')
        .execute();

    if (response == null || response.data == null) {
      print('Error fetching applicants: ${response}');
      throw Exception('Failed to fetch applicants');
    }
    final List<dynamic> data = response.data!;

    // Mapping data to Applicants objects
    final List<Recipient> applicantsList = data
        .map((json) => Recipient.fromJson(json as Map<String, dynamic>))
        .toList();

    return applicantsList;
  }
}
