import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopGradeScreeen extends StatefulWidget {
  const TopGradeScreeen({super.key});

  @override
  _TopGradeScreeenState createState() => _TopGradeScreeenState();
}

class _TopGradeScreeenState extends State<TopGradeScreeen>
    with SingleTickerProviderStateMixin {
  final heading = [
    '2023',
    '2022',
    '2021',
    '2020',
  ];
  List<Widget> tabList = [
    ListScreen(),
    ListScreen(),
    ListScreen(),
    ListScreen(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
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
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.all(3),
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    const Color.fromARGB(255, 116, 230, 120).withOpacity(0.5)),
            tabs: heading.map((item) {
              return Tab(
                child: Center(
                  child: Text(
                    item,
                    style: GoogleFonts.mPlus1p(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          title: Text(
            'Pankaj Trust',
            style: GoogleFonts.mPlus1p(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabList.map((item) {
          return SizedBox(
            width: double.infinity,
            height: 305,
            child: item,
          );
        }).toList(),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  List<StudentDataModel> allStudents = [
    StudentDataModel(
      name: 'Jayakrishnan',
      imagepath: 'assets/hrishi.png',
      schoolname: 'tripunitara',
      studentId: 123,
      id: '1',
    ),
    StudentDataModel(
      name: 'Anandakrishnan',
      imagepath: 'assets/jk.jpg',
      schoolname: 'vytilla',
      studentId: 451,
      id: '2',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '3',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '4',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '5',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '6',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '7',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '8',
    ),
    StudentDataModel(
      name: 'Hrithik',
      imagepath: 'assets/vishnu.jpg',
      schoolname: 'edapally',
      studentId: 561,
      id: '9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: ListView.builder(
        itemCount: allStudents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                border:
                    Border.all(color: const Color.fromARGB(255, 232, 230, 230)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 222, 220, 220)
                        .withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Container(
                      width: 29,
                      height: 29,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(90)),
                          color: Colors.green.withOpacity(0.5)),
                      child: Center(child: Text('${allStudents[index].id}'))),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    child: Image.asset(allStudents[index].imagepath.toString()),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(allStudents[index].name),
                        Text('student id : ${allStudents[index].studentId}'),
                        Text('school  ${allStudents[index].schoolname}'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility)),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StudentDataModel {
  final String? id;
  final String? imagepath;
  final String name;
  final int studentId;
  final String schoolname;
  StudentDataModel({
    this.id,
    this.imagepath,
    required this.name,
    required this.studentId,
    required this.schoolname,
  });
}
