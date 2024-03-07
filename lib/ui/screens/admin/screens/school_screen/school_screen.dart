import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/ui/view_model/getschool/getschool_bloc.dart';

import 'dart:async';

class SchoolScreen extends StatefulWidget {
  SchoolScreen({Key? key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  late Box<SchoolDB> schoolBox;
  
  late StreamController<List<SchoolDB>> _streamController;
  late Stream<List<SchoolDB>> _stream;
  var schools;
  Map<int?, String?>? schoolData;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<List<SchoolDB>>.broadcast();
    _stream = _streamController.stream;
    openSchoolBox();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> openSchoolBox() async {
    schoolBox = await Hive.openBox<SchoolDB>('schoolBox');
    updateSchoolList();

    // Listen to changes in the Hive box and add events to the stream
    schoolBox.listenable().addListener(() {
      updateSchoolList();
    });
  }

  void updateSchoolList() {
    _streamController.add(schoolBox.values.toList());
  }

  void _showEditModalBottomSheet(BuildContext context,
      {required int schoolId, required String schoolName}) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return NotificationSheet(
          schoolId: schoolId,
          schoolName: schoolName,
          streamController: _streamController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      BlocProvider.of<GetschoolBloc>(context)
          .add(const GetschoolEvent.getschool());
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showNotificationSheet(context);
          },
          child: const Icon(Icons.add)),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
          elevation: 8,
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
        child: StreamBuilder<List<SchoolDB>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final schoolList = snapshot.data ?? [];
              return BlocConsumer<GetschoolBloc, GetschoolState>(
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
                                    schools = schoolBox.getAt(i),
                                    print(
                                        'School at index $i: id=${schools.id}, name=${schools.name}')
                                  }
                              }),
                    );
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        left: 1,
                        right: 1,
                      ),
                      itemCount: schoolList.length,
                      itemBuilder: (context, index) {
                        final school = schoolList[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(115, 232, 231, 231),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '${school.id}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        school.name,
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
                                    IconButton(
                                      onPressed: () {
                                        final schoolId = schoolList[index].id;
                                        final schoolName =
                                            schoolList[index].name;
                                        _showEditModalBottomSheet(context,
                                            schoolId: schoolId!.toInt(),
                                            schoolName: schoolName);
                                        BlocProvider.of<GetschoolBloc>(context)
                                            .add(GetschoolEvent.editName(
                                                schoolId: schoolId,
                                                newName: schoolName));
                                        BlocProvider.of<GetschoolBloc>(context)
                                            .add(const GetschoolEvent
                                                .getschool());
                                      },
                                      icon: const Icon(Icons.edit,
                                          color: Colors.black38),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        final schoolId = schoolList[index].id;
                                        BlocProvider.of<GetschoolBloc>(context)
                                            .add(GetschoolEvent.deleteschool(
                                                schoolId: schoolId!.toInt()));

                                        schoolBox.delete(schoolId);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 232, 75, 75),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void _showNotificationSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final titlecontroller = TextEditingController();
        return BlocBuilder<GetschoolBloc, GetschoolState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Add To Do ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: titlecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Todo Items',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      final todoName = titlecontroller.text;
                      final schoolBox = Hive.box<SchoolDB>('schoolBox');
                      final lastId =
                          schoolBox.keys.cast<int>().toList().fold(0, max);
                      final newId = lastId + 1; // Generate a new ID

                      // Add the new todo to Hive with the generated ID
                      schoolBox.put(
                        newId,
                        SchoolDB(
                          id: newId,
                          name: todoName,
                        ),
                      );
                      BlocProvider.of<GetschoolBloc>(context)
                          .add(GetschoolEvent.addschool(schoolname: todoName));

                      // Update the UI to reflect the changes
                      //  updateSchoolList(schoolBox);

                      titlecontroller.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add Todo"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class NotificationSheet extends StatelessWidget {
  final int? schoolId;
  final String? schoolName;
  final StreamController<List<SchoolDB>> streamController;

  NotificationSheet({
    required this.schoolId,
    required this.schoolName,
    required this.streamController,
  });

  final titlecontroller = TextEditingController();

  void updateSchoolList(Box<SchoolDB> schoolBox) {
    streamController.add(schoolBox.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    titlecontroller.text = schoolName!;
    titlecontroller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: titlecontroller.text.length,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add To Do ',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: titlecontroller,
            decoration: const InputDecoration(
              labelText: 'Enter Todo Items',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              final newSchoolName = titlecontroller.text;

              // Update school name in Hive box
              final schoolBox = Hive.box<SchoolDB>('schoolBox');
              final school = schoolBox.get(schoolId);
              if (school != null) {
                school.name = newSchoolName;
                await schoolBox.put(schoolId, school);
                BlocProvider.of<GetschoolBloc>(context).add(
                  GetschoolEvent.editName(
                    schoolId: schoolId!.toInt(),
                    newName: newSchoolName,
                  ),
                );
              }

              // Notify stream controller to update the stream
              updateSchoolList(schoolBox);

              // Close the modal bottom sheet
              Navigator.of(context).pop();
            },
            child: const Text("Edit School"),
          ),
        ],
      ),
    );
  }
}
