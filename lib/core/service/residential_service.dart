import 'dart:convert';

import 'package:panakj_app/core/model/residential_data/residential_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class ResidentialService {
  Future<ResidentialData> postResidentailService({
    required String house_land_size,
    required String house_drinking_water,
    required String house_roof,
    required String house_ownership,
  }) async {
    final formData = {
      'house_land_size': house_land_size,
      'house_drinking_water':house_drinking_water,
      'house_roof': house_roof,
      'house_ownership': house_ownership
    };

    final response = await http.post(
      Uri.parse('https://pankajtrust.org/api/student/residential?id=513491'),
      body: formData,
    );

    if (response.statusCode == 200) {
      print('response fro aaaaaaaaaapi ${response.body.toString()}');
      return ResidentialData.fromJson(json.decode(response.body));
    } else {
      // Handle error response if needed
      print('Failed to post personal info: ${response.statusCode}');
      throw Exception('Failed to post personal info: ${response.statusCode}');
    }
  }
}
