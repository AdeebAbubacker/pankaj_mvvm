import 'package:flutter/material.dart';
import 'package:panakj_app/core/service/firebase_sibling.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/achievments_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/sibling_card.dart';

class SiblingsData extends StatelessWidget {
  SiblingsData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SiblingsCard(),
              AchievmentsCard(),
              // ElevatedButton(
              //   onPressed: () async {
              //     // Example data to post
              //     Map<String, dynamic> data = {
              //       'name': 'John Doe',
              //       'age': 25,
              //       'siblings': ['Jane', 'Michael', 'Emily']
              //       // Add other fields as needed
              //     };

              //     // Instantiate your FirestoreService
              //     FirestoreService firestoreService = FirestoreService();

              //     // Call the postData method with your data
              //     await firestoreService.postData(data);

              //     // Handling success, you may navigate to another page or show a success message
              //     print('Personal info posted successfully');
              //   },
              //   child: const Text('Post Personal Info'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


// class ExampleScreen extends StatelessWidget {
//   final ExampleClass exampleClass = ExampleClass();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Call the service function when the button is pressed
//             exampleClass.serviceFunction();
//           },
//           child: Text('Call Service Function'),
//         ),
//       ),
//     );
//   }
// }
