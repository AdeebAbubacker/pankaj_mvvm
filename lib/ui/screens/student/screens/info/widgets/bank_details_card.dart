import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/info/widgets/bank_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:hive/hive.dart';

class BankCard extends StatefulWidget {
  final bool mybool;

  final FocusNode banknamefocusnode;
  final FocusNode accnofocusnode;
  final FocusNode bankifscfocusnode;
  final TextEditingController nameController;
  final TextEditingController accNoController;
  final TextEditingController ifscController;

  BankCard({
    super.key,
    required this.mybool,
    required this.banknamefocusnode,
    required this.accnofocusnode,
    required this.bankifscfocusnode,
    required this.nameController,
    required this.accNoController,
    required this.ifscController,
  });

  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  late Box<BankDB> bankBox;
  List<String> bankNames = [];
  String? selectedBank;
  String? selectedBankName;

  @override
  void initState() {
    super.initState();
    setupBankBox();
    _loaddata();
    widget.nameController.addListener(_updateHiveData);
    widget.accNoController.addListener(_updateHiveData);
    widget.ifscController.addListener(_updateHiveData);
  }

  @override
  void dispose() {
    widget.nameController.removeListener(_updateHiveData);
    widget.accNoController.removeListener(_updateHiveData);
    widget.ifscController.removeListener(_updateHiveData);
    widget.banknamefocusnode.dispose();
    widget.accnofocusnode.dispose();
    widget.bankifscfocusnode.dispose();
    super.dispose();
  }

  void _loaddata() async {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final data = box.get(0);

    if (data != null) {
      setState(() {
        selectedBankName = data.bankName.toString();
        widget.nameController.text = data.nameasPerBank.toString();
        widget.accNoController.text = data.AccNumber.toString();
        widget.ifscController.text = data.BranchIFSC.toString();
    
      });
    }
  }

  void _updateHiveData() {
    final box = Hive.box<personalInfoDB>('personalInfoBox');
    final existingData = box.get(0) ?? personalInfoDB();

    box.put(
      0,
      personalInfoDB(
        name: existingData.name,
        gender: existingData.gender,
        dob: existingData.dob,
        address: existingData.address,
        mobno: existingData.mobno,
        email: existingData.email,
        doyouHaveBankAcc: widget.mybool,
        nameasPerBank: widget.nameController.text,
        AccNumber: widget.accNoController.text,
        bankName: selectedBankName ?? existingData.bankName,
        BranchIFSC: widget.ifscController.text,
      ),
    );
  }

  Future<void> setupBankBox() async {
    bankBox = await Hive.openBox<BankDB>('bankBox');

    if (!bankBox.isOpen) {
      return;
    }

    List<int> keys = bankBox.keys.cast<int>().toList();

    if (keys.isNotEmpty) {
      bankNames = keys.map((key) {
        BankDB bank = bankBox.get(key)!;
        return bank.name;
      }).toList();

      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelInputText(
            focusNode: widget.banknamefocusnode,
            label: 'Full name (As per bank record)',
            StringInput: widget.nameController,
          ),
          const HeightSpacer(height: 14),
          LabelInputText(
            focusNode: widget.accnofocusnode,
            label: 'Account Number',
            StringInput: widget.accNoController,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Bank Name'),
          BankBottomSheet(
            onFileSelected: (filePath) {
              setState(() {
                selectedBank = filePath.toString();
                selectedBankName = filePath;
                _updateHiveData();
              });
            },
            initialFilePath: selectedBankName ?? '',
            title: 'Select Bank',
            hintText: '',
          ),
          const HeightSpacer(height: 14),
          LabelInputText(
            focusNode: widget.bankifscfocusnode,
            label: 'Branch IFSC',
            StringInput: widget.ifscController,
          ),
          const HeightSpacer(height: 14),
        ],
      ),
    );
  }
}
