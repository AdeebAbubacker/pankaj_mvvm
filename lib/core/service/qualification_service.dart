import 'package:panakj_app/core/model/search_qualification/search_qualification.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

class QualificationDropdownService {
  Future<SearchQualification> getSearchQualification({String? searchKeyword}) async {
    try {
      final response = await http.get(Uri.parse('https://ptvue.tekpeak.in/api/qualification?search=${searchKeyword ?? "ALLAHABAD"}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Assuming your SearchQualification and Bank classes are defined correctly
        SearchQualification searchQualification = SearchQualification.fromJson(data);
        return searchQualification;
      } else {
        // Handle error if the request was not successful
        print('Failed to load bank data, status code: ${response.statusCode}');
        throw Exception('Failed to load bank data');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving bank data: $e');
      throw e;
    }
  }
}