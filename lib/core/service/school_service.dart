import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panakj_app/core/model/searchschool/school.dart';
import 'package:panakj_app/core/model/searchschool/searchschool.dart';
import '../model/search_bank/search_bank.dart';




import 'dart:convert';
import 'package:http/http.dart' as http;

class SchoolDropDownService {
  Future<Searchschool> getSearchBank({String? searchKeyword}) async {
    try {
      final response = await http.get(Uri.parse('https://ptvue.tekpeak.in/api/school?search=${searchKeyword ?? "ALLAHABAD"}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Assuming your BankData and Bank classes are defined correctly
        Searchschool searchschool = Searchschool.fromJson(data);
        return searchschool;
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




