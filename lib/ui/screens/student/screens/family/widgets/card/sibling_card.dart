import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/course_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/lineDivider.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/occupation_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/qualification_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/horizontal_radiobtn.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';

const kvioletColor3 = Colors.purple; // Replace with your color definition

class SiblingsCard extends StatefulWidget {
  const SiblingsCard({super.key});

  @override
  State<SiblingsCard> createState() => _SiblingsCardState();
}

class _SiblingsCardState extends State<SiblingsCard> {
  Map<int, Widget> cards = {}; // Map to store cards with unique keys
  Map<int, TextEditingController> controllers =
      {}; // Map to store controllers for each card
  int _currentKeyfo11 = 0; // Variable to keep track of unique keys
  int _currentKeynormal = 1; // Variable to keep track of unique keys
  String? selectedDropdownValue;
  String? selectedFilePath;

  @override
  void initState() {
    _firstcard();
    // TODO: implement initState
    // Timer.periodic(Duration(seconds: 7), (timer) {
    //   _printValuesWithKeys();
    // });
    super.initState();
  }

  void _printValuesWithKeys() {
    final box = Hive.box<SiblingCardDB>('aseebsiblingbox');
    final List<int> keys = box.keys.cast<int>().toList();
    for (int key in keys) {
      final achievment = box.get(key);
      if (achievment != null) {
        print('ID: $key, Achievement: ${achievment.name}');
        print('ID: $key, category: ${achievment.courseofstudy}');
        print('ID: $key, uploadfile: ${achievment.courseofstudy}');
      } else {
        print('ID: $key, Achievement: No Achievement');
      }
    }
  }

  void _firstcard() {
    setState(() {
      final currentKey = _currentKeyfo11; // Store the current key
      final controller = TextEditingController();
      controllers[currentKey] = controller;
      Hive.box<SiblingCardDB>('aseebsiblingbox').put(
        currentKey,
        SiblingCardDB(
          courseofstudy: 1,
          gender: 's',
           name: controllers[currentKey]?.text ?? 'dd',
          occupation: 1,
          qualification: 1,
        ),
      );
      controller.addListener(() {
        // Update the corresponding value in Hive using the correct key
        Hive.box<SiblingCardDB>('aseebsiblingbox').put(
          currentKey,
          SiblingCardDB(
            courseofstudy: 1,
            gender: 's',
             name: controllers[currentKey]?.text ?? 'dd',
            occupation: 1,
            qualification: 1,
          ),
        );
      });

      cards[currentKey] = _buildInitialCard(currentKey);
    });
  }

  void _addCard() {
    setState(() {
      final currentKey = _currentKeynormal; // Store the current key
      final controller = TextEditingController();
      controllers[currentKey] = controller;
      Hive.box<SiblingCardDB>('aseebsiblingbox').put(
        currentKey,
        SiblingCardDB(
          courseofstudy: 1,
          gender: 's',
        name: controllers[currentKey]?.text ?? 'dd',
          occupation: 1,
          qualification: 1,
        ),
      );
      controller.addListener(() {
        // Update the corresponding value in Hive using the correct key
        Hive.box<SiblingCardDB>('aseebsiblingbox').put(
          currentKey,
          SiblingCardDB(
            courseofstudy: 1,
            gender: 's',
            name: controllers[currentKey]?.text ?? 'dd',
            occupation: 1,
            qualification: 1,
          ),
        );
      });

      cards[currentKey] = _buildCard(currentKey);

      _currentKeynormal++;
    });
  }

  void _deleteCard(int key) async {
    await Hive.box<SiblingCardDB>('aseebsiblingbox').delete(key);
    setState(() {
      controllers[key]?.dispose();
      controllers.remove(key);
      cards.remove(key);
    });
  }

  void _updateHiveData(int key) {
    // Update Hive data using the provided key
    Hive.box<SiblingCardDB>('aseebsiblingbox').put(
      key,
      SiblingCardDB(
        courseofstudy: 1,
        gender: 's',
        name: controllers[key]?.text ?? 'dd',
        occupation: 1,
        qualification: 1,
      ),
    );
  }

  // Function to build a card widget
  Widget _buildCard(int key) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent, // Allow taps to pass through
          onTap: () {
            _updateHiveData(key);
          },
          child: Container(
            width: 380,
            height: 580,
            color: Colors.transparent,
          ),
        ),
        Container(
          width: 380,
          height: 580,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LineDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 247, 247, 247),
                      ),
                    ),
                    onPressed: () {
                      _deleteCard(key);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete_outline_rounded),
                        Text('Remove'),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 12),
                child: Text('Brother / Sister', style: kfamiltTitleTextColor),
              ),
              LabelInputText(
                label: 'Name',
                StringInput: controllers[key] as TextEditingController,
                focusNode: FocusNode(),
              ),
              BlocProvider<HorizontalRadioBtnBloc>(
                key: const Key('siblinggenderBloc2'),
                create: (context) => HorizontalRadioBtnBloc(),
                child: HorizontalRadioBtn(
                  steps: [
                    Content(choiceLabel: 'Male'),
                    Content(choiceLabel: 'Female'),
                  ],
                  title: 'Gender',
                ),
              ),
              InputLabel(mytext: 'Qualification'),
              QualificationbottomSheet(title: 'title'),
              const HeightSpacer(),
              InputLabel(mytext: 'Course of Study'),
              CoursebottomSheet(title: 'Course of Study'),
              const HeightSpacer(),
              InputLabel(mytext: 'Occupation / Job'),
              OccupationBottomSheet(title: 'title'),
            ],
          ),
        ),
      ],
    );
  }

  // Function to build a card widget
  Widget _buildInitialCard(int key) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent, // Allow taps to pass through
          onTap: () {
            _updateHiveData(key);
          },
          child: Container(
            width: 380,
            height: 480,
            color: Colors.transparent,
          ),
        ),
        Container(
          width: 380,
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 12),
                child: Text('Brother / Sister', style: kfamiltTitleTextColor),
              ),
              LabelInputText(
                label: 'Name',
                StringInput: controllers[key] as TextEditingController,
                focusNode: FocusNode(),
              ),
              BlocProvider<HorizontalRadioBtnBloc>(
                key: const Key('siblinggenderBloc2'),
                create: (context) => HorizontalRadioBtnBloc(),
                child: HorizontalRadioBtn(
                  steps: [
                    Content(choiceLabel: 'Male'),
                    Content(choiceLabel: 'Female'),
                  ],
                  title: 'Gender',
                ),
              ),
              InputLabel(mytext: 'Qualification'),
              QualificationbottomSheet(title: 'title'),
              const HeightSpacer(),
              InputLabel(mytext: 'Course of Study'),
              CoursebottomSheet(title: 'Course of Study'),
              const HeightSpacer(),
              InputLabel(mytext: 'Occupation / Job'),
              OccupationBottomSheet(title: 'title'),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for (var entry in cards.entries) entry.value,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addCard,
                child: const Text('Add More Cards'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
