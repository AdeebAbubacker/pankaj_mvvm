import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/familycard_adapter/familycard_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/sibling_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/occupation_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/checkbox_data.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/lineDivider.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_name.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

class FamilyCard extends StatefulWidget {
  TextEditingController fathernameController = TextEditingController();
  TextEditingController fatherincomeController = TextEditingController();
  TextEditingController mothernameController = TextEditingController();
  TextEditingController motherincomeController = TextEditingController();
  TextEditingController guardianameController = TextEditingController();
  TextEditingController guardiaincomeController = TextEditingController();
  FocusNode realtionfocusNode;
  FocusNode fatherfocusNode;
  FocusNode motherfocusNode;
  FocusNode fathericomefocusnode;
  FocusNode mothericomefocusnode;
  FocusNode guardianicomefocusnode;
  FocusNode guardianfocusNode;
  final Widget siblings;
  bool mybool;
  TextEditingController relationController = TextEditingController();

  final width;
  FamilyCard({
    super.key,
    this.width,
    required this.mybool,
    required this.realtionfocusNode,
    required this.fathernameController,
    required this.fathericomefocusnode,
    required this.mothernameController,
    required this.mothericomefocusnode,
    required this.guardianameController,
    required this.guardianicomefocusnode,
    required this.fatherfocusNode,
    required this.motherfocusNode,
    required this.guardianfocusNode,
    required this.fatherincomeController,
    required this.motherincomeController,
    required this.guardiaincomeController,
    this.siblings = const Text(''),
  });

  @override
  State<FamilyCard> createState() => _FamilyCardState();
}

class _FamilyCardState extends State<FamilyCard> {
  String? selectedFoccupation;
  String? selectedFoccupationName;
  String? selectedMoccupation;
  String? selectedMoccupationName;
  String? selectedGoccupation;
  String? selectedGoccupationName;
  bool isFatherAlive = false;
  bool isFatherDisabled = false;
  bool isMotherAlive = false;
  bool isMotherDisabled = false;
  bool isGuardianAlive = false;
  bool isGuardianDisabled = false;

  @override
  void initState() {
    super.initState();

    _loaddata();
    widget.fathernameController.addListener(_updateHiveData);
    widget.fatherincomeController.addListener(_updateHiveData);
    widget.mothernameController.addListener(_updateHiveData);
    widget.motherincomeController.addListener(_updateHiveData);
    widget.guardianameController.addListener(_updateHiveData);
    widget.guardiaincomeController.addListener(_updateHiveData);
  }

  @override
  void dispose() {
    widget.fathernameController.removeListener(_updateHiveData);
    widget.fatherincomeController.removeListener(_updateHiveData);
    widget.mothernameController.removeListener(_updateHiveData);
    widget.motherincomeController.removeListener(_updateHiveData);
    widget.guardianameController.removeListener(_updateHiveData);
    widget.guardiaincomeController.removeListener(_updateHiveData);
    super.dispose();
  }

  void _loaddata() {
    final box = Hive.box<FamilyCardDB>('familyCardbox');
    final List<int> keys = box.keys.cast<int>().toList();

    if (keys.isEmpty) {
      return;
    }

    setState(() {
      final data = box.get(0);

      if (data != null) {
        selectedFoccupationName = data.foccupation;
        isFatherAlive = data.falive;
        isFatherDisabled = data.fdisabled;
        isMotherAlive = data.malive;
        isMotherDisabled = data.mdisabled;
        isGuardianAlive = data.galive;
        isGuardianDisabled = data.gdisabled;
        selectedMoccupationName = data.moccupation;
        selectedGoccupationName = data.goccupation;
        widget.fathernameController.text = data.fname ?? '';
        widget.fatherincomeController.text = data.fincome ?? '';
        widget.mothernameController.text = data.mname ?? '';
        widget.motherincomeController.text = data.mincome ?? '';
        widget.guardianameController.text = data.gname ?? '';
        widget.guardiaincomeController.text = data.gincome ?? '';
      }
    });
  }

  void _updateHiveData() {
    final box = Hive.box<FamilyCardDB>('familyCardbox');
    final existingData = box.get(0) ?? FamilyCardDB();
    box.put(
      0,
      FamilyCardDB(
        fname: widget.fathernameController.text,
        fincome: widget.fatherincomeController.text,
        foccupation: selectedFoccupationName ?? existingData.foccupation,
        falive: isFatherAlive,
        fdisabled: isFatherDisabled,
        malive: isMotherAlive,
        mdisabled: isMotherDisabled,
        galive: isGuardianAlive,
        gdisabled: isGuardianDisabled,
        mname: widget.mothernameController.text,
        mincome: widget.motherincomeController.text,
        moccupation: selectedMoccupationName ?? existingData.moccupation,
        gname: widget.guardianameController.text,
        gincome: widget.guardiaincomeController.text,
        goccupation: selectedGoccupationName ?? existingData.goccupation,
      ),
    );
  }

