import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/db/adapters/cache_screen1_adapter/cache_screen1_adap.dart';
import 'package:panakj_app/core/db/adapters/cache_screen4_adapter/cache_screen4_adap.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';
import 'package:panakj_app/core/db/adapters/validation_academics/validation_academicadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_familyscreen/validation_familyscreenadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_personalinfo/validation_personalinfoadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_residential/validation_residentialadapter.dart';
import 'package:panakj_app/core/db/boxes/cache_screen1_box.dart';
import 'package:panakj_app/core/db/boxes/cache_screen4_box.dart';
import 'package:panakj_app/core/db/boxes/personal_info_box.dart';
import 'package:panakj_app/core/db/boxes/validation_academicBox.dart';
import 'package:panakj_app/core/db/boxes/validation_familyBox.dart';
import 'package:panakj_app/core/db/boxes/validation_personalinfoBox.dart';
import 'package:panakj_app/core/db/boxes/family_status_box.dart';
import 'package:panakj_app/core/db/boxes/validation_residentialBox.dart';
import 'package:panakj_app/core/model/achievments_data/achievments_data.dart';
import 'package:panakj_app/core/model/sibling_data/sibling_data.dart';
import 'package:panakj_app/core/repository/achievmentscard_repo.dart';
import 'package:panakj_app/core/repository/siblingcard_repo.dart';
import 'package:panakj_app/package/presentation/custom_stepper.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/academics_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/achievments_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/family/screens/family_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/home/screens/home_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/students_home_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/info/screens/info_layout.dart';
import 'package:panakj_app/ui/screens/student/widgets/bottom_card.dart';
import 'package:panakj_app/ui/screens/student/widgets/next_and_previous_button.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_app/ui/view_model/acadmicdetails/academic_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxfirst/checkboxfirst_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxsec/checkboxsec_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxthird/checkboxthird_bloc.dart';
import 'package:panakj_app/ui/view_model/family/family_bloc.dart';
import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/post_residentail_data/post_residentail_data_bloc.dart';
import 'package:panakj_app/ui/view_model/question1_res/question1_res_bloc.dart';
import 'package:panakj_app/ui/view_model/question2_res/question2_res_bloc.dart';
import 'package:panakj_app/ui/view_model/question3_res/question3_res_bloc.dart';
import 'package:panakj_app/ui/view_model/selctedbank/selctedbank_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_course/selected_course_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_occupation/selected_occupation_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_school/selected_school_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/navigation_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class StudentsApplicationForm extends StatefulWidget {
  const StudentsApplicationForm({super.key});

  @override
  State<StudentsApplicationForm> createState() =>
      _StudentsApplicationFormState();
}

class _StudentsApplicationFormState extends State<StudentsApplicationForm> {
  late Timer timer;
  @override
  void initState() {
    super.initState();

    personalInfo();

    validationOfScreens();
    // Attach listener to each controller

    nameController.addListener(_saveDataToCacheScreen1);
    addressController.addListener(_saveDataToCacheScreen1);
    emailController.addListener(_saveDataToCacheScreen1);
    phoneNoController.addListener(_saveDataToCacheScreen1);
    nameatBankController.addListener(_saveDataToCacheScreen1);
    accNoController.addListener(_saveDataToCacheScreen1);
    ifscController.addListener(_saveDataToCacheScreen1);
    landcontroller.addListener(_saveDataToCacheScreen4);
    // Load existing data from Hive into controllers
    _loadDataFromHive();
    _loadDataFromHiveres();
    timer = Timer.periodic(Duration(seconds: 3), _printHiveValuesresidentail);
    timer = Timer.periodic(
        Duration(seconds: 3), _printHiveValuesvalidationresidentail);
//     // Start periodic timer
//     timer = Timer.periodic(Duration(seconds: 3), _printHiveValues);
  }

  @override
  void personalInfo() async {
    personalInfoBox = await Hive.openBox<personalInfoDB>('personalInfoBox');
    setState(() {});
  }

