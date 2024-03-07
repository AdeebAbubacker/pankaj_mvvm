import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/ui/view_model/getschool/getschool_bloc.dart';

class TestingScreen extends StatelessWidget {
  TestingScreen({super.key});
  var schools;

  Map<int?, String?>? schoolData;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetschoolBloc>(context)
          .add(const GetschoolEvent.getschool());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<GetschoolBloc, GetschoolState>(
          listener: (context, state) {
            if (state.isError) {
              // ignore: avoid_print
              print('eror');
            }
            if (state.isLoading) {
              // ignore: avoid_print
              print('isLoading');
              // ignore: avoid_print
            } else {
              print('successorFailure');
              state.successorFailure.fold(
                () => () {},
                (either) => either.fold(
                    (failure) => {print('Failure')},
                    (success) => {
                          schoolData = Map.fromIterables(
                              success.toList().map((e) => e.id),
                              success.toList().map((e) => e.name)),
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
            return const Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
