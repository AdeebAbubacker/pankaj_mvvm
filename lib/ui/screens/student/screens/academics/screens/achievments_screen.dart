import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/achievments_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/achievments_card.dart';

class AchievmentsScreen extends StatelessWidget {
  final FocusNode focusNode;

  AchievmentsScreen({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Hive.box<AchievmentDB>('achievmentBox').watch(),
      builder: (context, snapshot) {
        final Box<AchievmentDB> box = Hive.box<AchievmentDB>('achievmentBox');
        final numberOfAchievements = box.length;
        final dynamicHeight = 70 + (numberOfAchievements * 485);

        // Timer.periodic(Duration(seconds: 3), (timer) {
        //   print("Number of achievments1 : ${box.isEmpty}");
        //   print("Number of achievments2 : ${box.keys.length}");
        //   print("Number of achievments3 : ${box.length}");
        // });

        print("Family Layout Height: ${6460 + box.keys.length * 500}");

        return SingleChildScrollView(
          child: Column(
            children: [
              Achievmentslayout(
                  achievmentDetailsCard: AchievmentsCard(),
                  title: 'Achievments',
                  achievmentslayoutheight: dynamicHeight.toDouble()),
            ],
          ),
        );
      },
    );
  }
}
