import 'package:panakj_app/core/model/life_status/life_status.dart';
import 'package:panakj_app/core/model/school_group/school_group.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class GetAllFieldVerficationService {
  Future<List<SchoolGroup>> getAllSchoolGroups() async {
    final response =
        await Supabase.instance.client.from('edu_5_groups').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data.length}');
    return data
        .map((json) => SchoolGroup.fromJson(json as Map<String, dynamic>))
        .toList();
  }

 Future<List<LifeStatus>>  lifeStatus() async {
    final response =
        await Supabase.instance.client.from('life_status').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
      return data
        .map((json) => LifeStatus.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
