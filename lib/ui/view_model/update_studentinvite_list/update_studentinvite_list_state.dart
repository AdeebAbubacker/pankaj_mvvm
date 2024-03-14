part of 'update_studentinvite_list_bloc.dart';

@freezed


class UpdateStudentinviteListState with _$UpdateStudentinviteListState {
  factory UpdateStudentinviteListState.initial() {
    return  UpdateStudentinviteListState(
      isLoading: false,
      isError: false,
      updateStudentData: UpdateStudentData(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory UpdateStudentinviteListState({
    required bool isLoading,
    required bool isError,
    required UpdateStudentData updateStudentData ,
    required Option<Either<MainFailure, UpdateStudentData>> successorFailure,
  }) = _UpdateStudentinviteListState;
}