  //cache screen1 - personal info
  void _saveDataToCacheScreen1() async {
    final personalInfo = cacheScreen1DB(
        id: 1,
        name1: nameController.text,
        name2: addressController.text,
        name3: emailController.text,
        name4: phoneNoController.text,
        name5: nameatBankController.text,
        name6: accNoController.text,
        name7: ifscController.text,
        bankaccstatus:
            context.read<StudentsAppFormBloc>().state.forBankAccountholder,
        gender: context.read<HorizontalRadioBtnBloc>().state.groupValue);

    await cachescreen1box.put(1, personalInfo);
  }

  void _saveDataToCacheScreen4() async {
    final question1ResState = context.read<Question1ResBloc>().state;
    final question2ResState = context.read<Question2ResBloc>().state;
    final question3ResState = context.read<Question3ResBloc>().state;
    final residentialdetails = cacheScreen4DB(
      ownhouse: question1ResState.ownHouse,
      rentalhouse: question1ResState.rentalHouse,
      sheet: question2ResState.sheet,
      concrete: question2ResState.concrete,
      tilled: question2ResState.Tilled,
      pipewater: question3ResState.pipewater,
      wellwater: question3ResState.wellwater,
      othersource: question3ResState.othersource,
      land: landcontroller.text,
    );
    print(
        'Question1ResBloc ownhouse: ${context.read<Question1ResBloc>().state.ownHouse}');
    print(
        'Question1ResBloc rental: ${context.read<Question1ResBloc>().state.rentalHouse}');
    await cachescreen4box.put(1, residentialdetails);
  }

  void _printHiveValues(Timer timer) {
    // Print Hive values every 3 seconds
    final personalInfo = cachescreen1box.get(1);

    if (personalInfo != null) {
      print(
          'Hive Values name: ${personalInfo.name1},Hive Values addressController: ${personalInfo.name2},Hive Values emailController: ${personalInfo.name3},Hive Values phoneNoController: ${personalInfo.name4},Hive Values nameatBankController: ${personalInfo.name5},Hive Values accNoController: ${personalInfo.name6},Hive Values ifsc: ${personalInfo.name7},Hive Values gender: ${personalInfo.gender},');
    } else {
      //   print('Hive Values: null');
    }
  }

  void _printHiveValuesvalidationresidentail(Timer timer) {
    // Print Hive values every 3 seconds
    final validationData = validationResidentailBox.get('key');
    final validationData2 = validationAcademicBox.get('key');

    if (validationData != null) {
      print(
          'Hive Values name validation residential: ${validationData.status},');
      print(
          'Hive Values name validation residential: ${validationData.status},');
    } else {
      //  print('Hive Values: null');
    }
  }

  void _printHiveValuesresidentail(Timer timer) {
    // Print Hive values every 3 seconds
    final residentialdetails = cachescreen4box.get(1);
    final validationresidentails = validationResidentailBox.get('key')?.status;
    final validationacademic = validationAcademicBox.get('key')?.status;
    final validationfamily = validationFamilyBox.get('key')?.status;
    final validationPersonalInfoBox = validationAcademicBox.get('key')?.status;

    if (residentialdetails != null) {
      print('Hive Values name residentail land: ${residentialdetails.land},');
      print(
          'Hive Values name residential ownhouse: ${residentialdetails.ownhouse},');
      print(
          'Hive Values name validation residentail: ${validationresidentails},');
      print('Hive Values name validation academics: ${validationacademic},');
      print(
          'Hive Values name validation validationfamily: ${validationfamily},');
      print(
          'Hive Values name validation validationPersonalInfoBox: ${validationPersonalInfoBox},');
    } else {
      //  print('Hive Values null aaanu: null');
    }
  }

  void _loadDataFromHive() {
    final personalInfo = cachescreen1box.get(1);
    setState(() {
      if (personalInfo != null) {
        nameController.text = personalInfo.name1;
        addressController.text = personalInfo.name2;
        emailController.text = personalInfo.name3;
        phoneNoController.text = personalInfo.name4;
        nameatBankController.text = personalInfo.name5;
        accNoController.text = personalInfo.name6;
        ifscController.text = personalInfo.name7;
      }
    });
  }

  void _loadDataFromHiveres() {
    final residen = cachescreen4box.get(1);
    setState(() {
      if (residen != null) {
        landcontroller.text = residen.land;
      }
    });
  }

