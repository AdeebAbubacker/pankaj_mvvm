import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/file_picker.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/drop_down_menu.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'dart:async';
import 'package:hive/hive.dart';

class AchievmentsCard extends StatefulWidget {
  const AchievmentsCard({Key? key}) : super(key: key);

  @override
  State<AchievmentsCard> createState() => _SiblingsCardState();
}

class _SiblingsCardState extends State<AchievmentsCard> {
  Map<int, Widget> cards = {}; // Map to store cards with unique keys
  Map<int, TextEditingController> controllers =
      {}; // Map to store controllers for each card
  int _currentKeyfo11 = 0; // Variable to keep track of unique keys
  int _currentKeynormal = 1; // Variable to keep track of unique keys
  String? selectedDropdownValue;
  String? selectedFilePath;

  @override
  void initState() {
    _firstCard();
    Timer.periodic(Duration(seconds: 7), (timer) {
      _printValuesWithKeys();
    });
    super.initState();
  }

  void _printValuesWithKeys() {
    final box = Hive.box<AchievmentDB>('achievmentBox');
    final List<int> keys = box.keys.cast<int>().toList();
    for (int key in keys) {
      final achievment = box.get(key);
      if (achievment != null) {
        print('ID: $key, achievment: ${achievment.achievmentController}');
        print('ID: $key, achievment: ${achievment.achievmentController}');
        print('ID: $key, achievment: ${achievment.achievmentController}');
      } else {
        print('ID: $key, achievment: No achievment');
      }
    }
  }

  void _firstCard() {
    final box = Hive.box<AchievmentDB>('achievmentBox');
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
          controller.text = data.achievmentController;
          selectedDropdownValue = data.achievmentController;
        }
        controller.addListener(() {
          _updateHiveData(key);
        });
        cards[key] = _buildCard(key);
      }
    });
  }

  void _addCard() {
    final currentKey = cards.keys.isEmpty ? 0 : cards.keys.reduce(max) + 1;
    final controller = TextEditingController();
    controllers[currentKey] = controller;
    controller.addListener(() {
      _updateHiveData(currentKey);
    });

    setState(() {
      Hive.box<AchievmentDB>('achievmentBox').put(
        currentKey,
        AchievmentDB(
          achievmentController: controller.text.isNotEmpty ? controller.text : 'No Category',
          category: 'd',
          uploadfile: '',
        ),
      );

      cards[currentKey] = _buildCard(currentKey);
    });
  }

  void _deleteCard(int key) async {
    await Hive.box<AchievmentDB>('achievmentBox').delete(key);
    setState(() {
      controllers[key]?.dispose();
      controllers.remove(key);
      cards.remove(key);
    });
  }

  void _updateHiveData(int key) {
    Hive.box<AchievmentDB>('achievmentBox').put(
      key,
      AchievmentDB(
        achievmentController: controllers[key]?.text ?? 'No Category',
        category: 'd',
        uploadfile: '',
      ),
    );
  }

  Widget _buildCard(int key) {
    return LayoutBuilder(builder: (context, constraints) {
      if (key == 0) {
        return _buildInitialCard(key);
      } else {
        final width = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                _updateHiveData(key);
              },
              child: Container(
                width: width * 0.9,
                height: 428,
                color: Colors.transparent,
              ),
            ),
            Container(
              width: width * 0.9,
              height: 428,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                    width: 380,
                    color: const Color.fromARGB(255, 187, 189, 190),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 8),
                  InputLabel(mytext: 'Category'),
                  MyDropdown(
                    onDropdownChanged: (value) {
                      setState(() {
                        selectedDropdownValue = value;
                        _updateHiveData(key);
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  LabelInputText(
                    label: 'Achievement Details',
                    maxlines: 3,
                    StringInput: controllers[key]!,
                    focusNode: FocusNode(),
                  ),
                  const SizedBox(height: 8),
                  InputLabel(mytext: 'Upload File'),
                  FilePickerScreen(
                    onFileSelected: (filePath) {
                      setState(() {
                        selectedFilePath = filePath;
                      });
                    },
                  ),
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
          onTap: () {
            _updateHiveData(key);
          },
          child: Container(
            width: 400,
            height: 428,
          ),
        ),
        Container(
          width: 400,
          height: 428,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              InputLabel(mytext: 'Category'),
              MyDropdown(
                onDropdownChanged: (value) {
                  setState(() {
                    selectedDropdownValue = value;
                    _updateHiveData(key);
                  });
                },
              ),
              const SizedBox(height: 8),
              LabelInputText(
                label: 'Achievement Details',
                maxlines: 3,
                StringInput: controllers[key]!,
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 8),
              InputLabel(mytext: 'Upload File'),
              FilePickerScreen(
                onFileSelected: (filePath) {
                  setState(() {
                    selectedFilePath = filePath;
                  });
                },
              ),
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
