import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/delete_student_invite_list/delete_student_invite_list.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'delete_student_invitelist_event.dart';
part 'delete_student_invitelist_state.dart';
part 'delete_student_invitelist_bloc.freezed.dart';

// class DeleteStudentInvitelistBloc extends Bloc<DeleteStudentInvitelistEvent, DeleteStudentInvitelistState> {
//   DeleteStudentInvitelistBloc() : super(_Initial()) {
//     on<DeleteStudentInvitelistEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }



class DeleteStudentInvitelistBloc extends Bloc<
    DeleteStudentInvitelistEvent, DeleteStudentInvitelistState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  DeleteStudentInvitelistBloc(this.getAllFieldVerficationService)
      : super(DeleteStudentInvitelistState.initial()) {
    on<_DeleteStudent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        // Placeholder for fetching data from the service
        final fieldverification =
            await getAllFieldVerficationService.deleteStudentData(
     studentid: event.studentId,
        );

        emit(state.copyWith(
            createNewInvitedStudent: fieldverification,
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
