
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:panakj_app/ui/view_model/selected_course/selected_course_bloc.dart';
part 'family_event.dart';
part 'family_state.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {
  int? selectedCourse;
  final SelectedCourseBloc selectedcoursebloc;
  FamilyBloc({
    required this.selectedcoursebloc,
    this.selectedCourse,
  }) : super(FamilyState(nosiblings: false,siblings: false)) {
    // Subscribe to SelectedCourseBloc state changes
    selectedcoursebloc.stream.listen((selectedCourseState) {
      if (selectedCourseState.selectedCourse.isEven) {
        selectedCourse = selectedCourseState.selectedCourse;
      }
    });

    on<ForSiblings>((event, emit) {
      emit(FamilyState(
        siblings: true,
        nosiblings: false,
        numberOfSiblings: state.numberOfSiblings,
      ));
    });

    on<FornoSiblings>((event, emit) {
      emit(FamilyState(
        siblings: false,
        nosiblings: true,
        numberOfSiblings: state.numberOfSiblings,
      ));
    });


  
  }
}
  