  void validationOfScreens() async {
    validationPersonalInfoBox =
        await Hive.openBox<ValidationPersonalInfoScreenDB>(
            'validationPersonalInfoBox');
    validationFamilyBox =
        await Hive.openBox<ValidationFamilyScreenDB>('validationFamilyBox');
    validationAcademicBox =
        await Hive.openBox<ValidationAcademicScreenDB>('validationAcademicBox');
    validationResidentailBox =
        await Hive.openBox<ValidationResidentailScreenDB>(
            'validationResidentailBox');
    cachescreen1box = Hive.box<cacheScreen1DB>('cachescreen1box');

    setState(() {});
  }

  ScrollController scrollController = ScrollController();

  // 1st Section
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController nameatBankController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  //2nd Section
  TextEditingController fathernameController = TextEditingController();
  TextEditingController fatherincomeController = TextEditingController();
  TextEditingController mothernameController = TextEditingController();
  TextEditingController motherincomeController = TextEditingController();
  TextEditingController guardianameController = TextEditingController();
  TextEditingController guardiaincomeController = TextEditingController();
  TextEditingController siblingnameController1 = TextEditingController();
  TextEditingController siblingnameController2 = TextEditingController();
  TextEditingController siblingnameController3 = TextEditingController();
  TextEditingController siblingnameController4 = TextEditingController();
  TextEditingController siblingnameController5 = TextEditingController();

  //3rd Section
  TextEditingController examregcontroller = TextEditingController();
  TextEditingController sslcmarksController = TextEditingController();
  TextEditingController plusoneMarksController = TextEditingController();
  TextEditingController plustwoMarksController = TextEditingController();

  // 4th section
  TextEditingController landcontroller = TextEditingController();

