import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/group_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/table_section.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/widgets/myPadding.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/field_verification/field_verification_bloc.dart';

class FieldVerificationScreen extends StatelessWidget {
  FieldVerificationScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
   
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
      body: SafeArea(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<FieldVerificationBloc>().add(
                            const FieldVerificationEvent
                                .postfieldverification());
                      },
                      child: const Text('submit'))
                  // RedSubmitButton(),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


//dropdown  in poverty related details