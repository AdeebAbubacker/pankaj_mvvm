part of 'search_school_bloc.dart';

@freezed
class SearchSchoolState with _$SearchSchoolState {
  factory SearchSchoolState.initial() {
    return SearchSchoolState(
      isLoading: false,
      isError: false,
      school: Searchschool(),
      successorFailure: const None(),
    );
  }
    const factory SearchSchoolState({
    required bool isLoading,
    required bool isError,
    required Searchschool school,
    required Option<Either<MainFailure, Searchschool>> successorFailure,
  }) = _SearchSchoolState;
}

