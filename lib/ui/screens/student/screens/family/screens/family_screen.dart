import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/family/screens/family_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/family_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/sibling_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/do_you_have_siblings.dart';
import 'package:panakj_app/ui/view_model/family/family_bloc.dart';

// class FamilyScreen extends StatelessWidget {
//   TextEditingController fathernameController = TextEditingController();
//   TextEditingController fatherincomeController = TextEditingController();
//   TextEditingController mothernameController = TextEditingController();
//   TextEditingController motherincomeController = TextEditingController();
//   TextEditingController guardianameController = TextEditingController();
//   TextEditingController guardiaincomeController = TextEditingController();
//   FocusNode realtionfocusNode;
//   FocusNode siblingnamefocusNode;
//   FocusNode fathericomefocusnode;
//   FocusNode mothericomefocusnode;
//   FocusNode guardianicomefocusnode;
//   FocusNode fatherfocusNode;
//   FocusNode motherfocusNode;
//   FocusNode guardianfocusNode;

//   ///------------------ siblings card ----------------------------
//   TextEditingController siblingnameController1;
//   TextEditingController siblingnameController2;
//   TextEditingController siblingnameController3;
//   TextEditingController siblingnameController4;
//   TextEditingController siblingnameController5;

//   FamilyScreen({
//     super.key,
//     required this.fathernameController,
//     required this.fatherincomeController,
//     required this.fathericomefocusnode,
//     required this.mothernameController,
//     required this.mothericomefocusnode,
//     required this.guardianicomefocusnode,
//     required this.realtionfocusNode,
//     required this.fatherfocusNode,
//     required this.motherfocusNode,
//     required this.guardianfocusNode,
//     required this.siblingnamefocusNode,
//     required this.guardianameController,
//     required this.motherincomeController,
//     required this.guardiaincomeController,
//     required this.siblingnameController1,
//     required this.siblingnameController2,
//     required this.siblingnameController3,
//     required this.siblingnameController4,
//     required this.siblingnameController5,

//     ///------------------ siblings card ----------------------------
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: Hive.box<SiblingCardDB>('aseebsiblingbox').listenable(),
//       builder: (context, Box<SiblingCardDB> box, child) {
//         return BlocBuilder<FamilyBloc, FamilyState>(
//           builder: (context, state) {
//             final siblings = box.values.toList();
//             final numberOfSiblings = siblings.length;
//             Timer.periodic(Duration(seconds: 3), (timer) {
//               print("Number of Siblings: $numberOfSiblings");
//               print("Number of Siblings in state: ${state.siblings}");
//             });

//             print(
//                 "Family Layout Height: ${6460 + (numberOfSiblings > 1 ? numberOfSiblings * 545 : 0)}");

//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   FamilyLayout(
//                     familyLayoutheight: 1460,
//                     title: 'Family Details',
//                     familyDetailsCard: FamilyCard(
//                       fathernameController: fathernameController,
//                       fathericomefocusnode: fathericomefocusnode,
//                       mothernameController: mothernameController,
//                       mothericomefocusnode: mothericomefocusnode,
//                       guardianameController: guardianameController,
//                       guardianicomefocusnode: guardianicomefocusnode,
//                       realtionfocusNode: realtionfocusNode,
//                       fatherfocusNode: fatherfocusNode,
//                       motherfocusNode: motherfocusNode,
//                       guardianfocusNode: guardianfocusNode,
//                       mybool: false,
//                       siblings: DoYouHaveSiblings(),
//                       fatherincomeController: fatherincomeController,
//                       motherincomeController: motherincomeController,
//                       guardiaincomeController: guardiaincomeController,
//                     ),
//                   ),
//                   state.siblings
//                       ? Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: FamilyLayout(
//                             familyLayoutheight: 893 +
//                                 (numberOfSiblings > 0
//                                     ? numberOfSiblings * 545
//                                     : 0),
//                             title: 'Siblings Details',
//                             familyDetailsCard: SiblingsCard(),
//                           ),
//                         )
//                       : const Text(''),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

