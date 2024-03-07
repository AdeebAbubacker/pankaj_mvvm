import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/get_school_model/school.dart';

class GetSchoolService {

  Future<List<School>> getSchools() async {
    final response =
        await Supabase.instance.client.from('edu_1_schools').select() .execute();
    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }
    final List<dynamic> data = response.data ?? [];
    print(data.length);
    return data
        .map((json) => School.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<School>> editSchoolName({
    required int selectedItemId,
    required String newName,
  }) async {
    try {
      // Fetch the school with the specified ID from Supabase
      final response = await Supabase.instance.client
          .from('edu_1_schools')
          .select()
          .eq('id', selectedItemId)
          .single()
          .execute();

      if (response == null) {
        throw Exception('Failed to fetch school');
      }

      final Map<String, dynamic>? schoolData = response.data;

      if (schoolData != null) {
        // Update the name field with the new name
        final updatedData = {'name': newName};

        // Update the school with the modified data
        final updateResponse = await Supabase.instance.client
            .from('edu_1_schools')
            .update(updatedData)
            .eq('id', selectedItemId)
            .execute();

        if (updateResponse == null) {
          throw Exception('Failed to update school');
        }
      } else {
        throw Exception('School with ID $selectedItemId not found.');
      }

      // If needed, you can return updated schools data from Supabase
      final updatedSchools = await getSchools();
      return updatedSchools;
    } catch (e) {
      print('Error updating school name: $e');
      throw e;
    }
  }

  Future<List<School>> addSchoolName({
    required String newName,
  }) async {
    try {
      // Get the current last ID in the collection
      int lastId = await getLastId();

      // Increment the last ID to generate the new ID
      int newId = lastId + 1;

      // Create a map with the new school data
      Map<String, dynamic> data = {
        'id': newId,
        'name': newName,
        'created_at': DateTime.now().toIso8601String(),
        'deleted_at': null
      };

      // Add the new school to the database
      final response = await Supabase.instance.client
          .from('edu_1_schools')
          .insert(data)
          .execute();

      if (response == null) {
        throw Exception('Failed to add school');
      }

      // Return the list of schools (in this case, just the newly added one)
      List<School> schools = [
        School(id: newId, name: newName, createdAt: data['createdAt'])
      ];
      return schools;
    } catch (e) {
      print('Error adding school: $e');
      throw e;
    }
  }

   Future<int> getLastId() async {
    try {
      final response = await Supabase.instance.client
          .from('edu_1_schools')
          .select('id')
          .order('id', ascending: false)
          .limit(1)
          .execute();

      if (response == null || response.data == null) {
        throw Exception('Failed to get last ID');
      }

      final List<dynamic> data = response.data!;
      if (data.isNotEmpty) {
        return data[0]['id'] as int;
      } else {
        return 0;
      }
    } catch (e) {
      print('Error getting last ID: $e');
      throw e;
    }
  }

  Future softDeleteSchool({
    required int selectedItemId,
  }) async {
    try {
      // Fetch the school with the specified ID from Supabase
      final response = await Supabase.instance.client
          .from('edu_1_schools')
          .update({'deleted_at': DateTime.now().toIso8601String()})
          .eq('id', selectedItemId)
          .execute();

      if (response == null) {
        throw Exception('Failed to soft delete school');
      }

      print('School with ID $selectedItemId soft deleted.');
    } catch (e) {
      print('Error soft deleting school: $e');
      throw e;
    }
  }
}
