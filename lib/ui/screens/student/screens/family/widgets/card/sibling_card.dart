import 'dart:math';

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

class SiblingsCard extends StatefulWidget {
  const SiblingsCard({Key? key}) : super(key: key);

  @override
  State<SiblingsCard> createState() => _SiblingsCardState();
}

class _SiblingsCardState extends State<SiblingsCard> {
  Map<int, Widget> cards = {}; // Map to store cards with unique keys
  Map<int, TextEditingController> controllers =
      {}; // Map to store controllers for each card
  Map<int, String> filePaths = {};
    Map<int, String> occupationfilePaths = {};
      Map<int, String> coursefilePaths = {};
  int _currentKeyfo11 = 0; // Variable to keep track of unique keys
  int _currentKeynormal = 1; // Variable to keep track of unique keys
  String? selectedDropdownValue;
  String? selectedFilePath;

  @override
  void initState() {
    _firstCard();
  
    super.initState();
  }

  void _firstCard() {
    final box = Hive.box<SiblingCardDB>('aseebsiblingbox');
    final List<int> keys = box.keys.cast<int>().toList();

    // Check if there are no achievements in the box
    if (keys.isEmpty) {
      final controller = TextEditingController();
      controllers[0] = controller;
      controller.addListener(() {
        _updateHiveData(0);
      });
      cards[0] = _buildInitialCard(0);
      return; // Exit the method if there are no achievements
    }

    setState(() {
      for (int key in keys) {
        final controller = TextEditingController();
        final data = box.get(key);
        controllers[key] = controller;
        if (data != null) {
          controller.text = data.name;
          selectedDropdownValue = data.gender;
          filePaths[key] = data.qualification ?? 'dd'; // Load file path from Hive
          occupationfilePaths[key] = data.occupation ?? 'dd';
          coursefilePaths[key] = data.courseofstudy ?? 'dd';
        }
        controller.addListener(() {
          _updateHiveData(key);
        });
        cards[key] = _buildCard(key);
      }
    });
  }

  void _addCard() async {
    final currentKey = cards.keys.isEmpty ? 0 : cards.keys.reduce(max) + 1;
    final controller = TextEditingController();
    controllers[currentKey] = controller;
    controller.addListener(() {
      _updateHiveData(currentKey);
    });

    setState(() {
      Hive.box<SiblingCardDB>('aseebsiblingbox').put(
        currentKey,
        SiblingCardDB(
          name: selectedDropdownValue ?? 'No Category',
          gender: 'ss',
          occupation:
              occupationfilePaths[currentKey] ?? 'sded',
          courseofstudy:    coursefilePaths[currentKey] ?? 'sded',
          // Store filePaths[currentKey] directly as String
          qualification: filePaths[currentKey] ?? 'aaaaaaaaaaaa', 
        ),
      );

      cards[currentKey] = _buildCard(currentKey);
    });
  }

  void _deleteCard(int key) async {
    await Hive.box<SiblingCardDB>('aseebsiblingbox').delete(key);
    setState(() {
      controllers[key]?.dispose();
      controllers.remove(key);
      cards.remove(key);
      filePaths.remove(key);
      occupationfilePaths.remove(key);
      coursefilePaths.remove(key);
    });
  }

  void _updateHiveData(int key) {
    Hive.box<SiblingCardDB>('aseebsiblingbox').put(
      key,
      SiblingCardDB(
        name: controllers[key]?.text ?? 'No Achievement',
        courseofstudy: coursefilePaths[key] ?? 'lllllllllll', 
        gender: '',
        occupation: occupationfilePaths[key] ?? 'lllllllllll', 
        // Use filePaths[key] directly
        qualification: filePaths[key] ?? 'lllllllllll', 
      ),
    );
  }

