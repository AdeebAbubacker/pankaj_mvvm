import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/school_group/school_group.dart';
import 'package:panakj_app/core/service/school_group_service.dart';

part 'school_group_event.dart';
part 'school_group_state.dart';
part 'school_group_bloc.freezed.dart';

class SchoolGroupBloc extends Bloc<SchoolGroupEvent, SchoolGroupState> {
  final GetAllFieldVerficationService schoolGroupService;

  SchoolGroupBloc(this.schoolGroupService) : super(SchoolGroupState.initial()) {
    on<Getschoolgroup>((event, emit) async {
      emit(
        const SchoolGroupState(
            isLoading: true,
            isError: false,
            recipients: [],
            successorFailure: None()),
      );
      try {
        final List<SchoolGroup> response =
            await schoolGroupService.getAllSchoolGroups();
        print('my applicants are ---------------- ${response.length}');
        emit(SchoolGroupState(
          isLoading: false,
          isError: false,
          recipients: response,
          successorFailure: optionOf(right(response)),
        ));
        print('success ${response.length}');
      } catch (e) {
        print('Error caught: $e');
        emit(SchoolGroupState(
          isLoading: false,
          isError: true,
          recipients: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
        print('failure from bloc');
      }
    });
  }
}
