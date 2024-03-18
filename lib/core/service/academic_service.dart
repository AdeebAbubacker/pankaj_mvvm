import 'dart:convert';
import 'package:panakj_app/core/model/academic_data/academic_data.dart';
import 'package:http/http.dart' as http;

///-----------------------------------------------------------------------------------------------

class AcademicService {
  Future<AcademicData> postAcademicService({
    required String sslcmark,
    required String marksplusone,
    required String marksplustwo,
    required String schoolId,
    required String hallTicket,
    required String preferredcourse,
    required List achievement,
  }) async {
    final rawData = {
      "academics": [
        {
          "mark_sslc": sslcmark,
          "mark_p1": marksplusone,
          "mark_p2": marksplustwo,
          "school_id": schoolId,
          "hall_ticket": hallTicket,
          "preferred_course": preferredcourse
        }
      ],
     // "achievements": achievement,
      
      "achievements":[
		{
            "category": 43,
            "achievement_details": 45,
            "upload_file": 44
        },
		{
            "category": 43,
            "achievement_details": 45,
            "upload_file": 44
        }
	]
    };

    final response = await http.post(
      Uri.parse('https://pankajtrust.org/api/student/academic?id=513491'),
      body: jsonEncode(rawData),
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
    );

    if (response.statusCode == 200) {
      print('response fro aaaaaaaaaapi  academics ${response.body.toString()}');
      return AcademicData.fromJson(json.decode(response.body));
    } else {
      // Handle error response if needed
      print('Failed to post personal info: ${response.statusCode}');
      throw Exception('Failed to post personal info: ${response.statusCode}');
    }
  }
}
