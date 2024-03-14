import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/school_bottomsheet.dart';
import 'package:panakj_app/ui/view_model/createnew_studentinvite_list/createnew_studentinvite_list_bloc.dart';
import 'package:panakj_app/ui/view_model/delete_student_invitelist/delete_student_invitelist_bloc.dart';
import 'package:panakj_app/ui/view_model/getschool/getschool_bloc.dart';
import 'package:panakj_app/ui/view_model/students_invite_list/students_invite_list_bloc.dart';
import 'package:panakj_app/ui/view_model/update_studentinvite_list/update_studentinvite_list_bloc.dart';

class InviteStudentScreen extends StatefulWidget {
  const InviteStudentScreen({Key? key});

  @override
  State<InviteStudentScreen> createState() => _InviteStudentScreenState();
}

class _InviteStudentScreenState extends State<InviteStudentScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      BlocProvider.of<StudentsInviteListBloc>(context)
          .add(const StudentsInviteListEvent.getinvitedStudentsList());
    });

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModal(context);
          // _showpostNotificationSheet(context);
          print('Floating action button pressed');
        },
        child: Icon(Icons.add), // Customize the icon displayed on the button
        backgroundColor: Colors.blue, // Set the button's color
      ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
          elevation: 2,
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
      body: Column(
        children: [
          BlocBuilder<StudentsInviteListBloc, StudentsInviteListState>(
            builder: (context, state) {
              if (state.isError) {
                // Handle error state
              }
              if (state.isLoading) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const CircularProgressIndicator()),
                    ],
                  ),
                );
              }
              if (state.studentsInviteListModel != null &&
                  state.studentsInviteListModel!.data != null &&
                  state.studentsInviteListModel!.data!.isNotEmpty) {
                return SizedBox(
                  width: 390,
                  height: 650,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.studentsInviteListModel!.data!.length,
                    itemBuilder: (context, index) {
                      // Access data from the list
                      final studentName =
                          state.studentsInviteListModel!.data![index].name;
                      final studentemail =
                          state.studentsInviteListModel!.data![index].email;
                      final studentId =
                          state.studentsInviteListModel!.data![index].id;
                      final itemCount =
                          state.studentsInviteListModel!.data!.length;
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 18,
                          left: 5,
                          right: 5,
                        ),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 244, 244),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 9,
                                color: Color.fromARGB(255, 204, 202, 202),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '$studentId',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$studentName',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 19),
                                    child: InkWell(
                                      onTap: () {
                                        _showEditModal(
                                          context: context,
                                          studentId: studentId.toString(),
                                          name: studentName.toString(),
                                          email: studentemail.toString(),
                                          phone: '257281049',
                                        );
                                      },
                                      child:
                                          Image.asset('assets/edit-icon.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<DeleteStudentInvitelistBloc>()
                                            .add(DeleteStudentInvitelistEvent
                                                .deleteStudent(
                                                    studentId:
                                                        studentId.toString()));
                                        BlocProvider.of<StudentsInviteListBloc>(
                                                context)
                                            .add(const StudentsInviteListEvent
                                                .getinvitedStudentsList());
                                      },
                                      child:
                                          Image.asset('assets/delete_icon.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              // If no data is available or is null, return some default widget
              return const Text('No data available');
            },
          ),
        ],
      ),
    );
  }
}

void _showModal(context) {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode schoolIdFocusNode = FocusNode();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController schoolIdController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
    ),
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          if (nameFocusNode.hasFocus ||
              phoneFocusNode.hasFocus ||
              emailFocusNode.hasFocus ||
              schoolIdFocusNode.hasFocus) {
            nameFocusNode.unfocus();
            phoneFocusNode.unfocus();
            emailFocusNode.unfocus();
            schoolIdFocusNode.unfocus();
          }
        },
        child: DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return BlocBuilder<CreatenewStudentinviteListBloc,
                CreatenewStudentinviteListState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Add Student ',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        focusNode: nameFocusNode,
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          labelText: 'Enter Student name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onTap: () {
                          // Set focus on name field when tapping on it
                          // FocusScope.of(context).requestFocus(nameFocusNode);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        focusNode: phoneFocusNode,
                        controller: phonecontroller,
                        decoration: const InputDecoration(
                          labelText: 'Enter Student phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Student email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      schoolBottomSheet(title: 'School'),
                      // TextFormField(
                      //   focusNode: schoolIdFocusNode,
                      //   controller: schoolIdController,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Enter Student school ID',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(10)),
                      //     ),
                      //   ),
                      //   onTap: () {
                      //     // Set focus on school ID field when tapping on it
                      //     // FocusScope.of(context)
                      //     //     .requestFocus(schoolIdFocusNode);
                      //   },
                      // ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(const Size(70, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 234, 77, 56))),
                          onPressed: () {
                            final todoName = namecontroller.text;
                            final phoneNo = phonecontroller.text;

                            BlocProvider.of<CreatenewStudentinviteListBloc>(
                                    context)
                                .add(CreatenewStudentinviteListEvent
                                    .createnewinvitedStudentsList(
                              name: namecontroller.text,
                              phoneNo: phonecontroller.text,
                              schoolId: '4',
                              email: emailController.text,
                            ));
                            BlocProvider.of<StudentsInviteListBloc>(context)
                                .add(const StudentsInviteListEvent
                                    .getinvitedStudentsList());

                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Invite Student',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}

void _showEditModal(
    {context,
    required String studentId,
    required String name,
    required String phone,
    required String email}) {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode schoolIdFocusNode = FocusNode();
  final TextEditingController namecontroller =
      TextEditingController(text: name);
  final TextEditingController phonecontroller =
      TextEditingController(text: phone);
  final TextEditingController emailController =
      TextEditingController(text: email);
  final TextEditingController schoolIdController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
    ),
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          if (nameFocusNode.hasFocus ||
              phoneFocusNode.hasFocus ||
              emailFocusNode.hasFocus ||
              schoolIdFocusNode.hasFocus) {
            nameFocusNode.unfocus();
            phoneFocusNode.unfocus();
            emailFocusNode.unfocus();
            schoolIdFocusNode.unfocus();
          }
        },
        child: DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Edit Student ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    focusNode: nameFocusNode,
                    controller: namecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Student name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onTap: () {
                      // Set focus on name field when tapping on it
                      // FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    focusNode: phoneFocusNode,
                    controller: phonecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Student phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    focusNode: emailFocusNode,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Student email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  schoolBottomSheet(title: 'School'),
                  // TextFormField(
                  //   focusNode: schoolIdFocusNode,
                  //   controller: schoolIdController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Enter Student school ID',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     // Set focus on school ID field when tapping on it
                  //     // FocusScope.of(context)
                  //     //     .requestFocus(schoolIdFocusNode);
                  //   },
                  // ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(70, 40)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 234, 77, 56))),
                      onPressed: () {
                        context.read<UpdateStudentinviteListBloc>().add(
                            UpdateStudentinviteListEvent
                                .updateinvitedStudentsList(
                                    studentId: studentId,
                                    name: namecontroller.text,
                                    phoneNo: phonecontroller.text,
                                    schoolId: '7',
                                    email: emailController.text));
                        BlocProvider.of<StudentsInviteListBloc>(context).add(
                            const StudentsInviteListEvent
                                .getinvitedStudentsList());
                        _fetchUpdatedStudentsList(
                            context); // Fetch updated list
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Edit Student',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

void _fetchUpdatedStudentsList(BuildContext context) {
  BlocProvider.of<StudentsInviteListBloc>(context)
      .add(const StudentsInviteListEvent.getinvitedStudentsList());
}
