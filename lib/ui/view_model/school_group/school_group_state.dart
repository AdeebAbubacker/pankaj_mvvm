part of 'school_group_bloc.dart';

@freezed
class SchoolGroupState with _$SchoolGroupState {
  factory SchoolGroupState.initial() {
    return const SchoolGroupState(
      isLoading: false,
      isError: false,
      recipients: [],
      successorFailure: None(),
    );
  }
  const factory SchoolGroupState({
    required bool isLoading,
    required bool isError,
    required List<SchoolGroup> recipients,
    required Option<Either<MainFailure, List<SchoolGroup>>> successorFailure,
  }) = _SchoolGroupState;
}