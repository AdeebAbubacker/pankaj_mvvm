part of 'applicants_bloc.dart';

@freezed

class ApplicantsState with _$ApplicantsState {
  factory ApplicantsState.initial() {
    return const ApplicantsState(
      isLoading: false,
      isError: false,
      applicants: [],
      successorFailure: None(),
    );
  }
  const factory ApplicantsState({
    required bool isLoading,
    required bool isError,
    required List<Applicants> applicants,
    required Option<Either<MainFailure, List<Applicants>>> successorFailure,
  }) = _ApplicantsState;
}