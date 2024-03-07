import 'package:panakj_app/core/model/search_course/search_course.dart';



import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseDropdownService {
  Future<SearchCourse> getSearchBank({String? searchKeyword}) async {
    try {
      final response = await http.get(Uri.parse('https://ptvue.tekpeak.in/api/course?search=${searchKeyword ?? "ALLAHABAD"}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Assuming your BankData and Bank classes are defined correctly
        SearchCourse searchCourse = SearchCourse.fromJson(data);
        return searchCourse;
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
