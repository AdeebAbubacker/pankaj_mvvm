import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/cache_screen4_adapter/cache_screen4_adap.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/question_one.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/question_three.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/question_two.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/land_answer_text.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

class HomeCard extends StatefulWidget {
  TextEditingController landcontroller;
  final Widget siblings;
  bool mybool;
  FocusNode landfocusNode = FocusNode();

  final width;
  HomeCard({
    super.key,
    this.width,
    required this.mybool,
    required this.landfocusNode,
    required this.landcontroller,
    this.siblings = const Text(''),
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late bool ownHouse;
  late bool rentalHouse;
  late bool cocnreteHouse;
  late bool SheetHouse;
  late bool TilledHouse;
  late bool pipeWater;
  late bool wellWater;
  late bool otherSource;

  @override
  void initState() {
    super.initState();
    ownHouse = false;
    rentalHouse = false;
    cocnreteHouse = false;
    SheetHouse = true;
    TilledHouse = true;
    pipeWater = false;
    wellWater = false;
    otherSource = false;
    _loaddata();
    widget.landcontroller.addListener(_updateHiveData);
  }

  void _loaddata() {
    final box = Hive.box<cacheScreen4DB>('cachescreen4box');
    final List<int> keys = box.keys.cast<int>().toList();

    // Check if there are no achievements in the box
    if (keys.isEmpty) {}

    setState(() {
      final data = box.get(0);

      if (data != null) {
        ownHouse = data.ownhouse!;
        rentalHouse = data.rentalhouse!;
        SheetHouse = data.sheet!;
        cocnreteHouse = data.concrete!;
        TilledHouse = data.tilled!;
        pipeWater = data.pipewater!;
        wellWater = data.wellwater!;
        otherSource = data.othersource!;

        widget.landcontroller.text = data.land.toString();
      }
    });
  }

  void _updateHiveData() {
    Hive.box<cacheScreen4DB>('cachescreen4box').put(
      0,
      cacheScreen4DB(
          ownhouse: ownHouse,
          rentalhouse: rentalHouse,
          concrete: cocnreteHouse,
          sheet: SheetHouse,
          tilled: TilledHouse,
          pipewater: pipeWater,
          wellwater: wellWater,
          othersource: otherSource,
          land: widget.landcontroller.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '* nb: Please provide your residential details genuinely',
            style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
          const HeightSpacer(),
          const HeightSpacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'Which category best describes your current residence ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          Question1CheckBox(
            onChanged: (ownHouseValue, rentalHouseValue) {
              setState(() {
                ownHouse = ownHouseValue;
                rentalHouse = rentalHouseValue;
              });
              _updateHiveData();
            },
            initialOwnHouse: ownHouse,
            initialRentalHouse: rentalHouse,
          ),
          const HeightSpacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'What type of roofing material does your residence have ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          Question2CheckBox(
            option1: 'sheet',
            option2: 'concrete',
            option3: 'Tilled',
            onChanged: (sheet, concrete, tilled) {
              setState(() {
                SheetHouse = sheet;
                cocnreteHouse = concrete;
                TilledHouse = tilled;
              });
              _updateHiveData();
            },
            initialOption1Value: SheetHouse,
            initialOption2Value: cocnreteHouse,
            initialOption3Value: TilledHouse,
          ),
          const HeightSpacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'What is the source of drinking water at your residence ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          Question3CheckBox(
            option1: 'Pipe water',
            option2: 'Well Water',
            option3: 'Other Source',
            onChanged: (pipe, well, other) {
              setState(() {
                pipeWater = pipe;
                wellWater = well;
                otherSource = other;
              });
              _updateHiveData();
            },
            initialOption1Value: pipeWater,
            initialOption2Value: wellWater,
            initialOption3Value: otherSource,
          ),
          const HeightSpacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'How many extend of land do you own ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          LandAnswerTextField(
            landfocusNode: widget.landfocusNode,
            landcontroller: widget.landcontroller,
          )
        ],
      ),
    );
  }
}
