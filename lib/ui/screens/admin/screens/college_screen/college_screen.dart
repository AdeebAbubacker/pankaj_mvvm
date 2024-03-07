import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/college_adapter/college_adapter.dart';
import 'package:panakj_app/ui/view_model/getcolleges/getcolleges_bloc.dart';
import 'dart:async';

class CollegeScreen extends StatefulWidget {
  CollegeScreen({Key? key});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  late Box<CollegeDB> collegeBox;
  late StreamController<List<CollegeDB>> _streamController;
  late Stream<List<CollegeDB>> _stream;
  var colleges;
  Map<int?, String?>? collegeData;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<List<CollegeDB>>.broadcast();
    _stream = _streamController.stream;
    openCollegeBox();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> openCollegeBox() async {
    collegeBox = await Hive.openBox<CollegeDB>('collegeBox');
    if (collegeBox != null) {
      updateCollegeList();
      collegeBox.listenable().addListener(() {
        updateCollegeList();
      });
    }
  }

  void updateCollegeList() {
    _streamController.add(collegeBox.values.toList());
  }

  void _showEditModalBottomSheet(BuildContext context,
      {required int collegeId, required String collegeName}) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return NotificationSheet(
          collegeId: collegeId,
          collegeName: collegeName,
          streamController: _streamController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      BlocProvider.of<GetcollegesBloc>(context)
          .add(const GetcollegesEvent.getcolllges());
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
        child: StreamBuilder<List<CollegeDB>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final collegeList = snapshot.data ?? [];
              return BlocConsumer<GetcollegesBloc, GetcollegesState>(
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
                                    colleges = collegeBox.getAt(i),
                                    print(
                                        'colleges at index $i: id=${colleges.id}, name=${colleges.name}')
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
                      itemCount: collegeList.length,
                      itemBuilder: (context, index) {
                        final college = collegeList[index];
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
                                    '${college.id}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                     
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 10), // Adjusted SizedBox width
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        college.name,
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
                                        final collegeId = collegeList[index].id;
                                        final collegeName =
                                            collegeList[index].name;
                                        _showEditModalBottomSheet(context,
                                            collegeId: collegeId!.toInt(),
                                            collegeName: collegeName);
                                        BlocProvider.of<GetcollegesBloc>(
                                                context)
                                            .add(GetcollegesEvent.editName(
                                                collegeId: collegeId,
                                                newName: collegeName));
                                        BlocProvider.of<GetcollegesBloc>(
                                                context)
                                            .add(const GetcollegesEvent
                                                .getcolllges());
                                      },
                                      icon: const Icon(Icons.edit,
                                          color: Colors.black38),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        final collegeId = collegeList[index].id;
                                        BlocProvider.of<GetcollegesBloc>(
                                                context)
                                            .add(GetcollegesEvent.deletecollege(
                                                collegeId: collegeId!.toInt()));
                                        final collegeBox =
                                            Hive.box<CollegeDB>('collegeBox');
                                        final college =
                                            collegeBox.get(collegeId);
                                        collegeBox.delete(collegeId);
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
        return BlocBuilder<GetcollegesBloc, GetcollegesState>(
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
                      final collegeBox = Hive.box<CollegeDB>('collegeBox');
                      final lastId =
                          collegeBox.keys.cast<int>().toList().fold(0, max);
                      final newId = lastId + 1; // Generate a new ID

                      // Add the new todo to Hive with the generated ID
                      collegeBox.put(
                        newId,
                        CollegeDB(
                          id: newId,
                          name: todoName,
                        ),
                      );
                      BlocProvider.of<GetcollegesBloc>(context).add(
                          GetcollegesEvent.addcollege(collegename: todoName));
                      collegeBox.put(
                        newId,
                        CollegeDB(
                          id: newId,
                          name: todoName,
                        ),
                      );

                      // Update the UI to reflect the changes
                      //  updatecollegeList(collegeBox);

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
  final int? collegeId;
  final String? collegeName;
  final StreamController<List<CollegeDB>> streamController;

  NotificationSheet({
    required this.collegeId,
    required this.collegeName,
    required this.streamController,
  });

  final titlecontroller = TextEditingController();

  void updatecollegeList(Box<CollegeDB> collegeBox) {
    streamController.add(collegeBox.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    titlecontroller.text = collegeName!;
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
              final newcollegeName = titlecontroller.text;

              // Update college name in Hive box
              final collegeBox = Hive.box<CollegeDB>('collegeBox');
              final college = collegeBox.get(collegeId);
              if (college != null) {
                college.name = newcollegeName;
                await collegeBox.put(collegeId, college);
                // ignore: use_build_context_synchronously
                BlocProvider.of<GetcollegesBloc>(context).add(
                  GetcollegesEvent.editName(
                    collegeId: collegeId!.toInt(),
                    newName: newcollegeName,
                  ),
                );
              }

              // Notify stream controller to update the stream
              updatecollegeList(collegeBox);

              // Close the modal bottom sheet
              Navigator.of(context).pop();
            },
            child: const Text("Edit College"),
          ),
        ],
      ),
    );
  }
}
