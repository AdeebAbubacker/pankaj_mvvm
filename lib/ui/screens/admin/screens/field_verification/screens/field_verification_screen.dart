import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/house_plotsize_adapter/house_plotsize_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_roof_adapter/house_roof_adapter.dart';
import 'package:panakj_app/core/db/adapters/life_status_adapter/life_status_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_education_adapter/parents_education_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_income/parents_income_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_group_adapter/school_group_adapter.dart';
import 'package:panakj_app/core/db/boxes/house_plot_size.dart';
import 'package:panakj_app/core/db/boxes/house_roof.dart';
import 'package:panakj_app/core/db/boxes/life_status_box.dart';
import 'package:panakj_app/core/db/boxes/parents_education_box.dart';
import 'package:panakj_app/core/db/boxes/parents_income_box.dart';
import 'package:panakj_app/core/db/boxes/school_group_box.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/group_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/table_section.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/widgets/myPadding.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/field_verification/field_verification_bloc.dart';
import 'package:panakj_app/ui/view_model/house_plot_size/house_plot_size_bloc.dart';
import 'package:panakj_app/ui/view_model/house_roof/house_roof_bloc.dart';
import 'package:panakj_app/ui/view_model/life_status/life_status_bloc.dart';
import 'package:panakj_app/ui/view_model/monthly_income/monthly_income_bloc.dart';
import 'package:panakj_app/ui/view_model/parents_education/parents_education_bloc.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';

class FieldVerificationScreen extends StatelessWidget {
  FieldVerificationScreen({super.key});
  //var bankData;
  Map<int?, String?>? bankData;
  Map<int?, String?>? lifeStatusData;
  Map<int?, String?>? parentsEducationData;
  Map<int?, String?>? parentsIncomeData;
  Map<int?, String?>? housePlotsizeData;
  Map<int?, String?>? houseroofData;

  var schools;
  var life;
  var parentseducation;
  var parentsincome;
  var houseplot;
  var houseroof;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<SchoolGroupBloc>(context)
          .add(const SchoolGroupEvent.getschoolgroup());
      BlocProvider.of<LifeStatusBloc>(context)
          .add(const LifeStatusEvent.getlifeStatus());
      BlocProvider.of<ParentsEducationBloc>(context)
          .add(const ParentsEducationEvent.getparentseducation());
      BlocProvider.of<MonthlyIncomeBloc>(context)
          .add(const MonthlyIncomeEvent.getmonthlyincome());
      BlocProvider.of<HousePlotSizeBloc>(context)
          .add(const HousePlotSizeEvent.gethouseplotsize());
      BlocProvider.of<HouseRoofBloc>(context)
          .add(const HouseRoofEvent.gethouseroof());
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
      body: MultiBlocListener(
          listeners: [
            BlocListener<SchoolGroupBloc, SchoolGroupState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        bankData = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        school_group_box =
                            Hive.box<SchoolGroupDB>('school_group_box');
                        bankData!.forEach((id, name) {
                          school_group_box.put(
                            id!,
                            SchoolGroupDB(
                              id: id,
                              name: name as String,
                              courses: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < school_group_box.length; i++) {
                          if (i < school_group_box.length) {
                            schools = school_group_box.getAt(i);
                            print(
                              'school at index $i: id=${schools.id}, course=${schools.courses}, name=${schools.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
            BlocListener<LifeStatusBloc, LifeStatusState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        lifeStatusData = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        lifestatusInfoBox =
                            Hive.box<LifeStatusDB>('lifestatusInfoBox');
                        lifeStatusData!.forEach((id, name) {
                          lifestatusInfoBox.put(
                            id!,
                            LifeStatusDB(
                              id: id,
                              name: name as String,
                              status: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < lifestatusInfoBox.length; i++) {
                          if (i < lifestatusInfoBox.length) {
                            life = lifestatusInfoBox.getAt(i);
                            print(
                              'life at index $i: id=${life.id}, life=${life.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
            BlocListener<ParentsEducationBloc, ParentsEducationState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        parentsEducationData = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        parentsEducationBox =
                            Hive.box<ParentsEducationDB>('parentsEducationBox');
                        parentsEducationData!.forEach((id, name) {
                          parentsEducationBox.put(
                            id!,
                            ParentsEducationDB(
                              id: id,
                              name: name as String,
                              status: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < parentsEducationBox.length; i++) {
                          if (i < parentsEducationBox.length) {
                            life = parentsEducationBox.getAt(i);
                            print(
                              'parents at index $i: id=${life.id}, parent=${life.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
            BlocListener<MonthlyIncomeBloc, MonthlyIncomeState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        parentsincome = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        parentsIncomeBox =
                            Hive.box<ParentsIncomeDB>('parentsIncomeBox');
                        parentsincome!.forEach((id, name) {
                          parentsIncomeBox.put(
                            id!,
                            ParentsIncomeDB(
                              id: id,
                              name: name as String,
                              status: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < parentsIncomeBox.length; i++) {
                          if (i < parentsIncomeBox.length) {
                            schools = parentsIncomeBox.getAt(i);
                            print(
                              'parents income at index $i: id=${schools.id},  name=${schools.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
            BlocListener<HousePlotSizeBloc, HousePlotSizeState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        houseplot = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        houseplotsizeBox =
                            Hive.box<HousePlotSizeDB>('houseplotsizeBox');
                        houseplot!.forEach((id, name) {
                          houseplotsizeBox.put(
                            id!,
                            HousePlotSizeDB(
                              id: id,
                              name: name as String,
                              status: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < houseplotsizeBox.length; i++) {
                          if (i < houseplotsizeBox.length) {
                            houseplot = houseplotsizeBox.getAt(i);
                            print(
                              'houuse size at index $i: id=${houseplot.id},  name=${houseplot.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
            BlocListener<HouseRoofBloc, HouseRoofState>(
              listener: (context, state) {
                if (state.isError) {
                  // Handle error
                } else if (!state.isLoading) {
                  state.successorFailure.fold(
                    () {},
                    (either) => either.fold(
                      (failure) => print('Failure'),
                      (success) {
                        houseroof = Map.from(
                          success!.toList().asMap().map((i, e) => MapEntry(
                                e.id,
                                e.name,
                              )),
                        );
                        houseroofBox = Hive.box<HouseRoofDB>('houseroofBox');
                        houseroof!.forEach((id, name) {
                          houseroofBox.put(
                            id!,
                            HouseRoofDB(
                              id: id,
                              name: name as String,
                              status: 'course',
                            ),
                          );
                        });
                        for (var i = 0; i < houseroofBox.length; i++) {
                          if (i < houseroofBox.length) {
                            houseroof = houseroofBox.getAt(i);
                            print(
                              'houuse roof at index $i: id=${houseroof.id},  name=${houseroof.name},',
                            );
                          }
                        }
                      },
                    ),
                  );
                }
              },
            ),
          ],
          child: SafeArea(
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
          )),
    );
  }
}


//dropdown  in poverty related details