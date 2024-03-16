import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';
import 'package:panakj_app/core/service/academic_service.dart';
import 'package:panakj_app/core/service/auth_service.dart';
import 'package:panakj_app/core/service/family_service.dart';
import 'package:panakj_app/core/service/residential_service.dart';
import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';

// class AchievmentsData extends StatelessWidget {
//   AchievmentsData({super.key});
//   final AuthService authService = AuthService();
//   final Box<AchievmentDB> box = Hive.box<AchievmentDB>('achievmentBox');
//   List<Map<String, dynamic>> achievementsList = [];

//   void printAchievementsList() {
//     achievementsList.clear(); // Clear previous list before populating
//     for (var i = 0; i < box.length; i++) {
//       final achievement = box.getAt(i);
//       final achievementMap = {
//         'category': achievement?.category.toString(),
//         'achievement_details': achievement?.achievmentController.toString(),
//         'upload_file': 44,
//       };
//       achievementsList.add(achievementMap);
//     }
//     print("Achievements list: $achievementsList");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final numberOfAchievements = box.length;

//     // Print achievements list immediately
//     printAchievementsList();

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 // Call the postPersonalInfoservice method with required parameters

//                 // Ensure achievements list is populated before posting
//                 print(
//                     'Posting personal info with achievements: $achievementsList');
//                 await AcademicService().postAcademicService(
//                     sslcmark: '12',
//                     marksplusone: '1',
//                     marksplustwo: '1',
//                     schoolId: '2',
//                     hallTicket: '2',
//                     preferredcourse: '2',
//                     achievement: achievementsList);

//                 // await fivemvService().postPersonalInfoservice();
//                 // Handling success, you may navigate to another page or show a success message
//                 print('Personal info posted successfully');
//               },
//               child: const Text('Post Personal Info'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SiblingsData extends StatelessWidget {
  SiblingsData({super.key});

  final Box<SiblingCardDB> box = Hive.box<SiblingCardDB>('aseebsiblingbox');
  List<Map<String, dynamic>> siblingsList = [];

  void printsiblingsList() {
    siblingsList.clear(); // Clear previous list before populating
    for (var i = 0; i < box.length; i++) {
      final siblings = box.getAt(i);
      // final siblingsMap = {
      //   'category': siblings?.category.toString(),
      //   'achievement_details': siblings?.achievmentController.toString(),
      //   'upload_file': 44,
      // };
      final siblingsMap = {
        "name": "Shyam",
        "gender": "m",
        "qualification": 2,
        "course": 5,
        "occupation": 9
      };
      siblingsList.add(siblingsMap);
    }
    print("Achievements list: $siblingsList");
  }

  @override
  Widget build(BuildContext context) {
    final numberOfAchievements = box.length;

    // Print achievements list immediately
    printsiblingsList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // Call the postPersonalInfoservice method with required parameters

                // Ensure achievements list is populated before posting
                print('Posting personal info with achievements: $siblingsList');
                BlocProvider.of<FamilyInfoBloc>(context)
                    .add(FamilyInfoEvent.postFamilyInfo(
                  SiblingsdatafromHive: siblingsList,
                ));
                await FamilyInfoService().postfamilyInfoservice(
                  SiblingSdtafromHive: siblingsList,
                  falive: '',
                  fdisabled: '',
                  fincome: '',
                  fname: '',
                  foccupation: '',
                  galive: '',
                  gdisabled: '',
                  gincome: '',
                  gname: '',
                  goccupation: '',
                  malive: '',
                  mdisabled: '',
                  mincome: '',
                  mname: '',
                  moccupation: '',
                );

                // await fivemvService().postPersonalInfoservice();
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
