import 'package:panakj_app/core/model/drop_down_values/drop_down_values.dart';




import 'dart:convert';
import 'package:http/http.dart' as http;

class DropDownService {
  Future<DropDownValues> getDropdownData() async {
    try {
      final response = await http.get(Uri.parse('hps://ptvue.tekpeak.in/api/dropdown_values'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        DropDownValues downValues = DropDownValues.fromJson(data);
        return downValues;
      } else {
        // Handle error if the request was not successful
        print('Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception('Failed to load dropdown data');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }
}