  Future getSiblingsDataForApi() async {
    // Open your Hive box
    var box = await Hive.openBox<SiblingCardDB>('sibling_cards');

    // Retrieve siblings data from Hive
    List<SiblingCardDB> siblingsList = box.values.toList();

    // Map Hive objects to JSON format
    List<Map<String, dynamic>> siblingsJsonList = siblingsList.map((sibling) {
      return {
        'name': sibling.name,
        'gender': sibling.gender,
        'qualification': sibling.qualification,
        'course': sibling.courseofstudy,
        'occupation': sibling.occupation,
      };
    }).toList();

    // // Close the Hive box
    // await box.close();

    // Return data in the required format
    return siblingsJsonList;
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focuscontroller1 = FocusNode();
    FocusNode focuscontroller2 = FocusNode();
    FocusNode focuscontroller3 = FocusNode();
    FocusNode focuscontroller4 = FocusNode();
    FocusNode focuscontroller5 = FocusNode();
    FocusNode focuscontroller6 = FocusNode();
    FocusNode focuscontroller7 = FocusNode();
    FocusNode focuscontroller8 = FocusNode();
    DateTime selectedDate = context.read<DobBloc>().state.selectedDate;
    return Scaffold(
      body: BlocBuilder<StudentsAppFormBloc, StudentsAppFormState>(
        builder: (context, state) {
          void handleNextPage(int step) {
            context
                .read<StudentsAppFormBloc>()
                .add(DoYouHaveBankAccEvent(currentStep: step));
          }

          void handlePrevious(int step) {
            context
                .read<StudentsAppFormBloc>()
                .add(DoYouHaveBankAccEvent(currentStep: step));
          }

          List<FocusNode> focusControllers = [
            focuscontroller1,
            focuscontroller2,
            focuscontroller3,
            focuscontroller4,
            focuscontroller5,
            focuscontroller6,
            focuscontroller7,
            focuscontroller8,
          ];

          return GestureDetector(
            onTap: () {
              for (var focusController in focusControllers) {
                if (focusController.hasFocus) {
                  focusController.unfocus();
                }
              }
            },
            child: CustomStepper(
              currentPage: state.currentStep,
              scrollController: scrollController,
              steps: [
                AddStep(
                  status: validationPersonalInfoBox.get('key')?.status == 2
                      ? 'completed'
                      : validationPersonalInfoBox.get('key')?.status == 1
                          ? 'In progress'
                          : validationPersonalInfoBox.get('key')?.status == 0
                              ? 'Todo'
                              : ' todo',
                  stepIcon: Icons.school_rounded,
                  title: 'Info',
                  content: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: <Widget>[
                        InfoLayout(
                          title: 'Personal Info',
                          nameController: nameController,
                          addressController: addressController,
                          emailController: emailController,
                          phoneNoController: phoneNoController,
                          nameatBankController: nameatBankController,
                          accNoController: accNoController,
                          ifscController: ifscController,
                          infonamefocusNode: focuscontroller1,
                          infoaddressfocusNode: focuscontroller2,
                          numericalfocusnode: focuscontroller3,
                          emailfocusnode: focuscontroller4,
                          banknamefocusnode: focuscontroller5,
                          accnofocusnode: focuscontroller6,
                          bankifscfocusnode: focuscontroller7,
                        ),
                        const HeightSpacer(),
                        BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
                          listener: (context, state) {
                            state.successorFailure.fold(
                              () {},
                              (either) {
                                either.fold(
                                  (failure) async {
                                    // ignore: avoid_print
                                    print(failure.toString());
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Your snackbar content here'),
                                        ),
                                      );
                                    }

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //         content: Text(failure.toString())));
                                    setState(() {
                                      validationPersonalInfoBox.put(
                                        'key',
                                        ValidationPersonalInfoScreenDB(
                                            status: 1),
                                      );
                                    });
                                  },
                                  (success) async {
                                    setState(() {
                                      validationPersonalInfoBox.put(
                                        'key',
                                        ValidationPersonalInfoScreenDB(
                                            status: 2),
                                      );
                                    });

                                    personalInfoBox!.put(
                                      'key',
                                      personalInfoDB(
                                        name: nameController.text,
                                        gender: true,
                                        dob: selectedDate,
                                        address: addressController.text,
                                        mobno: phoneNoController.text,
                                        email: emailController.text,
                                        doyouHaveBankAcc: true,
                                        nameasPerBank:
                                            nameatBankController.text,
                                        AccNumber: accNoController.text,
                                        bankName: "Federal Bank",
                                        BranchIFSC: ifscController.text,
                                      ),
                                    );

                                    for (var data in personalInfoBox!.values) {
                                      print(
                                          'data from personal info box: $data');
                                      print('name from db: ${data.name}');
                                      print('gender from db: ${data.gender}');
                                      print('dob from db: ${data.dob}');
                                      print('address from db: ${data.address}');
                                      print('mobno from db: ${data.mobno}');
                                      print('email from db: ${data.email}');
                                      print(
                                          'do you have from db: ${data.doyouHaveBankAcc}');
                                      print(
                                          'name as per bank from db: ${data.nameasPerBank}');
                                      print(
                                          'acc number from db: ${data.AccNumber}');
                                      print(
                                          'bank Name from db: ${data.bankName}');
                                      print(
                                          'Branch IFSC from db: ${data.BranchIFSC}');
                                    }
                                    // print(success.data.toString());
                                    scrollController.jumpTo(0.0);
                                    handleNextPage(1);
                                  },
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return BottomCard(
                              nextBtn: InkResponse(
                                onTap: () {
                                  BlocProvider.of<PersonalInfoBloc>(context)
                                      .add(
                                    PostPersonalInfo(
                                      name: nameController.text,
                                      gender: context
                                                  .read<
                                                      HorizontalRadioBtnBloc>()
                                                  .state
                                                  .groupValue ==
                                              1
                                          ? "m"
                                          : "f",
                                      dob: DateFormat('yyyy-MM-dd').format(
                                          context
                                              .read<DobBloc>()
                                              .state
                                              .selectedDate),
                                      phone: phoneNoController.text,
                                      address: addressController.text,
                                      email: emailController.text,
                                      bankaccname: nameatBankController.text,
                                      bankaccno: accNoController.text,
                                      bankid: context
                                          .read<SelctedbankBloc>()
                                          .state
                                          .selectedBank,
                                      bankifsc: ifscController.text,
                                    ),
                                  );
                                },
                                child: const StepperBtn(
                                  nextorprev: 'Next',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AddStep(
                  status: validationFamilyBox.get('key')?.status == 1
                      ? 'Todo'
                      : validationFamilyBox.get('key')?.status == 2
                          ? 'completed'
                          : validationPersonalInfoBox.get('key')?.status == 2
                              ? 'In Progress'
                              : 'Todo',
                  title: 'Family',
                  content: Column(
                    children: [
                      FamilyScreen(
                        fathernameController: fathernameController,
                        realtionfocusNode: focuscontroller1,
                        fatherfocusNode: focuscontroller2,
                        motherfocusNode: focuscontroller3,
                        guardianfocusNode: focuscontroller4,
                        fathericomefocusnode: focuscontroller5,
                        mothernameController: mothernameController,
                        mothericomefocusnode: focuscontroller6,
                        guardianicomefocusnode: focuscontroller7,
                        siblingnamefocusNode: focuscontroller8,
                        fatherincomeController: fatherincomeController,
                        motherincomeController: motherincomeController,
                        guardianameController: guardianameController,
                        guardiaincomeController: guardiaincomeController,
                        siblingnameController1: siblingnameController1,
                        siblingnameController2: siblingnameController2,
                        siblingnameController3: siblingnameController3,
                        siblingnameController4: siblingnameController4,
                        siblingnameController5: siblingnameController5,
                      ),
                      const HeightSpacer(),
                      BlocConsumer<FamilyInfoBloc, FamilyInfoState>(
                        listener: (context, state) {
                          state.successorFailure.fold(
                            () {},
                            (either) {
                              either.fold(
                                (failure) async {
                                  setState(() {
                                    validationFamilyBox.put(
                                      'key',
                                      ValidationFamilyScreenDB(status: 1),
                                    );
                                  });
                                  // ignore: avoid_print
                                  print(failure.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'the failure msg is ------------  ${failure.toString()}')));
                                },
                                (success) async {
                                  setState(() {
                                    validationFamilyBox.put(
                                      'key',
                                      ValidationFamilyScreenDB(status: 2),
                                    );
                                  });

                                  // ignore: avoid_print
                                  // familystatusInfoBox.put(
                                  //   'key',
                                  //   FamilyStatusDB(id: familysuccescount),
                                  // );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'the success msg is ------------ ${success.toString()}')));
                                  print(
                                      'Family Status ID: ${familystatusInfoBox.get('key')?.id}');
                                  print(success.data.toString());
                                  scrollController.jumpTo(0.0);
                                  handleNextPage(2);
                                },
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return BottomCard(
                            prevBtn: InkResponse(
                              onTap: () async {
                                scrollController.jumpTo(0.0);
                                handlePrevious(0);
                              },
                              child: const StepperBtn(nextorprev: 'Prev'),
                            ),
                            nextBtn: InkResponse(
                              onTap: () async {
                                final Box<SiblingCardDB> box =
                                    Hive.box<SiblingCardDB>('aseebsiblingbox');
                                List<Map<String, dynamic>> siblingsList = [];

                            
                                  for (var i = 0; i < box.length; i++) {
                                    final siblings = box.getAt(i);
                                    // final siblingsMap = {
                                    //   'category': siblings?.category.toString(),
                                    //   'achievement_details': siblings?.achievmentController.toString(),
                                    //   'upload_file': 44,
                                    // };
                                    final siblingsMap = {
                                      "name": siblings?.name.toString(),
                                      "gender": siblings?.gender.toString(),
                                      "qualification":
                                          siblings?.qualification.toString(),
                                      "course":
                                          siblings?.courseofstudy.toString(),
                                      "occupation":
                                          siblings?.occupation.toString(),
                                    };
                                    siblingsList.add(siblingsMap);
                                  }
                                  print("Achievements list: $siblingsList");
                                

                           
                                final List<int> keys =
                                    box.keys.cast<int>().toList();
                                for (int key in keys) {
                                  final achievment = box.get(key);
                                  if (achievment != null) {
                                    print(
                                        'ID: $key, Achievement: ${achievment.courseofstudy}');
                                    print(
                                        'ID: $key, category: ${achievment.gender}');
                                    print(
                                        'ID: $key, uploadfile: ${achievment.name}');
                                    BlocProvider.of<FamilyInfoBloc>(context)
                                        .add(FamilyInfoEvent.postFamilyInfo(
                                      fathername:
                                          fathernameController.text.toString(),
                                      falive: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      fdisabled: context
                                              .read<CheckboxsecBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      fincome: fatherincomeController.text
                                          .toString(),
                                      focupation: '4444',
                                      mathername:
                                          mothernameController.text.toString(),
                                      malive: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      mdisabled: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      mincome: motherincomeController.text
                                          .toString(),
                                      mocupation: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      gathername:
                                          guardianameController.text.toString(),
                                      galive: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      gdisabled: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      gincome: guardiaincomeController.text
                                          .toString(),
                                      gocupation: context
                                              .read<CheckboxfirstBloc>()
                                              .state
                                              .alive
                                          ? '1'
                                          : '0',
                                      SiblingsdatafromHive: siblingsList,
                                    ));
                                  }
                                }
                              },
                              child: const StepperBtn(
                                nextorprev: 'Next',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  stepIcon: Icons.family_restroom,
                ),
                AddStep(
                  status: validationAcademicBox.get('key')?.status == 1
                      ? 'Todo'
                      : validationAcademicBox.get('key')?.status == 2
                          ? 'completed'
                          : validationFamilyBox.get('key')?.status == 2
                              ? 'In Progress'
                              : 'Todo',
                  title: 'Academics',
                  content: Column(
                    children: [
                      AcademicsScreen(
                        examregcontroller: examregcontroller,
                        sslcmarks: sslcmarksController,
                        plusone_marks: plusoneMarksController,
                        plustwo_marks: plustwoMarksController,
                        examRegfocusnode: focuscontroller1,
                        sslcfocusnode: focuscontroller2,
                        plusonefocusnode: focuscontroller3,
                        plustwofocusnode: focuscontroller4,
                      ),
                      const HeightSpacer(),
                      AchievmentsScreen(focusNode: focuscontroller5),
                      BlocConsumer<AcademicBloc, AcademicState>(
                        listener: (context, state) {
                          state.successorFailure.fold(
                            () {},
                            (either) {
                              either.fold(
                                (failure) async {
                                  setState(() {
                                    validationAcademicBox.put(
                                      'key',
                                      ValidationAcademicScreenDB(status: 1),
                                    );
                                  });

                                  setState(() {
                                    validationResidentailBox.put(
                                      'key',
                                      ValidationFamilyScreenDB(status: 1),
                                    );
                                  });

                                  // ignore: avoid_print
                                  print(failure.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(failure.toString())));
                                },
                                (success) async {
                                  setState(() {
                                    validationAcademicBox.put(
                                      'key',
                                      ValidationAcademicScreenDB(status: 2),
                                    );
                                  });

                                  print(success.toString());
                                  scrollController.jumpTo(0.0);
                                  handleNextPage(3);
                                },
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return BottomCard(
                            prevBtn: InkResponse(
                              onTap: () {
                                scrollController.jumpTo(0.0);
                                handlePrevious(1);
                              },
                              child: const StepperBtn(nextorprev: 'Prev'),
                            ),
                            nextBtn: InkResponse(
                              onTap: () async {
                                final box =
                                    Hive.box<AchievmentDB>('achievmentBox');
                                final List<int> keys =
                                    box.keys.cast<int>().toList();
                                for (int key in keys) {
                                  final achievment = box.get(key);
                                  if (achievment != null) {
                                    print(
                                        'ID: $key, Achievement: ${achievment.achievmentController}');
                                    print(
                                        'ID: $key, category: ${achievment.category}');
                                    print(
                                        'ID: $key, uploadfile: ${achievment.uploadfile}');
                                    context.read<AcademicBloc>().add(
                                        AcademicEvent.postAchievmentInfo(
                                            student_id: key,
                                            title: achievment.category,
                                            description: achievment
                                                .achievmentController));
                                  }
                                }
                                String stringWithoutPercentsslc =
                                    sslcmarksController.text
                                        .replaceAll(RegExp(r'[^0-9]'), '');
                                String stringWithoutPercentplusone =
                                    plusoneMarksController.text
                                        .replaceAll(RegExp(r'[^0-9]'), '');
                                String stringWithoutPercentplustwo =
                                    plustwoMarksController.text
                                        .replaceAll(RegExp(r'[^0-9]'), '');
                                int parsedNumbersslc =
                                    int.parse(stringWithoutPercentsslc);
                                int parsedNumberplusone =
                                    int.parse(stringWithoutPercentplusone);
                                int parsedNumberplustwo =
                                    int.parse(stringWithoutPercentplustwo);
                                BlocProvider.of<AcademicBloc>(context).add(
                                  AcademicEvent.postAcademicInfo(
                                    school: context
                                        .read<SelectedSchoolBloc>()
                                        .state
                                        .selectedschool,
                                    reg_no: int.parse(examregcontroller.text),
                                    sslc: parsedNumbersslc,
                                    plus_one: parsedNumberplusone,
                                    plus_two: parsedNumberplustwo,
                                    course_pref: context
                                        .read<SelectedCourseBloc>()
                                        .state
                                        .selectedCourse,
                                  ),
                                );
                              },
                              child: const StepperBtn(
                                nextorprev: 'Next',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  stepIcon: Icons.school_rounded,
                ),
                AddStep(
                  status: validationResidentailBox.get('key')?.status == 1
                      ? 'Todo'
                      : validationResidentailBox.get('key')?.status == 2
                          ? 'completed'
                          : validationAcademicBox.get('key')?.status == 2
                              ? 'In Progress'
                              : 'Todo',
                  title: 'Home',
                  content: Column(
                    children: [
                      HomeScreen(
                          landfocusNode: focuscontroller1,
                          landcontroller: landcontroller),
                      const HeightSpacer(),
                      BlocConsumer<PostResidentailDataBloc,
                          PostResidentailDataState>(
                        listener: (context, state) {
                          state.successorFailure.fold(
                            () {},
                            (either) {
                              either.fold(
                                (failure) async {
                                  setState(() {
                                    validationResidentailBox.put(
                                      'key',
                                      ValidationResidentailScreenDB(status: 1),
                                    );
                                  });

                                  // ignore: avoid_print
                                  print(failure.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(failure.toString())));
                                },
                                (success) {
                                  setState(() {
                                    validationResidentailBox.put(
                                      'key',
                                      ValidationResidentailScreenDB(status: 2),
                                    );
                                  });

                                  print(success.data.toString());
                                  scrollController.jumpTo(0.0);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const NavigationScreen();
                                    },
                                  ));
                                },
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return BottomCard(
                            prevBtn: InkResponse(
                              onTap: () {
                                scrollController.jumpTo(0.0);
                                handlePrevious(2);
                              },
                              child: const StepperBtn(nextorprev: 'Prev'),
                            ),
                            nextBtn: InkResponse(
                              onTap: () {
                                BlocProvider.of<PostResidentailDataBloc>(
                                        context)
                                    .add(PostResidentailDataEvent
                                        .postResidentailInfo(
                                  houselandSize: landcontroller.text,
                                  housedrinkingwater: context
                                          .read<Question3ResBloc>()
                                          .state
                                          .pipewater
                                      ? "1"
                                      : context
                                              .read<Question3ResBloc>()
                                              .state
                                              .wellwater
                                          ? "2"
                                          : "3",
                                  houseroof: context
                                          .read<Question2ResBloc>()
                                          .state
                                          .sheet
                                      ? "1"
                                      : context
                                              .read<Question2ResBloc>()
                                              .state
                                              .concrete
                                          ? "2"
                                          : "3",
                                  houseOwnership: context
                                              .read<Question1ResBloc>()
                                              .state
                                              .ownHouse ==
                                          true
                                      ? "1"
                                      : "2",
                                ));
                              },
                              child: const StepperBtn(
                                nextorprev: 'Next',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  stepIcon: Icons.family_restroom,
                ),
              ],
              config: StepConfig(
                activeConfig: AcitiveUi(),
                inactiveConfig: InacitiveUi(
                  iconBgColor: Colors.black45,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
