import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_group_adapter/school_group_adapter.dart';
import 'package:panakj_app/core/db/boxes/bank_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/core/db/boxes/school_group_box.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/group_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/submit_button.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/table_section.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/widgets/myPadding.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';

class FieldVerificationScreen extends StatelessWidget {
  FieldVerificationScreen({super.key});
  //var bankData;
  Map<int?, String?>? bankData;
  var schools;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<SchoolGroupBloc>(context)
          .add(const SchoolGroupEvent.getschoolgroup());
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
          elevation: 4,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(
                255,
                75,
                75,
                74,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Pankaj Trust',
            style: GoogleFonts.mPlus1p(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: BlocConsumer<SchoolGroupBloc, SchoolGroupState>(
        listener: (context, state) {
          if (state.isError) {}
          if (state.isLoading) {
          } else {
            state.successorFailure.fold(
              () => () {},
              (either) => either.fold(
                  (failure) => {print('Failure')},
                  (success) => {
                        bankData = Map.from(
                            success!.toList().asMap().map((i, e) => MapEntry(
                                  e.id,
                                  e.name,
                                ))),
                        school_group_box =
                            Hive.box<SchoolGroupDB>('school_group_box'),
                        bankData!.forEach((id, name) {
                          school_group_box.put(
                            id!,
                            SchoolGroupDB(
                              id: id,
                              name: name as String,
                              courses:
                                  'course', // You might want to replace this with the actual courses
                            ),
                          );
                        }),
                        for (var i = 0; i < school_group_box.length; i++)
                          {
                            if (i < school_group_box.length)
                              {
                                schools = school_group_box.getAt(i),
                                print(
                                  'school at index $i: id=${schools.id}, course=${schools.courses}, name=${schools.name},',
                                )
                              }
                          }
                      }),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'FieldVerification',
                      style: recepeintdashcontent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 390,
                      height: 355,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Applicants Details',
                              style: kCardFilterTextStyle,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 389,
                            color: khorizontlinecolor,
                          ),
                          MyPadding(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeightSpacer(),
                                LabelNumericalText(
                                    numericalfocusnode: FocusNode(),
                                    mytext: 'Application no',
                                    numController: TextEditingController()),
                                const HeightSpacer(),
                                LabelNumericalText(
                                    numericalfocusnode: FocusNode(),
                                    mytext: 'Hall Ticket no',
                                    numController: TextEditingController()),
                                const HeightSpacer(),
                                InputLabel(mytext: 'School group'),
                                SchoolGroupBottomSheet(
                                  title: 'school group ',
                                )
                                // LabelInputText(
                                //     label: 'Group',
                                //     focusNode: FocusNode(),
                                //     StringInput: TextEditingController()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 390,
                      height: 1735,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Poverty Related Details',
                              style: kCardFilterTextStyle,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 382,
                            color: khorizontlinecolor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeightSpacer(),
                              const ParentsTable(),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/house.png',
                                  width: 170,
                                ),
                              ),
                              const ResidentialTable(),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/siblings.png',
                                  width: 170,
                                ),
                              ),
                              const SiblingsTable(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/educational.jpg',
                                  width: 170,
                                ),
                              ),
                              const EducationalTable(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RedSubmitButton(),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


//dropdown  in poverty related details