class FamilyScreen extends StatelessWidget {
  TextEditingController fathernameController = TextEditingController();
  TextEditingController fatherincomeController = TextEditingController();
  TextEditingController mothernameController = TextEditingController();
  TextEditingController motherincomeController = TextEditingController();
  TextEditingController guardianameController = TextEditingController();
  TextEditingController guardiaincomeController = TextEditingController();
  FocusNode realtionfocusNode;
  FocusNode siblingnamefocusNode;
  FocusNode fathericomefocusnode;
  FocusNode mothericomefocusnode;
  FocusNode guardianicomefocusnode;
  FocusNode fatherfocusNode;
  FocusNode motherfocusNode;
  FocusNode guardianfocusNode;

  ///------------------ siblings card ----------------------------
  TextEditingController siblingnameController1;
  TextEditingController siblingnameController2;
  TextEditingController siblingnameController3;
  TextEditingController siblingnameController4;
  TextEditingController siblingnameController5;

  FamilyScreen({
    super.key,
    required this.fathernameController,
    required this.fatherincomeController,
    required this.fathericomefocusnode,
    required this.mothernameController,
    required this.mothericomefocusnode,
    required this.guardianicomefocusnode,
    required this.realtionfocusNode,
    required this.fatherfocusNode,
    required this.motherfocusNode,
    required this.guardianfocusNode,
    required this.siblingnamefocusNode,
    required this.guardianameController,
    required this.motherincomeController,
    required this.guardiaincomeController,
    required this.siblingnameController1,
    required this.siblingnameController2,
    required this.siblingnameController3,
    required this.siblingnameController4,
    required this.siblingnameController5,

    ///------------------ siblings card ----------------------------
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Hive.box<SiblingCardDB>('aseebsiblingbox').watch(),
      builder: (context, snapshot) {
        final Box<SiblingCardDB> box =
            Hive.box<SiblingCardDB>('aseebsiblingbox');
        final numberOfAchievements = box.length;
        final dynamicHeight = 0 + (numberOfAchievements * 620);

        // Timer.periodic(Duration(seconds: 3), (timer) {
        //   print("Number of siblings1 : ${box.isEmpty}");
        //   print("Number of  siblings 2 : ${box.keys.length}");
        //   print("Number of  siblings 3 : ${box.length}");
        // });

        print("Family Layout Height: ${760 + box.keys.length * 500}");

        return SingleChildScrollView(
          child: Column(
            children: [
              FamilyLayout(
                familyLayoutheight: 1460,
                title: 'Family Details',
                familyDetailsCard: FamilyCard(
                  fathernameController: fathernameController,
                  fathericomefocusnode: fathericomefocusnode,
                  mothernameController: mothernameController,
                  mothericomefocusnode: mothericomefocusnode,
                  guardianameController: guardianameController,
                  guardianicomefocusnode: guardianicomefocusnode,
                  realtionfocusNode: realtionfocusNode,
                  fatherfocusNode: fatherfocusNode,
                  motherfocusNode: motherfocusNode,
                  guardianfocusNode: guardianfocusNode,
                  mybool: false,
                  siblings: DoYouHaveSiblings(),
                  fatherincomeController: fatherincomeController,
                  motherincomeController: motherincomeController,
                  guardiaincomeController: guardiaincomeController,
                ),
              ),
              // state.siblings
              //     ? Padding(
              //         padding: const EdgeInsets.only(top: 20),
              //         child: FamilyLayout(
              //           familyLayoutheight: 893 +
              //               (numberOfSiblings > 0
              //                   ? numberOfSiblings * 545
              //                   : 0),
              //           title: 'Siblings Details',
              //           familyDetailsCard: SiblingsCard(),
              //         ),
              //       )
              //     : const Text(''),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FamilyLayout(
                  familyLayoutheight: dynamicHeight.toDouble(),
                  title: 'Siblings Details',
                  familyDetailsCard: SiblingsCard(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
