import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/get_college_model/college.dart';




class GetCollegeService {
 

  Future<List<College>> getColleges() async {
    final response =
        await Supabase.instance.client.from('edu_3_colleges').select().execute();
    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }
    final List<dynamic> data = response.data ?? [];
    print(data.length);
    return data
        .map((json) => College.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<College>> editcollegeName({
    required int selectedItemId,
    required String newName,
  }) async {
    try {
      // Fetch the College with the specified ID from Supabase
      final response = await Supabase.instance.client
          .from('edu_3_colleges')
          .select()
          .eq('id', selectedItemId)
          .single()
          .execute();

      if (response == null) {
        throw Exception('Failed to fetch College');
      }

      final Map<String, dynamic>? CollegeData = response.data;

      if (CollegeData != null) {
        // Update the name field with the new name
        final updatedData = {'name': newName};

        // Update the College with the modified data
        final updateResponse = await Supabase.instance.client
            .from('edu_3_colleges')
            .update(updatedData)
            .eq('id', selectedItemId)
            .execute();

        if (updateResponse == null) {
          throw Exception('Failed to update College');
        }
      } else {
        throw Exception('College with ID $selectedItemId not found.');
      }

      // If needed, you can return updated Colleges data from Supabase
      final updatedColleges = await getColleges();
      return updatedColleges;
    } catch (e) {
      print('Error updating College name: $e');
      throw e;
    }
  }

  Future<List<College>> addcollegeName({
    required String newName,
  }) async {
    try {
      // Get the current last ID in the collection
      int lastId = await getLastId();

      // Increment the last ID to generate the new ID
      int newId = lastId + 1;

      // Create a map with the new College data
      Map<String, dynamic> data = {
        'id': newId,
        'name': newName,
        'created_at': DateTime.now().toIso8601String(),
        'deleted_at': null
      };

      // Add the new College to the database
      final response = await Supabase.instance.client
          .from('edu_3_colleges')
          .insert(data)
          .execute();

      if (response == null) {
        throw Exception('Failed to add College');
      }

      // Return the list of Colleges (in this case, just the newly added one)
      List<College> Colleges = [
        College(id: newId, name: newName, createdAt: data['createdAt'])
      ];
      return Colleges;
    } catch (e) {
      print('Error adding College: $e');
      throw e;
    }
  }

   Future<int> getLastId() async {
    try {
      final response = await Supabase.instance.client
          .from('edu_3_colleges')
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

  Future  softDeletecollege({
    required int selectedItemId,
  }) async {
    try {
      // Fetch the College with the specified ID from Supabase
      final response = await Supabase.instance.client
          .from('edu_3_colleges')
          .update({'deleted_at': DateTime.now().toIso8601String()})
          .eq('id', selectedItemId)
          .execute();

      if (response == null) {
        throw Exception('Failed to soft delete College');
      }

      print('College with ID $selectedItemId soft deleted.');
    } catch (e) {
      print('Error soft deleting College: $e');
      rethrow;
    }
  }
}
