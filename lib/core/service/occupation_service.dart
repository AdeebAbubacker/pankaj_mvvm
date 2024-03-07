import 'package:panakj_app/core/model/search_occupation/search_occupation.dart';




import 'dart:convert';
import 'package:http/http.dart' as http;

class OccupationDropdownService {
  Future<SearchOccupation> getSearchBank({String? searchKeyword}) async {
    try {
      final response = await http.get(Uri.parse('https://ptvue.tekpeak.in/api/occupation?search=${searchKeyword ?? "ALLAHABAD"}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Assuming your BankData and Bank classes are defined correctly
        SearchOccupation searchOccupation = SearchOccupation.fromJson(data);
        return searchOccupation;
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




