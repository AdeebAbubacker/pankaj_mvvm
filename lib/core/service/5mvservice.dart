// import 'package:http/http.dart' as http;

// class fivemvService {
//   Future postPersonalInfoservice() async {
//     final formData = {'email': 'santhoshaswathy820@gmail.com'};

//     final response = await http.post(
//       Uri.parse('https://dev.5minvolunteer.com/api/forgotPassword-varifyEmail'),
//       body: formData,
//     );

//     if (response.statusCode == 200) {
//       print('response fro aaaaaaaaaapi ${response.body.toString()}');
//       return response;
//     } else {
//       // Handle error response if needed
//       print('Failed to post personal info: ${response.statusCode}');
//       throw Exception('Failed to post personal info: ${response.statusCode}');
//     }
//   }
// }
