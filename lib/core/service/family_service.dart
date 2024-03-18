import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/family_data/family_data.dart';



class FamilyInfoService {
  Future<FamilyData> postfamilyInfoservice({
    String? fname,
    String? fincome,
    String? falive,
    String? fdisabled,
    String? foccupation,
    //----------------------------------
    String? mname,
    String? mincome,
    String? malive,
    String? mdisabled,
    String? moccupation,
    //--------------------------------------
    String? gname,
    String? gincome,
    String? galive,
    String? gdisabled,
    String? goccupation,
    //-----------------------------------
     List? SiblingSdtafromHive ,
   
  }) async {
    final rawData =

        // {
        //   "guardians": [
        //     {
        //       "name": fname,
        //       "alive": falive,
        //       "disabled": fdisabled,
        //       "ocupation": foccupation,
        //       "income": fincome,
        //       "relation": "father"
        //     },
        //     {
        //       "name": mname,
        //       "alive": malive,
        //       "disabled": mdisabled,
        //       "ocupation": moccupation,
        //       "income": mincome,
        //       "relation": "mother"
        //     },
        //     {
        //       "name": gname,
        //       "alive": galive,
        //       "disabled": gdisabled,
        //       "ocupation": goccupation,
        //       "income": gincome,
        //       "relation": "guardian"
        //     }
        //   ],
        //   "siblings": [
        //     {
        //       "name": "Shyam",
        //       "gender": "m",
        //       "qualification": 2,
        //       "course": 5,
        //       "occupation": 9
        //     }
        //   ]
        // };

        {
      "guardians": [
        {
          "name": "Ravi11",
          "alive": 1,
          "disabled": 1,
          "ocupation": 99,
          "income": 12000,
          "relation": "father"
        },
        {
          "name": "Sathi",
          "alive": 0,
          "disabled": 1,
          "ocupation": 99,
          "income": 0,
          "relation": "mother"
        },
        {
          "name": "akash11",
          "alive": 1,
          "disabled": 1,
          "ocupation": 89,
          "income": 12000,
          "relation": "guardian"
        }
      ],
    //  "siblings": SiblingSdtafromHive,
    "siblings": [
        {
            "name": "Shyam",
            "gender": "m",
            "qualification": 2,
            "course": 5,
            "occupation": 9
        }
       
    ]
    };
    final response = await http.post(
      Uri.parse('https://pankajtrust.org/api/student/family_info?id=513491'),
      body: jsonEncode(rawData),
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
    );

    if (response.statusCode == 200) {
      print('response fro aaaaaaaaaapi familly ${response.body.toString()}');
      return FamilyData.fromJson(json.decode(response.body));
    } else {
      // Handle error response if needed
      print('Failed to post personal info: ${response.statusCode}');
      throw Exception('Failed to post personal info: ${response.statusCode}');
    }
  }
}
