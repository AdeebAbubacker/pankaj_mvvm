part of 'delete_student_invitelist_bloc.dart';

@freezed

class DeleteStudentInvitelistState with _$DeleteStudentInvitelistState {
  factory DeleteStudentInvitelistState.initial() {
    return  DeleteStudentInvitelistState(
      isLoading: false,
      isError: false,
      createNewInvitedStudent: DeleteStudentInviteList(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory DeleteStudentInvitelistState({
    required bool isLoading,
    required bool isError,
    required DeleteStudentInviteList createNewInvitedStudent ,
    required Option<Either<MainFailure, DeleteStudentInviteList>> successorFailure,
  }) = _DeleteStudentInvitelistState;
}