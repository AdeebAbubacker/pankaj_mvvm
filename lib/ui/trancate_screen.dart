import 'package:flutter/material.dart';
import 'package:panakj_app/core/service/firebase_sibling.dart';


class SiblingsData extends StatelessWidget {
  SiblingsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // Example data to post
                Map<String, dynamic> data = {
                  'name': 'John Doe',
                  'age': 25,
                  'siblings': ['Jane', 'Michael', 'Emily']
                  // Add other fields as needed
                };

                // Instantiate your FirestoreService
                FirestoreService firestoreService = FirestoreService();

                // Call the postData method with your data
                await firestoreService.postData(data);

                // Handling success, you may navigate to another page or show a success message
                print('Personal info posted successfully');
              },
              child: const Text('Post Personal Info'),
            ),
          ],
        ),
      ),
    );
  }
}
