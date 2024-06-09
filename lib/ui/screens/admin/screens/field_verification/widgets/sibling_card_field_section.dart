import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/db/boxes/achievment_box.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/file_picker.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/drop_down_menu.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'dart:async';
import 'package:hive/hive.dart';

const kvioletColor3 = Colors.purple; // Replace with your color definition

class SiblingsQualificationCard extends StatefulWidget {
  const SiblingsQualificationCard({super.key});

  @override
  State<SiblingsQualificationCard> createState() =>
      _SiblingsQualificationCardState();
}

class _SiblingsQualificationCardState extends State<SiblingsQualificationCard> {
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

    super.initState();
  }

  void _printValuesWithKeys() {
    final box = Hive.box<AchievmentDB>('achievmentBox');
    final List<int> keys = box.keys.cast<int>().toList();
    for (int key in keys) {
      final achievment = box.get(key);
      if (achievment != null) {
        print('ID: $key, Achievement: ${achievment.achievmentController}');
        print('ID: $key, category: ${achievment.category}');
        print('ID: $key, uploadfile: ${achievment.uploadfile}');
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
      controller.addListener(() {
        // Update the corresponding value in Hive using the correct key
        Hive.box<AchievmentDB>('achievmentBox').put(
          currentKey,
          AchievmentDB(
            category: selectedDropdownValue ?? 'No Category',
            uploadfile: 'ss',
            achievmentController:
                controller.text.isNotEmpty ? controller.text : 'No Achievement',
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
      Hive.box<AchievmentDB>('achievmentBox').put(
        currentKey,
        AchievmentDB(
          category: selectedDropdownValue ?? 'No Category',
          uploadfile: 'ss',
          achievmentController:
              controller.text.isNotEmpty ? controller.text : 'No Achievement',
        ),
      );
      controller.addListener(() {
        // Update the corresponding value in Hive using the correct key
        Hive.box<AchievmentDB>('achievmentBox').put(
          currentKey,
          AchievmentDB(
            category: selectedDropdownValue ?? 'No Category',
            uploadfile: 'ss',
            achievmentController:
                controller.text.isNotEmpty ? controller.text : 'No Achievement',
          ),
        );
      });

      cards[currentKey] = _buildCard(currentKey);

      _currentKeynormal++;
    });
  }

  // Function to delete a card by its key
  void _deleteCard(int key) async {
    await Hive.box<AchievmentDB>('achievmentBox').delete(key);
    setState(() {
      controllers[key]
          ?.dispose(); // Dispose the controller when the card is deleted
      controllers.remove(key);
      cards.remove(key);
      //  Hive.box<AchievmentDB>('achievmentBox').delete(controllers[key]);
    });
  }

  void _updateHiveData(int key) {
    // Update Hive data using the provided key
    Hive.box<AchievmentDB>('achievmentBox').put(
      key,
      AchievmentDB(
        achievmentController: controllers[key]?.text ?? 'No Achievement',
        category: selectedDropdownValue ?? 'No Category',
        uploadfile: 'ss',
      ),
    );
  }

  // Function to build a card widget
  Widget _buildCard(int key) {
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
              const HeightSpacer(),
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
              InputLabel(mytext: 'Qualification'),
              MyDropdown(
                onDropdownChanged: (value) {
                  setState(() {
                    selectedDropdownValue = value;
                    _updateHiveData(key);
                  });
                },
              ),
              const HeightSpacer(height: 8),
              LabelInputText(
                label: 'Achievement Details',
                maxlines: 3,
                StringInput: controllers[key] as TextEditingController,
                focusNode: FocusNode(),
              ),
              const HeightSpacer(),
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

  // Function to build a card widget
  Widget _buildInitialCard(int key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
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
            width: 300,
            height: 428,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
                InputLabel(mytext: 'Qualification'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (var entry in cards.entries) entry.value,
              ],
            ),
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
