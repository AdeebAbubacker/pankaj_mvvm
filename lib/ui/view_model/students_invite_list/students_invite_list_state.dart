part of 'students_invite_list_bloc.dart';

@freezed


class StudentsInviteListState with _$StudentsInviteListState {
  factory StudentsInviteListState.initial() {
    return  StudentsInviteListState(
      isLoading: false,
      isError: false,
      studentsInviteListModel: StudentsInviteListModel(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory StudentsInviteListState({
    required bool isLoading,
    required bool isError,
    required StudentsInviteListModel studentsInviteListModel ,
    required Option<Either<MainFailure, StudentsInviteListModel>> successorFailure,
  }) = _StudentsInviteListState;
}