  Widget _buildCard(int key) {
    return LayoutBuilder(builder: (context, constraints) {
      if (key == 0) {
        return _buildInitialCard(key);
      } else {
        return Stack(
          children: [
            GestureDetector(
              behavior:
                  HitTestBehavior.translucent, // Allow taps to pass through
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
                    padding: EdgeInsets.only(top: 5, bottom: 2),
                    child:
                        Text('Brother / Sister', style: kfamiltTitleTextColor),
                  ),
                  LabelInputText(
                    label: 'Name',
                    StringInput: controllers[key] as TextEditingController,
                    focusNode: FocusNode(),
                  ),
                  BlocProvider<HorizontalRadioBtnBloc>(
                    key: const Key('siblinggenderBloc2'),
                    create: (context) => HorizontalRadioBtnBloc(1),
                    child: HorizontalRadioBtn(
                      steps: [
                        Content(choiceLabel: 'Male'),
                        Content(choiceLabel: 'Female'),
                      ],
                      title: 'Gender',
                    ),
                  ),
                  InputLabel(mytext: 'Qualification'),
                  QualificationbottomSheet(
                      key: ValueKey('qualification_$key'), // Add a key to the FilePickerScreen
                      onFileSelected: (filePath) {
                        setState(() {
                          selectedFilePath = filePath.toString();
                          filePaths[key] = filePath ?? 'hhhh';
                          _updateHiveData(key);
                        });
                      },
                      initialFilePath:
                          filePaths[key].toString() ?? 'ssss', // Set the initial file path

                      title: 'title'),
                  const HeightSpacer(),
                  InputLabel(mytext: 'Course of Study'),
                  CoursebottomSheet(
                  key: ValueKey('course_$key'), // Add a key to the FilePickerScreen
                  onFileSelected: (filePath) {
                    setState(() {
                      selectedFilePath = filePath.toString();
                      coursefilePaths[key] = filePath.toString();

                      _updateHiveData(key);
                    });
                  },
                  initialFilePath: coursefilePaths[key], // Set the initial file path

                  title: 'title'),
                  const HeightSpacer(),
                  InputLabel(mytext: 'Occupation / Job'),
                
                    OccupationBottomSheet(
                    key: ValueKey('occupation_$key'), // Add a key to the FilePickerScreen
                      onFileSelected: (filePath) {
                        setState(() {
                          selectedFilePath = filePath.toString();
                          occupationfilePaths[key] = filePath ?? 'hhhh';
                          _updateHiveData(key);
                        });
                      },
                      initialFilePath:
                          occupationfilePaths[key].toString() ?? 'ssss', // Set the initial file path

                      title: 'title'),
                ],
              ),
            ),
          ],
        );
      }
    });
  }

//   // Function to build a card widget
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
              Text('data'),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 2),
                child: Text('Brother / Sister', style: kfamiltTitleTextColor),
              ),
              LabelInputText(
                label: 'Name',
                StringInput: controllers[key] as TextEditingController,
                focusNode: FocusNode(),
              ),
              BlocProvider<HorizontalRadioBtnBloc>(
                key: const Key('siblinggenderBloc2'),
                create: (context) => HorizontalRadioBtnBloc(1),
                child: HorizontalRadioBtn(
                  steps: [
                    Content(choiceLabel: 'Male'),
                    Content(choiceLabel: 'Female'),
                  ],
                  title: 'Gender',
                ),
              ),
              InputLabel(mytext: 'Qualification'),
              QualificationbottomSheet(
                  key: ValueKey('qualification_$key'), // Add a key to the FilePickerScreen
                  onFileSelected: (filePath) {
                    setState(() {
                      selectedFilePath = filePath.toString();
                      filePaths[key] = filePath.toString();

                      _updateHiveData(key);
                    });
                  },
                  initialFilePath: filePaths[key], // Set the initial file path

                  title: 'title'),
              const HeightSpacer(),
              InputLabel(mytext: 'Course of Study'),
               CoursebottomSheet(
                  key: ValueKey('course_$key'), // Add a key to the FilePickerScreen
                  onFileSelected: (filePath) {
                    setState(() {
                      selectedFilePath = filePath.toString();
                      coursefilePaths[key] = filePath.toString();

                      _updateHiveData(key);
                    });
                  },
                  initialFilePath: coursefilePaths[key], // Set the initial file path

                  title: 'title'),
              
              const HeightSpacer(),
              InputLabel(mytext: 'Occupation / Job'),
               OccupationBottomSheet(
                      key: ValueKey('occupation_$key'), // Add a key to the FilePickerScreen
                      onFileSelected: (filePath) {
                        setState(() {
                          selectedFilePath = filePath.toString();
                          occupationfilePaths[key] = filePath ?? 'hhhh';
                          _updateHiveData(key);
                        });
                      },
                      initialFilePath:
                          occupationfilePaths[key].toString() ?? 'ssss', // Set the initial file path

                      title: 'title'),
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
