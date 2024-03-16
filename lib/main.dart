import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/cache_screen1_adapter/cache_screen1_adap.dart';
import 'package:panakj_app/core/db/adapters/cache_screen4_adapter/cache_screen4_adap.dart';
import 'package:panakj_app/core/db/adapters/college_adapter/college_adapter.dart';
import 'package:panakj_app/core/db/adapters/course_adapter/course_adapter.dart';
import 'package:panakj_app/core/db/adapters/family_success_status/family_status_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_plaster_adapter/house_plaster_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_plotsize_adapter/house_plotsize_adapter.dart';
import 'package:panakj_app/core/db/adapters/house_roof_adapter/house_roof_adapter.dart';
import 'package:panakj_app/core/db/adapters/life_status_adapter/life_status_adapter.dart';
import 'package:panakj_app/core/db/adapters/occupation_adapter/occupation_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_education_adapter/parents_education_adapter.dart';
import 'package:panakj_app/core/db/adapters/parents_income/parents_income_adapter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/core/db/adapters/qualification_adapter/qualification_adapter.dart';
import 'package:panakj_app/core/db/adapters/rental_house_adapter/rental_house_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_group_adapter/school_group_adapter.dart';
import 'package:panakj_app/core/db/adapters/sibling_data_FV_adapter/sibling_data_FV_adapter.dart';
import 'package:panakj_app/core/db/adapters/sibling_education_adapter/sibling_education_adapter.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';
import 'package:panakj_app/core/db/adapters/validation_academics/validation_academicadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_familyscreen/validation_familyscreenadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_personalinfo/validation_personalinfoadapter.dart';
import 'package:panakj_app/core/db/adapters/validation_residential/validation_residentialadapter.dart';
import 'package:panakj_app/core/db/adapters/water_source_adapter/water_source_adapter.dart';
import 'package:panakj_app/core/db/boxes/achievment_box.dart';
import 'package:panakj_app/core/db/boxes/bank_box.dart';
import 'package:panakj_app/core/db/boxes/cache_screen1_box.dart';
import 'package:panakj_app/core/db/boxes/cache_screen4_box.dart';
import 'package:panakj_app/core/db/boxes/college_box.dart';
import 'package:panakj_app/core/db/boxes/course_box.dart';
import 'package:panakj_app/core/db/boxes/family_status_box.dart';
import 'package:panakj_app/core/db/boxes/house_plaster.dart';
import 'package:panakj_app/core/db/boxes/house_plot_size.dart';
import 'package:panakj_app/core/db/boxes/house_roof.dart';
import 'package:panakj_app/core/db/boxes/life_status_box.dart';
import 'package:panakj_app/core/db/boxes/occupation_box.dart';
import 'package:panakj_app/core/db/boxes/parents_education_box.dart';
import 'package:panakj_app/core/db/boxes/parents_income_box.dart';
import 'package:panakj_app/core/db/boxes/personal_info_box.dart';
import 'package:panakj_app/core/db/boxes/qualification_box.dart';
import 'package:panakj_app/core/db/boxes/rental_house_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/core/db/boxes/school_group_box.dart';
import 'package:panakj_app/core/db/boxes/sibling_data_fv_box.dart';
import 'package:panakj_app/core/db/boxes/sibling_education_box.dart';
import 'package:panakj_app/core/db/boxes/siblingcard_box.dart';
import 'package:panakj_app/core/db/boxes/validation_academicBox.dart';
import 'package:panakj_app/core/db/boxes/validation_familyBox.dart';
import 'package:panakj_app/core/db/boxes/validation_personalinfoBox.dart';
import 'package:panakj_app/core/db/boxes/validation_residentialBox.dart';
import 'package:panakj_app/core/db/boxes/water_source_box.dart';
import 'package:panakj_app/core/service/academic_service.dart';
import 'package:panakj_app/core/service/applicants_service.dart';
import 'package:panakj_app/core/service/auth_service.dart';
import 'package:panakj_app/core/service/bank_service.dart';
import 'package:panakj_app/core/service/course_service.dart';
import 'package:panakj_app/core/service/drop_down_service.dart';
import 'package:panakj_app/core/service/family_service.dart';
import 'package:panakj_app/core/service/field_verification_service.dart';
import 'package:panakj_app/core/service/gallery_service.dart';
import 'package:panakj_app/core/service/get_college_service.dart';
import 'package:panakj_app/core/service/get_school_service.dart';
import 'package:panakj_app/core/service/occupation_service.dart';
import 'package:panakj_app/core/service/post_personalinfoservice.dart';
import 'package:panakj_app/core/service/qualification_service.dart';
import 'package:panakj_app/core/service/recepient_service.dart';
import 'package:panakj_app/core/service/residential_service.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';
import 'package:panakj_app/core/service/school_service.dart';
import 'package:panakj_app/core/service/trancate_service.dart';
import 'package:panakj_app/firebase_options.dart';
import 'package:panakj_app/ui/screens/admin/admin_dashboard/admin_dashboard.dart';
import 'package:panakj_app/ui/screens/auth/splash_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/question_one.dart';
import 'package:panakj_app/ui/trancate_screen.dart';
import 'package:panakj_app/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_app/ui/view_model/acadmicdetails/academic_bloc.dart';
import 'package:panakj_app/ui/view_model/alive_ordisabled_fieldadmin/alive_ordisabled_fieldadmin_bloc.dart';
import 'package:panakj_app/ui/view_model/applicants/applicants_bloc.dart';
import 'package:panakj_app/ui/view_model/auth/auth_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxfirst/checkboxfirst_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxsec/checkboxsec_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxthird/checkboxthird_bloc.dart';
import 'package:panakj_app/ui/view_model/createnew_studentinvite_list/createnew_studentinvite_list_bloc.dart';
import 'package:panakj_app/ui/view_model/delete_student_invitelist/delete_student_invitelist_bloc.dart';
import 'package:panakj_app/ui/view_model/family/family_bloc.dart';
import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';
import 'package:panakj_app/ui/view_model/field_verification/field_verification_bloc.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';
import 'package:panakj_app/ui/view_model/get_gallery/get_gallery_bloc.dart';
import 'package:panakj_app/ui/view_model/get_news/get_news_bloc.dart';
import 'package:panakj_app/ui/view_model/get_rental_house/get_rental_house_bloc.dart';
import 'package:panakj_app/ui/view_model/get_sibling_education/get_sibling_education_bloc.dart';
import 'package:panakj_app/ui/view_model/get_water_source/get_water_source_bloc.dart';
import 'package:panakj_app/ui/view_model/getcolleges/getcolleges_bloc.dart';
import 'package:panakj_app/ui/view_model/getschool/getschool_bloc.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_app/ui/view_model/house_plastering/house_plastering_bloc.dart';
import 'package:panakj_app/ui/view_model/house_plot_size/house_plot_size_bloc.dart';
import 'package:panakj_app/ui/view_model/house_roof/house_roof_bloc.dart';
import 'package:panakj_app/ui/view_model/life_status/life_status_bloc.dart';
import 'package:panakj_app/ui/view_model/monthly_income/monthly_income_bloc.dart';
import 'package:panakj_app/ui/view_model/parents_education/parents_education_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/post_residentail_data/post_residentail_data_bloc.dart';
import 'package:panakj_app/ui/view_model/question1_res/question1_res_bloc.dart';
import 'package:panakj_app/ui/view_model/question2_res/question2_res_bloc.dart';
import 'package:panakj_app/ui/view_model/question3_res/question3_res_bloc.dart';
import 'package:panakj_app/ui/view_model/recipients/recipents_bloc.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';
import 'package:panakj_app/ui/view_model/search_bank/search_bank_bloc.dart';
import 'package:panakj_app/ui/view_model/search_courses/courses_bloc.dart';
import 'package:panakj_app/ui/view_model/search_occupation/search_occupation_bloc.dart';
import 'package:panakj_app/ui/view_model/search_qualification/search_qualification_bloc.dart';
import 'package:panakj_app/ui/view_model/search_school/search_school_bloc.dart';
import 'package:panakj_app/ui/view_model/selctedbank/selctedbank_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_course/selected_course_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_occupation/selected_occupation_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_qualification/selected_qualification_bloc.dart';
import 'package:panakj_app/ui/view_model/selected_school/selected_school_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';
import 'package:panakj_app/ui/view_model/students_invite_list/students_invite_list_bloc.dart';
import 'package:panakj_app/ui/view_model/truncate/truncate_bloc.dart';
import 'package:panakj_app/ui/view_model/update_studentinvite_list/update_studentinvite_list_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase client
  await Supabase.initialize(
      url: 'https://nuijjfzzemdlzirwpahw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51aWpqZnp6ZW1kbHppcndwYWh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxMjIzOTksImV4cCI6MjAyMjY5ODM5OX0.Nh83ebqzf1iGHTaGywss6WIkkNlSiPHE-OFbebPmGYY');

  ///-------------Initialize Hive----------------------------
  await Hive.initFlutter();

  ///-------------register adapter----------------------------
  Hive.registerAdapter(BankDBAdapter());
  Hive.registerAdapter(personalInfoDBAdapter());
  Hive.registerAdapter(CourseDBAdapter());
  Hive.registerAdapter(SchoolDBAdapter());
  Hive.registerAdapter(qualificationDBAdapter());
  Hive.registerAdapter(FamilyStatusDBAdapter());
  Hive.registerAdapter(OccupationDBAdapter());
  Hive.registerAdapter(ValidationPersonalInfoScreenDBAdapter());
  Hive.registerAdapter(ValidationFamilyScreenDBAdapter());
  Hive.registerAdapter(ValidationAcademicScreenDBAdapter());
  Hive.registerAdapter(ValidationResidentailScreenDBAdapter());
  Hive.registerAdapter(SiblingCardDBAdapter());
  Hive.registerAdapter(AchievmentDBAdapter());
  Hive.registerAdapter(cacheScreen1DBAdapter());
  Hive.registerAdapter(cacheScreen4DBAdapter());
  Hive.registerAdapter(CollegeDBAdapter());
  Hive.registerAdapter(SchoolGroupDBAdapter());
  Hive.registerAdapter(LifeStatusDBAdapter());
  Hive.registerAdapter(ParentsEducationDBAdapter());
  Hive.registerAdapter(ParentsIncomeDBAdapter());
  Hive.registerAdapter(HousePlotSizeDBAdapter());
  Hive.registerAdapter(HouseRoofDBAdapter());
  Hive.registerAdapter(HousePlasterDBAdapter());
  Hive.registerAdapter(WaterSourceDBAdapter());
  Hive.registerAdapter(RentalHouseDBAdapter());
  Hive.registerAdapter(SiblingEducationDBAdapter());
  Hive.registerAdapter(SiblingDataFVDBAdapter());

  ///----------------open box-------------------------------------------------
  bankBox = await Hive.openBox<BankDB>('bankBox');
  houseplotsizeBox = await Hive.openBox<HousePlotSizeDB>('houseplotsizeBox');
  houseplasterBox = await Hive.openBox<HousePlasterDB>('houseplasterBox');
  siblingdataFVbox = await Hive.openBox<SiblingDataFVDB>('siblingdataFVbox');
  siblingeducationbox =
      await Hive.openBox<SiblingEducationDB>('siblingeducationbox');
  houseroofBox = await Hive.openBox<HouseRoofDB>('houseroofBox');
  waterSourceBox = await Hive.openBox<WaterSourceDB>('waterSourceBox');
  rentalHouseBox = await Hive.openBox<RentalHouseDB>('rentalHouseBox');
  lifestatusInfoBox = await Hive.openBox<LifeStatusDB>('lifestatusInfoBox');
  parentsIncomeBox = await Hive.openBox<ParentsIncomeDB>('parentsIncomeBox');
  parentsEducationBox =
      await Hive.openBox<ParentsEducationDB>('parentsEducationBox');
  school_group_box = await Hive.openBox<SchoolGroupDB>('school_group_box');
  personalInfoBox = await Hive.openBox<personalInfoDB>('personalInfoBox');
  courseBox = await Hive.openBox<CourseDB>('courseBox');
  schoolBox = await Hive.openBox<SchoolDB>('schoolBox');
  occupationBox = await Hive.openBox<OccupationDB>('occupationBox');
  qualificationBox = await Hive.openBox<qualificationDB>('qualificationBox');
  cachescreen1box = await Hive.openBox<cacheScreen1DB>('cachescreen1box');
  cachescreen4box = await Hive.openBox<cacheScreen4DB>('cachescreen4box');
  achievmentBox = await Hive.openBox<AchievmentDB>('achievmentBox');
  collegeBox = await Hive.openBox<CollegeDB>('collegeBox');
  familystatusInfoBox =
      await Hive.openBox<FamilyStatusDB>('familystatusInfoBox');
  aseebsiblingbox = await Hive.openBox<SiblingCardDB>('aseebsiblingbox');
  lifestatusInfoBox = await Hive.openBox<LifeStatusDB>('lifestatusInfoBox');
  validationPersonalInfoBox =
      await Hive.openBox<ValidationPersonalInfoScreenDB>(
          'validationPersonalInfoBox');
  validationFamilyBox =
      await Hive.openBox<ValidationFamilyScreenDB>('validationFamilyBox');
  validationAcademicBox =
      await Hive.openBox<ValidationAcademicScreenDB>('validationAcademicBox');
  validationResidentailBox = await Hive.openBox<ValidationResidentailScreenDB>(
      'validationResidentailBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///----------------lock in portrait mode----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  ///----------------- call service -------------------------------------------
  final AuthService authService = AuthService();
  final GalleryService galleryService = GalleryService();
  final DropDownService dropDownService = DropDownService();
  final BankDropdownService bankDropdownService = BankDropdownService();
  final CourseDropdownService courseDropdownService = CourseDropdownService();
  final SchoolDropDownService schoolDropDownService = SchoolDropDownService();
  final OccupationDropdownService occupationDropdownService =
      OccupationDropdownService();
  final QualificationDropdownService qualificationDropdownService =
      QualificationDropdownService();
  final PostPersonalInfoService postPersonalInfoService =
      PostPersonalInfoService();
  final FamilyInfoService familyinfoservice = FamilyInfoService();
  final AcademicService academicService = AcademicService();
  final ResidentialService residentialService = ResidentialService();
  final GetSchoolService getSchoolService = GetSchoolService();
  final ApplicantService applicantService = ApplicantService();
  final GetCollegeService getCollegeService = GetCollegeService();
  final RecepientService recipientService = RecepientService();
  final TruncateService truncateService = TruncateService();
  final FieldVerificationService fieldVerificationService =
      FieldVerificationService();
  final GetAllFieldVerficationService getAllFieldVerficationService =
      GetAllFieldVerficationService();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FieldVerificationBloc(fieldVerificationService),
        ),
        BlocProvider(
          create: (context) => HorizontalRadioBtnBloc(),
        ),
        BlocProvider(
          create: (context) => StudentsAppFormBloc(),
        ),
        BlocProvider(
          create: (context) =>
              FamilyBloc(selectedcoursebloc: SelectedCourseBloc()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authService),
        ),
        BlocProvider(
          create: (context) => PersonalInfoBloc(postPersonalInfoService),
        ),
        BlocProvider(
          create: (context) => DobBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBankBloc(bankDropdownService),
        ),
        BlocProvider(
          create: (context) => FamilyInfoBloc(familyinfoservice),
        ),
        BlocProvider(
          create: (context) => GetDropdownValuesBloc(dropDownService),
        ),
        BlocProvider(
          create: (context) => CoursesBloc(courseDropdownService),
        ),
        BlocProvider(
          create: (context) => SearchSchoolBloc(schoolDropDownService),
        ),
        BlocProvider(
          create: (context) =>
              SearchQualificationBloc(qualificationDropdownService),
        ),
        BlocProvider(
          create: (context) => SearchOccupationBloc(occupationDropdownService),
        ),
        BlocProvider(
          create: (context) => GetGalleryBloc(galleryService),
        ),
        BlocProvider(
          create: (context) => GetNewsBloc(),
        ),
        BlocProvider(
          create: (context) => AcademicBloc(academicService),
        ),
        BlocProvider(
          create: (context) => CheckboxfirstBloc(),
        ),
        BlocProvider(
          create: (context) => CheckboxsecBloc(),
        ),
        BlocProvider(
          create: (context) => CheckboxthirdBloc(),
        ),
        BlocProvider(
          create: (context) => SelctedbankBloc(),
        ),
        BlocProvider(
          create: (context) => SelectedCourseBloc(),
        ),
        BlocProvider(
          create: (context) => SelectedOccupationBloc(),
        ),
        BlocProvider(
          create: (context) => SelectedQualificationBloc(),
        ),
        BlocProvider(
          create: (context) => PostResidentailDataBloc(residentialService),
        ),
        BlocProvider(
          create: (context) => SelectedOccupationBloc(),
        ),
        BlocProvider(
          create: (context) => SelectedSchoolBloc(),
        ),
        BlocProvider(
          create: (context) => Question1ResBloc(),
          child: const Question1CheckBox(),
        ),
        BlocProvider(
          create: (context) => Question2ResBloc(),
        ),
        BlocProvider(
          create: (context) => Question3ResBloc(),
        ),
        BlocProvider(
          create: (context) => GetschoolBloc(getSchoolService),
        ),
        BlocProvider(
          create: (context) => GetcollegesBloc(getCollegeService),
        ),
        BlocProvider(
          create: (context) => ApplicantsBloc(applicantService),
        ),
        BlocProvider(
          create: (context) => RecipentsBloc(recipientService),
        ),
        BlocProvider(
          create: (context) => TruncateBloc(truncateService),
        ),
        BlocProvider(
          create: (context) => SchoolGroupBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) => LifeStatusBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              ParentsEducationBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) => MonthlyIncomeBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) => HousePlotSizeBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) => HouseRoofBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              HousePlasteringBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              GetWaterSourceBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              GetRentalHouseBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              GetSiblingEducationBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              StudentsInviteListBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              CreatenewStudentinviteListBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              UpdateStudentinviteListBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) =>
              DeleteStudentInvitelistBloc(getAllFieldVerficationService),
        ),
        BlocProvider(
          create: (context) => AliveOrdisabledFieldadminBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        title: '',
        //  theme: ThemeData(useMaterial3: false),
        //  home: AdminDashboard(),
        home: const SplashScreen(),
        //   home: const PostScreen(),
        //  home: const PostScreen(),
       //   home: EditStudentData(),
      ),
    );
  }
}
