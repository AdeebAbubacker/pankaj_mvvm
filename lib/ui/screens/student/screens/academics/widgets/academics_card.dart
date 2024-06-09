import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/academics_adapter/academics_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/exam_reg.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/marks_details.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/school_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/qualification_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/course_bottomsheet.dart';

class AcademicsCard extends StatefulWidget {
  final Widget siblings;
  final FocusNode examRegfocusnode;
  final FocusNode sslcfocusnode;
  final FocusNode plusonefocusnode;
  final FocusNode plustwofocusnode;
  final bool mybool;
  TextEditingController examregcontroller;
  TextEditingController sslcmarks;
  TextEditingController plusone_marks;
  TextEditingController plustwo_marks;

  final double? width;
  AcademicsCard({
    super.key,
    this.width,
    required this.examRegfocusnode,
    required this.mybool,
    required this.sslcfocusnode,
    required this.plusonefocusnode,
    required this.plustwofocusnode,
    required this.examregcontroller,
    required this.sslcmarks,
    required this.plusone_marks,
    required this.plustwo_marks,
    this.siblings = const Text(''),
  });

  @override
  State<AcademicsCard> createState() => _AcademicsCardState();
}

class _AcademicsCardState extends State<AcademicsCard> {
  late Box<SchoolDB> schoolBox;
  List<String> schoolNames = [];
  String? selectedSchool;
  String? selectedSchoolName;
  String? selectedPrefStudy;
  String? selectedPrefStudyName;
  @override
  void initState() {
    super.initState();
    setupSchoolBox();
    _loaddata();
    widget.examregcontroller.addListener(_updateHiveData);
    widget.sslcmarks.addListener(_updateHiveData);
    widget.plusone_marks.addListener(_updateHiveData);
    widget.plustwo_marks.addListener(_updateHiveData);
  }

  @override
  void dispose() {
    widget.examregcontroller.removeListener(_updateHiveData);
    widget.sslcmarks.removeListener(_updateHiveData);
    widget.plusone_marks.removeListener(_updateHiveData);
    widget.plustwo_marks.removeListener(_updateHiveData);
    super.dispose();
  }

  void _loaddata() {
    final box = Hive.box<AcademicsDB>('academicBox');
    final List<int> keys = box.keys.cast<int>().toList();

    // Check if there are no achievements in the box
    if (keys.isEmpty) {}

    setState(() {
      final data = box.get(0);

      if (data != null) {
        selectedSchoolName =
            data.schoolName.toString() ?? 'dd'; // Load file path from Hive
        selectedPrefStudyName =
            data.prefForHigher.toString() ?? 'dd'; // Load file path from Hive
        widget.examregcontroller.text = data.regNo.toString();
        widget.sslcmarks.text = data.sslcMark.toString();
        widget.plusone_marks.text = data.plusOneMark.toString();
        widget.plustwo_marks.text = data.plusTwoMark.toString();
      }
    });
  }

  Future<void> setupSchoolBox() async {
    schoolBox = await Hive.openBox<SchoolDB>('schoolBox');

    if (!schoolBox.isOpen) {
      return;
    }

    List<int> keys = schoolBox.keys.cast<int>().toList();

    if (keys.isEmpty) {
      return;
    }

    schoolNames = keys.map((key) {
      SchoolDB school = schoolBox.get(key)!;
      return school.name;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  void _updateHiveData() {
    Hive.box<AcademicsDB>('academicBox').put(
      0,
      AcademicsDB(
        schoolName: selectedSchoolName ?? 'sded',
        regNo: widget.examregcontroller.text ?? '',
        plusOneMark: widget.plusone_marks.text ?? '',
        plusTwoMark: widget.plustwo_marks.text ?? '',
        sslcMark:widget.sslcmarks.text ?? '',
        prefForHigher: selectedPrefStudyName ?? 'sded',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel(mytext: 'School Name'),
          schoolBottomSheet(
              onFileSelected: (filePath) {
                setState(() {
                  selectedSchool = filePath.toString();
                  selectedSchoolName = filePath ?? 'hhhh';
                  _updateHiveData();
                });
              },
              initialFilePath: selectedSchoolName.toString() ??
                  'ssss', // Set the initial file path

              title: 'School Name'),
          const HeightSpacer(),
          ExamReg(
              examRegfocusnode: widget.examRegfocusnode,
              examregcontroller: widget.examregcontroller),
          const HeightSpacer(),
          Marksdetails(
            title: 'SSLC Marks',
            marksfocusnode: widget.sslcfocusnode,
            marks: widget.sslcmarks,
          ),
          const HeightSpacer(),
          Marksdetails(
            title: 'Plus One Marks',
            marksfocusnode: widget.plusonefocusnode,
            marks: widget.plusone_marks,
          ),
          const HeightSpacer(),
          Marksdetails(
            title: 'Plus Two Marks',
            marksfocusnode: widget.plustwofocusnode,
            marks: widget.plustwo_marks,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Preference for Higher Studies'),
          CoursebottomSheet(
            onFileSelected: (filePath) {
              setState(() {
                selectedPrefStudy = filePath.toString();
                selectedPrefStudyName = filePath ?? 'hhhh';
                _updateHiveData();
              });
            },
            initialFilePath: selectedPrefStudyName.toString() ??
                'ssss', // Set the initial file path

            title: 'Course of Study',
          ),
        ],
      ),
    );
  }
}
