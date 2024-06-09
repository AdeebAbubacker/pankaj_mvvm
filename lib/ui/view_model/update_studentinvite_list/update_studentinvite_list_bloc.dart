import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/create_new_invited_student/create_new_invited_student.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/update_student_data/update_student_data.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'update_studentinvite_list_event.dart';
part 'update_studentinvite_list_state.dart';
part 'update_studentinvite_list_bloc.freezed.dart';



class UpdateStudentinviteListBloc extends Bloc<
    UpdateStudentinviteListEvent, UpdateStudentinviteListState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  UpdateStudentinviteListBloc(this.getAllFieldVerficationService)
      : super(UpdateStudentinviteListState.initial()) {
    on<_UpdateStudentinviteListEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        // Placeholder for fetching data from the service
        final fieldverification =
            await getAllFieldVerficationService.updateStudentData(
              studentid: event.studentId,
          name: event.name,
          phoneNo: event.phoneNo,
          schoolId: event.schoolId,
          email: event.email,
        );

        emit(state.copyWith(
            updateStudentData: fieldverification,
            isLoading: false,
            successorFailure: optionOf(right(fieldverification))));
     } catch (e) {
        // Handle error and update state
        emit(state.copyWith(
            isError: true,
            isLoading: false,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
    });
  }
}
