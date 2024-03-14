part of 'createnew_studentinvite_list_bloc.dart';

@freezed


class CreatenewStudentinviteListState with _$CreatenewStudentinviteListState {
  factory CreatenewStudentinviteListState.initial() {
    return  CreatenewStudentinviteListState(
      isLoading: false,
      isError: false,
      createNewInvitedStudent: CreateNewInvitedStudent(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory CreatenewStudentinviteListState({
    required bool isLoading,
    required bool isError,
    required CreateNewInvitedStudent createNewInvitedStudent ,
    required Option<Either<MainFailure, CreateNewInvitedStudent>> successorFailure,
  }) = _CreatenewStudentinviteListState;
}