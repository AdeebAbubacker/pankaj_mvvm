import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/db/boxes/achievment_box.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/sibling_edu_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/file_picker.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/drop_down_menu.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:panakj_app/ui/view_model/alive_ordisabled_fieldadmin/alive_ordisabled_fieldadmin_bloc.dart';

const kvioletColor3 = Colors.purple; // Replace with your color definition


class SiblingCurrentStatusCard extends StatefulWidget {
  const SiblingCurrentStatusCard({super.key});

  @override
  State<SiblingCurrentStatusCard> createState() =>
      _SiblingCurrentStatusCardState();
}

class _SiblingCurrentStatusCardState extends State<SiblingCurrentStatusCard> {
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
          ?.dispose(); 
      controllers.remove(key);
      cards.remove(key);
    
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
    final bloc = AliveOrdisabledFieldadminBloc();

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _updateHiveData(key);
          },
          child: Container(
            width: 400,
            height: 198,
            color: Colors.transparent,
          ),
        ),
        Container(
          width: 400,
          height: 198,
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
              Row(
                children: [
                  Text('Qualification'),
                  Spacer(),
                  SiblingEducationalBottomSheet(title: ''),
                ],
              ),
              Row(
                children: [
                  Text('Alive or Disabled'),
                  Spacer(),
                  Text('Yes'),
                  BlocBuilder<AliveOrdisabledFieldadminBloc,
                      AliveOrdisabledFieldadminState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return Checkbox(
                        value: state.alivetrue,
                        onChanged: (value) {
                          bloc.add(
                              AliveOrdisabledFieldadminEvent.togglealive());
                        },
                      );
                    },
                  ),
                  Text('No'),
                  BlocBuilder<AliveOrdisabledFieldadminBloc,
                      AliveOrdisabledFieldadminState>(
                    bloc: bloc, // Pass the bloc instance here
                    builder: (context, state) {
                      return Checkbox(
                        value: state.notalivefalse,
                        onChanged: (value) {
                          bloc.add(
                              AliveOrdisabledFieldadminEvent.togglenotalive());
                        },
                      );
                    },
                  ),
                ],
              ),
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
          onTap: () {
            _updateHiveData(key);
          },
          child: Container(
            width: 400,
            height: 136,
          ),
        ),
        Container(
          width: 400,
          height: 136,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(),
              Row(
                children: [
                  Text('Qualification'),
                  Spacer(),
                  SiblingEducationalBottomSheet(title: ''),
                ],
              ),
              Row(
                children: [
                  Text('Alive or Disabled'),
                  Spacer(),
                  Text('Yes'),
                  BlocBuilder<AliveOrdisabledFieldadminBloc,
                      AliveOrdisabledFieldadminState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: context
                            .read<AliveOrdisabledFieldadminBloc>()
                            .state
                            .alivetrue,
                        onChanged: (value) {
                          context.read<AliveOrdisabledFieldadminBloc>().add(
                              AliveOrdisabledFieldadminEvent.togglealive());
                        },
                      );
                    },
                  ),
                  Text('No'),
                  BlocBuilder<AliveOrdisabledFieldadminBloc,
                      AliveOrdisabledFieldadminState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: context
                            .read<AliveOrdisabledFieldadminBloc>()
                            .state
                            .notalivefalse,
                        onChanged: (value) {
                          context.read<AliveOrdisabledFieldadminBloc>().add(
                              AliveOrdisabledFieldadminEvent.togglenotalive());
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
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
