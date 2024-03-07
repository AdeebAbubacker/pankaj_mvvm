import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panakj_app/ui/view_model/applicants/applicants_bloc.dart';

class ApplicantScreen extends StatefulWidget {
  @override
  _ApplicantScreenState createState() => _ApplicantScreenState();
}

class _ApplicantScreenState extends State<ApplicantScreen> {
  final heading = [
    'All',
    'Application completed',
    'Application Incompleted',
    'Accepted',
    'Rejected',
  ];

  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = 0;
    if (_selectedTabIndex == 0) {
      BlocProvider.of<ApplicantsBloc>(context)
          .add(const ApplicantsEvent.getallApplicants());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  padding: const EdgeInsets.all(9),
                  scrollDirection: Axis.horizontal,
                  itemCount: heading.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                          if (_selectedTabIndex == 0) {
                            BlocProvider.of<ApplicantsBloc>(context)
                                .add(const ApplicantsEvent.getallApplicants());
                          } else if (_selectedTabIndex == 1) {
                            BlocProvider.of<ApplicantsBloc>(context).add(
                                const ApplicantsEvent.getcompletedApplicants());
                          } else if (_selectedTabIndex == 2) {
                            BlocProvider.of<ApplicantsBloc>(context).add(
                                const ApplicantsEvent
                                    .getincompletedApplicants());
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          heading[index],
                          style: TextStyle(
                            color: _selectedTabIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: _selectedTabIndex == 0 ? true : false,
              child: BlocBuilder<ApplicantsBloc, ApplicantsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    BlocProvider.of<ApplicantsBloc>(context)
                        .add(const ApplicantsEvent.getallApplicants());
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 190),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.applicants.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StudentReciptentCard(
                          studentid: state.applicants[index].id.toString(),
                          image: Image.asset(
                            's',
                            width: 50,
                            height: 50,
                          ),
                          name: state.applicants[index].name,
                          schoolname:
                              state.applicants[index].school_name ?? 'dd',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Visibility(
              visible: _selectedTabIndex == 1 ? true : false,
              child: BlocBuilder<ApplicantsBloc, ApplicantsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    BlocProvider.of<ApplicantsBloc>(context)
                        .add(const ApplicantsEvent.getcompletedApplicants());
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 190),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.applicants.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StudentReciptentCard(
                          studentid: state.applicants[index].id.toString(),
                          image: Image.asset(
                            's',
                            width: 50,
                            height: 50,
                          ),
                          name: state.applicants[index].name,
                          schoolname:
                              state.applicants[index].school_name ?? 'dd',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Visibility(
              visible: _selectedTabIndex == 2 ? true : false,
              child: BlocBuilder<ApplicantsBloc, ApplicantsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    BlocProvider.of<ApplicantsBloc>(context)
                        .add(const ApplicantsEvent.getincompletedApplicants());
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 190),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.applicants.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StudentReciptentCard(
                          studentid: state.applicants[index].id.toString(),
                          image: Image.asset(
                            's',
                            width: 50,
                            height: 50,
                          ),
                          name: state.applicants[index].name,
                          schoolname:
                              state.applicants[index].school_name ?? 'dd',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Visibility(
              visible: _selectedTabIndex == 3 ? true : false,
              child: const Text('4'),
            ),
            Visibility(
              visible: _selectedTabIndex == 4 ? true : false,
              child: const Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentReciptentCard extends StatelessWidget {
  final Widget image;
  final String name;
  final String schoolname;
  final String studentid;

  const StudentReciptentCard({
    super.key,
    required this.image,
    required this.name,
    required this.schoolname,
    required this.studentid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Container(
        width: 120,
        height: 180,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 216, 206, 206), width: 1),
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstRow(
                image: image,
                name: name,
                schoolname: schoolname,
                studentid: studentid),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 170,
                height: 40,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {},
                  child: const Text(
                    'Student details',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
    required this.image,
    required this.name,
    required this.schoolname,
    required this.studentid,
  });

  final Widget image;
  final String name;
  final String schoolname;
  final String studentid;

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text; // Return the original text if it's within or equal to maxLength
    } else {
      return "${text.substring(0, maxLength)}..."; // Truncate and append "..."
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(96, 236, 232, 232),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 80,
                height: 100,
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: truncateText(name, 20),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'student id: ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              studentid,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.school_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 232, 13, 13),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            RichText(
                              text: TextSpan(
                                text: truncateText(
                                  schoolname,
                                  18,
                                ),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 32, 32, 32),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.person_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 255, 64, 163),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              '22',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

class Recipient {
  final String name;
  final String imagePath;

  Recipient({required this.name, required this.imagePath});
}