  void _handleFatherCheckboxChanged(bool alive, bool disabled) {
    setState(() {
      isFatherAlive = alive;
      isFatherDisabled = disabled;
      _updateHiveData();
    });
  }

  void _handleMotherCheckboxChanged(bool alive, bool disabled) {
    setState(() {
      isMotherAlive = alive;
      isMotherDisabled = disabled;
      _updateHiveData();
    });
  }

  void _handleGuardianCheckboxChanged(bool alive, bool disabled) {
    setState(() {
      isGuardianAlive = alive;
      isGuardianDisabled = disabled;
      _updateHiveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 12),
            child: Text('Father', style: kfamiltTitleTextColor),
          ),
          LabelName(
            labelText: 'Name',
            namefocusnode: widget.fatherfocusNode,
            namecontroller: widget.fathernameController,
          ),
          const HeightSpacer(height: 14),
          CheckBoxData1(
            key: ValueKey('FatherCheckBox'),
            initialAlive: isFatherAlive,
            initialDisabled: isFatherDisabled,
            onCheckboxChanged: _handleFatherCheckboxChanged,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Occupation / Job'),
          OccupationBottomSheet(
            onFileSelected: (filePath) {
              setState(() {
                selectedFoccupation = filePath;
                selectedFoccupationName = filePath;
                _updateHiveData();
              });
            },
            initialFilePath: selectedFoccupationName ?? '',
            title: 'Occupation Details',
            hintText: 'Search For Occupation / Job',
          ),
          const HeightSpacer(height: 14),
          LabelNumericalText(
            numericalfocusnode: widget.fathericomefocusnode,
            mytext: 'Monthly Income',
            numController: widget.fatherincomeController,
          ),
          const LineDivider(),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 12),
            child: Text('Mother', style: kfamiltTitleTextColor),
          ),
          LabelName(
            labelText: 'Name',
            namefocusnode: widget.motherfocusNode,
            namecontroller: widget.mothernameController,
          ),
          const HeightSpacer(height: 14),
          CheckBoxData1(
            key: ValueKey('MotherCheckBox'),
            initialAlive: isMotherAlive,
            initialDisabled: isMotherDisabled,
            onCheckboxChanged: _handleMotherCheckboxChanged,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Occupation / Job'),
          const HeightSpacer(height: 14),
          OccupationBottomSheet(
            onFileSelected: (filePath) {
              setState(() {
                selectedMoccupation = filePath;
                selectedMoccupationName = filePath;
                _updateHiveData();
              });
            },
            initialFilePath: selectedMoccupationName ?? '',
            title: 'Occupation Details',
            hintText: 'Search For Occupation / Job',
          ),
          const HeightSpacer(height: 14),
          LabelNumericalText(
            numericalfocusnode: widget.mothericomefocusnode,
            mytext: 'Monthly Income',
            numController: widget.motherincomeController,
          ),
          const LineDivider(),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 12),
            child: Text('Guardian', style: kfamiltTitleTextColor),
          ),
          LabelName(
            namecontroller: widget.guardianameController,
            labelText: 'Name',
            namefocusnode: widget.guardianfocusNode,
          ),
          const HeightSpacer(height: 14),
          CheckBoxData1(
            key: ValueKey('GuardianCheckBox'),
            initialAlive: isGuardianAlive,
            initialDisabled: isGuardianDisabled,
            onCheckboxChanged: _handleGuardianCheckboxChanged,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Occupation / Job'),
          OccupationBottomSheet(
            onFileSelected: (filePath) {
              setState(() {
                selectedGoccupation = filePath;
                selectedGoccupationName = filePath;
                _updateHiveData();
              });
            },
            initialFilePath: selectedGoccupationName ?? '',
            title: 'Occupation Details',
            hintText: 'Search For Occupation / Job',
          ),
          const HeightSpacer(height: 14),
          LabelNumericalText(
            numericalfocusnode: widget.guardianicomefocusnode,
            mytext: 'Monthly Income',
            numController: widget.guardiaincomeController,
          ),
          const LineDivider(),
          widget.siblings,
        ],
      ),
    );
  }
}
