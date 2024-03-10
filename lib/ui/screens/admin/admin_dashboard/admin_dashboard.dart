import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/college_adapter/college_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_plaster_adapter/house_plaster_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_plotsize_adapter/house_plotsize_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_roof_adapter/house_roof_adapter.dart';
import 'package:panakj_app/core/db/adapters/life_status_adapter/life_status_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_education_adapter/parents_education_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_income/parents_income_adapter.dart';
import 'package:panakj_app/core/db/adapters/rental_house_adapter/rental_house_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_group_adapter/school_group_adapter.dart';
import 'package:panakj_app/core/db/adapters/water_source_adapter/water_source_adapter.dart';
import 'package:panakj_app/core/db/boxes/college_box.dart';
import 'package:panakj_app/core/db/boxes/house_plaster.dart';
import 'package:panakj_app/core/db/boxes/house_plot_size.dart';
import 'package:panakj_app/core/db/boxes/house_roof.dart';
import 'package:panakj_app/core/db/boxes/life_status_box.dart';
import 'package:panakj_app/core/db/boxes/parents_education_box.dart';
import 'package:panakj_app/core/db/boxes/parents_income_box.dart';
import 'package:panakj_app/core/db/boxes/rental_house_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/core/db/boxes/school_group_box.dart';
import 'package:panakj_app/core/db/boxes/water_source_box.dart';
import 'package:panakj_app/ui/screens/admin/screens/application_screen/application_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/college_screen/college_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/screens/field_verification_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/form_screen/form_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/graph_screen/graph_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/reciptent_screen/reciptent_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/school_screen/school_screen.dart';
import 'package:panakj_app/ui/screens/admin/screens/top_grade_screen/topgrade_screen.dart';
import 'package:panakj_app/ui/screens/auth/login_screen.dart';
import 'package:panakj_app/ui/view_model/get_rental_house/get_rental_house_bloc.dart';
import 'package:panakj_app/ui/view_model/get_water_source/get_water_source_bloc.dart';
import 'package:panakj_app/ui/view_model/getcolleges/getcolleges_bloc.dart';
import 'package:panakj_app/ui/view_model/getschool/getschool_bloc.dart';
import 'package:panakj_app/ui/view_model/house_plastering/house_plastering_bloc.dart';
import 'package:panakj_app/ui/view_model/house_plot_size/house_plot_size_bloc.dart';
import 'package:panakj_app/ui/view_model/house_roof/house_roof_bloc.dart';
import 'package:panakj_app/ui/view_model/life_status/life_status_bloc.dart';
import 'package:panakj_app/ui/view_model/monthly_income/monthly_income_bloc.dart';
import 'package:panakj_app/ui/view_model/parents_education/parents_education_bloc.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Map<int?, String?>? schoolData;
  Map<int?, String?>? collegeData;
  Map<int?, String?>? bankData;
  Map<int?, String?>? lifeStatusData;
  Map<int?, String?>? parentsEducationData;
  Map<int?, String?>? parentsIncomeData;
  Map<int?, String?>? housePlotsizeData;
  Map<int?, String?>? houseroofData;
  Map<int?, String?>? watersourceData;
  Map<int?, String?>? rentalhouseData;
  var schoolslist;
  var colleges;
  var schools;
  var life;
  var parentseducation;
  var parentsincome;
  var houseplot;
  var houseroof;
  var houseplaster;
  var watersource;
  var rentalhouse;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetcollegesBloc>(context)
          .add(const GetcollegesEvent.getcolllges());
      BlocProvider.of<GetschoolBloc>(context)
          .add(const GetschoolEvent.getschool());
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
      BlocProvider.of<HousePlasteringBloc>(context)
          .add(const HousePlasteringEvent.gethouseplastering());
      BlocProvider.of<GetWaterSourceBloc>(context)
          .add(const GetWaterSourceEvent.getWaterSource());
      BlocProvider.of<GetRentalHouseBloc>(context)
          .add(const GetRentalHouseEvent.gethouseRental());
    });

    final amindashBoardContents = [
      Icon(
        Icons.grade,
        size: iconsize,
        color: const Color(0xFFF59E0B),
      ),
      Icon(
        EvaIcons.award,
        size: iconsize,
        color: const Color(0xFF2E7D32),
      ),
      Icon(
        Icons.supervised_user_circle_sharp,
        size: iconsize,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      Icon(
        Icons.receipt_long_rounded,
        size: iconsize,
        color: const Color(0xFF673AB7),
      ),
      Icon(
        Icons.school,
        size: iconsize,
        color: const Color(0xFFF4511E),
      ),
      Icon(
        Icons.school_outlined,
        size: iconsize,
        color: const Color.fromARGB(255, 229, 94, 168),
      ),
      Icon(
        Icons.mail,
        size: iconsize,
        color: const Color.fromARGB(255, 86, 63, 219),
      ),
      Icon(
        EvaIcons.activityOutline,
        size: iconsize,
        color: const Color(0xFF00BCD4),
      ),
    ];

    final titlelist = [
      "Top Grade",
      "Field Verification",
      "Applicants",
      "Reciptent",
      "Schools",
      "Colleges",
      "Forms and Letter",
      "Analytics",
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 219, 219, 220),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.admin_panel_settings_sharp),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFf4f4f4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
          elevation: 8,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
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
          child: MultiBlocListener(
            listeners: [
              BlocListener<GetcollegesBloc, GetcollegesState>(
                listener: (context, state) {
                  if (state.isError) {}
                  if (state.isLoading) {
                  } else {
                    state.successorFailure.fold(
                      () => () {},
                      (either) => either.fold(
                          (failure) => {print('Failure')},
                          (success) => {
                                collegeData = Map.fromIterables(
                                    success!.toList().map((e) => e.id),
                                    success!.toList().map((e) => e.name)),
                                collegeBox = Hive.box<CollegeDB>('collegeBox'),
                                collegeData!.forEach((id, name) {
                                  collegeBox.put(
                                      id as int,
                                      CollegeDB(
                                        id: id,
                                        name: name as String,
                                      ));
                                }),
                                for (var i = 0; i < collegeBox.length; i++)
                                  {
                                    if (i < collegeBox.length)
                                      {
                                        colleges = collegeBox.getAt(i),
                                        print(
                                            'College at index $i: id=${colleges.id}, name=${colleges.name}')
                                      }
                                  }
                              }),
                    );
                  }
                },
              ),
              BlocListener<GetschoolBloc, GetschoolState>(
                listener: (context, state) {
                  if (state.isError) {}
                  if (state.isLoading) {
                  } else {
                    state.successorFailure.fold(
                      () => () {},
                      (either) => either.fold(
                          (failure) => {print('Failure')},
                          (success) => {
                                schoolData = Map.fromIterables(
                                    success!.toList().map((e) => e.id),
                                    success!.toList().map((e) => e.name)),
                                schoolBox = Hive.box<SchoolDB>('schoolBox'),
                                schoolData!.forEach((id, name) {
                                  schoolBox.put(
                                      id as int,
                                      SchoolDB(
                                        id: id,
                                        name: name as String,
                                      ));
                                }),
                                for (var i = 0; i < schoolBox.length; i++)
                                  {
                                    if (i < schoolBox.length)
                                      {
                                        schoolslist = schoolBox.getAt(i),
                                        print(
                                            'school at index $i: id=${schoolslist.id}, name=${schoolslist.name}')
                                      }
                                  }
                              }),
                    );
                  }
                },
              ),
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
                                'schoolgroup at index $i: id=${schools.id}, grouup=${schools.courses}, name=${schools.name},',
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
                                'life status  at index $i: id=${life.id}, life=${life.name},',
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
                          parentsEducationBox = Hive.box<ParentsEducationDB>(
                              'parentsEducationBox');
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
                                'parents education at index $i: id=${life.id}, parent=${life.name},',
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
              BlocListener<HousePlasteringBloc, HousePlasteringState>(
                listener: (context, state) {
                  if (state.isError) {
                    // Handle error
                  } else if (!state.isLoading) {
                    state.successorFailure.fold(
                      () {},
                      (either) => either.fold(
                        (failure) => print('Failure'),
                        (success) {
                          houseplaster = Map.from(
                            success!.toList().asMap().map((i, e) => MapEntry(
                                  e.id,
                                  e.name,
                                )),
                          );
                          houseplasterBox =
                              Hive.box<HousePlasterDB>('houseplasterBox');
                          houseplaster!.forEach((id, name) {
                            houseplasterBox.put(
                              id!,
                              HousePlasterDB(
                                id: id,
                                name: name as String,
                                status: 'course',
                              ),
                            );
                          });
                          for (var i = 0; i < houseplasterBox.length; i++) {
                            if (i < houseplasterBox.length) {
                              houseplaster = houseplasterBox.getAt(i);
                              print(
                                'houuse plaster at index $i: id=${houseplaster.id},  name=${houseplaster.name},',
                              );
                            }
                          }
                        },
                      ),
                    );
                  }
                },
              ),
              BlocListener<GetWaterSourceBloc, GetWaterSourceState>(
                listener: (context, state) {
                  if (state.isError) {}
                  if (state.isLoading) {
                  } else {
                    state.successorFailure.fold(
                      () => () {},
                      (either) => either.fold(
                          (failure) => {print('Failure')},
                          (success) => {
                                watersourceData = Map.fromIterables(
                                    success!.toList().map((e) => e.id),
                                    success!.toList().map((e) => e.name)),
                                waterSourceBox =
                                    Hive.box<WaterSourceDB>('waterSourceBox'),
                                watersourceData!.forEach((id, name) {
                                  waterSourceBox.put(
                                      id as int,
                                      WaterSourceDB(
                                        id: id,
                                        name: name as String,
                                        status: '',
                                      ));
                                }),
                                for (var i = 0; i < waterSourceBox.length; i++)
                                  {
                                    if (i < waterSourceBox.length)
                                      {
                                        watersource = waterSourceBox.getAt(i),
                                        print(
                                            'water source at index $i: id=${watersource.id}, name=${watersource.name}')
                                      }
                                  }
                              }),
                    );
                  }
                },
              ),
              BlocListener<GetRentalHouseBloc, GetRentalHouseState>(
                listener: (context, state) {
                  if (state.isError) {}
                  if (state.isLoading) {
                  } else {
                    state.successorFailure.fold(
                      () => () {},
                      (either) => either.fold(
                          (failure) => {print('Failure')},
                          (success) => {
                                rentalhouseData = Map.fromIterables(
                                    success!.toList().map((e) => e.id),
                                    success!.toList().map((e) => e.name)),
                                rentalHouseBox =
                                    Hive.box<RentalHouseDB>('rentalHouseBox'),
                                rentalhouseData!.forEach((id, name) {
                                  rentalHouseBox.put(
                                      id as int,
                                      RentalHouseDB(
                                        id: id,
                                        name: name as String,
                                        status: '',
                                      ));
                                }),
                                for (var i = 0; i < rentalHouseBox.length; i++)
                                  {
                                    if (i < rentalHouseBox.length)
                                      {
                                        rentalhouse = rentalHouseBox.getAt(i),
                                        print(
                                            'Renatl house at index $i: id=${rentalhouse.id}, name=${rentalhouse.name}')
                                      }
                                  }
                              }),
                    );
                  }
                },
              ),
            ],
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 370,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 127, 227),
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text(
                          'Welcome back to,',
                          style: GoogleFonts.concertOne(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Pankaj Charitable Trust',
                          style: GoogleFonts.concertOne(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 300,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: 'Search here',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: amindashBoardContents.length,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        navigateToScreen(context, index);
                      },
                      child: AdminDashContainer(
                        myIcons: amindashBoardContents[index],
                        title: titlelist[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          switch (index) {
            case 0:
              return const TopGradeScreeen();
            case 1:
              return FieldVerificationScreen();
            case 2:
              return ApplicantScreen();
            case 3:
              return ReciepentSCreen();
            case 4:
              return SchoolScreen();
            case 5:
              return CollegeScreen();
            case 6:
              return const FormScreen();
            case 7:
              return const GraphScreen();
            default:
              return Container();
          }
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var opacityAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class AdminDashContainer extends StatelessWidget {
  AdminDashContainer({
    super.key,
    required this.myIcons,
    required this.title,
  });

  Icon myIcons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
          color: kwhitecolor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(221, 227, 225, 225),
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: myIcons,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                title,
                style: admincontent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
