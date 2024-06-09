// -------------------- 1st Card ------------------------------------------

// ignore: must_be_immutable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/ui/screens/student/widgets/do_you_have_bankaccount.dart';
import 'package:panakj_app/ui/screens/student/widgets/enterDOB.dart';
import 'package:panakj_app/ui/screens/student/widgets/horizontal_radiobtn.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_email.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:file_picker/file_picker.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:path/path.dart';

class PersonalDetailsCard extends StatefulWidget {
  final bool mybool;
  final TextEditingController nameController;
  final FocusNode infonamefocusNode;
  final FocusNode addressfocusNode;
  final FocusNode numericalfocusnode;
  final FocusNode emailfocusnode;
  final TextEditingController addressController;
  final TextEditingController phoneNoController;
  final TextEditingController emailController;
  

  PersonalDetailsCard({
    super.key,
    required this.mybool,
    required this.numericalfocusnode,
    required this.nameController,
    required this.infonamefocusNode,
    required this.addressfocusNode,
    required this.emailfocusnode,
    required this.addressController,
    required this.phoneNoController,
    required this.emailController,

  });

  @override
  State<PersonalDetailsCard> createState() => _PersonalDetailsCardState();
}

class _PersonalDetailsCardState extends State<PersonalDetailsCard> {
  String? fileName = '';
  String? filePath = '';
  bool myVisibility = false;
  late int selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = 1; // Default value
    _loadData();
    widget.nameController.addListener(_updateHiveData);
    widget.emailController.addListener(_updateHiveData);
    widget.phoneNoController.addListener(_updateHiveData);
    widget.addressController.addListener(_updateHiveData);
  }

  @override
  void dispose() {
    widget.nameController.removeListener(_updateHiveData);
    widget.emailController.removeListener(_updateHiveData);
    widget.phoneNoController.removeListener(_updateHiveData);
    widget.addressController.removeListener(_updateHiveData);
    super.dispose();
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path!;
        fileName = basename(filePath!);
        print("Selected file: $fileName");
        _visible();
      });
    }
  }

  void _visible() {
    setState(() {
      myVisibility = fileName != '';
    });
  }

  void _deleteFile() {
    setState(() {
      filePath = '';
      fileName = '';
      _visible();
    });
  }

  void _loadData() async {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final data = box.get(0);

    if (data != null) {
      setState(() {
        widget.nameController.text = data.name.toString();
        widget.emailController.text = data.email.toString();
        widget.phoneNoController.text = data.mobno.toString();
        widget.addressController.text = data.AccNumber.toString();
        selectedGender = data.gender;
      });
    }
  }

  void _updateHiveData() {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final existingData = box.get(0) ?? personalInfoDB();

    box.put(
      0,
      personalInfoDB(
        name: widget.nameController.text,
        dob: existingData.dob,
        address: widget.addressController.text,
        gender: selectedGender,
        mobno: widget.phoneNoController.text,
        email: widget.emailController.text,
        doyouHaveBankAcc: existingData.doyouHaveBankAcc,
        nameasPerBank: existingData.nameasPerBank,
        AccNumber: existingData.AccNumber,
        bankName: existingData.bankName,
        BranchIFSC: existingData.BranchIFSC,
      ),
    );
  }

  void _onGenderChanged(int value) {
    setState(() {
      selectedGender = value;
    });
    _updateHiveData();
  }
 void _onDateSelected(DateTime selectedDate) {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final existingData = box.get(0) ?? personalInfoDB();

    box.put(
      0,
      personalInfoDB(
        name: existingData.name,
        dob: selectedDate,
        address: existingData.address,
        gender: existingData.gender,
        mobno: existingData.mobno,
        email: existingData.email,
        doyouHaveBankAcc: existingData.doyouHaveBankAcc,
        nameasPerBank: existingData.nameasPerBank,
        AccNumber: existingData.AccNumber,
        bankName: existingData.bankName,
        BranchIFSC: existingData.BranchIFSC,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HorizontalRadioBtnBloc(selectedGender),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelInputText(
              label: 'Name',
              StringInput: widget.nameController,
              focusNode: widget.infonamefocusNode,
            ),
            const HeightSpacer(height: 14),
            HorizontalRadioBtn(
              steps: [
                Content(choiceLabel: 'Male'),
                Content(choiceLabel: 'Female'),
              ],
              title: 'Gender',
              onChanged: _onGenderChanged,
            ),
          const HeightSpacer(height: 14),
            DOBPicker(onDateSelected: _onDateSelected),
          const HeightSpacer(height: 14),
          LabelNumericalText(
              numericalfocusnode: widget.numericalfocusnode,
              mytext: 'Phone no',
              numController: widget.phoneNoController),
          const HeightSpacer(height: 14),
          LabelEmail(
            labelText: 'email',
            emailController: widget.emailController,
            emailfocusnode: widget.emailfocusnode,
          ),
          const HeightSpacer(height: 14),
          Container(
            width: 333,
            height: 90,
            color: const Color.fromARGB(115, 239, 239, 239),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(31, 79, 79, 79)),
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
                  ),
                  child: myVisibility
                      ? Image.file(
                          File(filePath!),
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.person_2_outlined,
                          color: Colors.black12,
                          size: 70,
                        ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                        'Please upload square image, size less than 100KB',
                        style: TextStyle(fontSize: 8)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: _openFilePicker,
                            child: const Text('Choose File')),
                        const SizedBox(width: 30),
                        // const Text(
                        //   'No file choosen',
                        //   style: TextStyle(fontSize: 8, color: Colors.grey),
                        // )
                        filePath!.isEmpty
                            ? const Text(
                                'No file choosen',
                                style:
                                    TextStyle(fontSize: 8, color: Colors.grey),
                              )
                            : IconButton(
                                onPressed: _deleteFile,
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 253, 53, 39),
                                ),
                              )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const HeightSpacer(height: 14),
          LabelInputText(
            label: 'Address',
            maxlines: 3,
            StringInput: widget.addressController,
            focusNode: widget.addressfocusNode,
          ),
          const DoYouHaveBankAcc(),
        ],
      ),
    ),
  );
  }
}
