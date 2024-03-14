import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/students_invite_list_model/students_invite_list_model.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'students_invite_list_event.dart';
part 'students_invite_list_state.dart';
part 'students_invite_list_bloc.freezed.dart';

class StudentsInviteListBloc
    extends Bloc<StudentsInviteListEvent, StudentsInviteListState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  StudentsInviteListBloc(this.getAllFieldVerficationService)
      : super(StudentsInviteListState.initial()) {
    on<GetinvitedStudentsList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        // Placeholder for fetching data from the service
        final fieldverification =
            await getAllFieldVerficationService.getinvitedStudentsList();

        emit(state.copyWith(
            studentsInviteListModel: fieldverification,
            isLoading: false,
            successorFailure: optionOf(right(fieldverification))));
        print('succes from bloc $fieldverification');
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
