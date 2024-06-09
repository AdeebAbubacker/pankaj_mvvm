
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/file_picker.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/drop_down_menu.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'dart:async';
import 'package:hive/hive.dart';

//import 'package:hive_flutter/hive_flutter.dart';



class AchievmentsCard extends StatefulWidget {
  const AchievmentsCard({Key? key}) : super(key: key);

  @override
  State<AchievmentsCard> createState() => _AchievmentsCardState();
}

class _AchievmentsCardState extends State<AchievmentsCard> {
  Map<int, Widget> cards = {}; // Map to store cards with unique keys
  Map<int, TextEditingController> controllers =
      {}; // Map to store controllers for each card
  Map<int, String?> selectedDropdownValues = {};
  Map<int, String?> filePaths = {};
  String? selectedDropdownValue;
  String? selectedFilePath;

  @override
  void initState() {
    _firstCard();
 
    super.initState();
  }

  void _printValuesWithKeys() {
    final box = Hive.box<AchievmentDB>('achievmentBox');
    final List<int> keys = box.keys.cast<int>().toList();
    for (int key in keys) {
      final achievment = box.get(key);
      if (achievment != null) {
        print('ID: $key, achievment: ${achievment.achievmentController}');
        print('ID: $key, category: ${achievment.category}');
        print('ID: $key, uploadfile: ${achievment.uploadfile}');
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
      // Store static values for initial card in Hive
      box.put(
        0,
        AchievmentDB(
          achievmentController: 'No Category',
          category: 'No Category',
          uploadfile: null,
        ),
      );
      return; // Exit the method if there are no achievements
    }

    setState(() {
      for (int key in keys) {
        final controller = TextEditingController();
        final data = box.get(key);
        controllers[key] = controller;
        if (data != null) {
          controller.text = data.achievmentController;
          selectedDropdownValues[key] = data.category;
          filePaths[key] = data.uploadfile; // Load file path from Hive
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
      final String category = selectedDropdownValues[currentKey] != null
          ? selectedDropdownValues[currentKey]!
          : 'No Category';
      Hive.box<AchievmentDB>('achievmentBox').put(
        currentKey,
        AchievmentDB(
          achievmentController:
              controller.text.isNotEmpty ? controller.text : 'No Category',
          category: category,
          uploadfile: filePaths[currentKey], // Add file path to the object
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
      selectedDropdownValues.remove(key);
      filePaths.remove(key);
    });
  }

  void _updateHiveData(int key) {
    final String category = selectedDropdownValues[key] != null
        ? selectedDropdownValues[key]!
        : 'Nothing Selected';
    Hive.box<AchievmentDB>('achievmentBox').put(
      key,
      AchievmentDB(
        achievmentController: controllers[key]?.text ?? 'No Category',
        category: category ?? 'No Category',
        uploadfile: filePaths[key], // Save file path here
      ),
    );
  }

  void _deleteFile(int key) {
    setState(() {
      filePaths[key] = null; // Remove the file path for the specified key
    });
    _updateHiveData(key); // Update Hive data to reflect the deletion
  }

  Widget _buildCard(int key) {
    bool fileSelected = filePaths[key] != null && filePaths[key]!.isNotEmpty;
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
                    initialValue: selectedDropdownValues[key],
                    onDropdownChanged: (value) {
                      setState(() {
                        selectedDropdownValues[key] = value;
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
                    key: ValueKey(key), // Add a key to the FilePickerScreen
                    onFileSelected: (filePath) {
                      setState(() {
                        selectedFilePath = filePath;
                        filePaths[key] = filePath;
                        _updateHiveData(key);
                      });
                    },
                    initialFilePath: filePaths[key], // Set the initial file path
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
    bool fileSelected = filePaths[key] != null && filePaths[key]!.isNotEmpty;
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
                initialValue: selectedDropdownValues[key],
                onDropdownChanged: (value) {
                  setState(() {
                    selectedDropdownValues[key] = value;
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
                key: ValueKey(key), // Add a key to the FilePickerScreen
                onFileSelected: (filePath) {
                  setState(() {
                    selectedFilePath = filePath;
                    filePaths[key] = filePath;
                    _updateHiveData(key);
                  });
                },
                initialFilePath: filePaths[key], // Set the initial file path
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _openFilePicker(int key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      String filePath = result.files.first.path!;
      setState(() {
        filePaths[key] = filePath; // Store file path for the selected card
      });
      _updateHiveData(key);
    }
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

