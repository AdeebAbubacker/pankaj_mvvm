part of 'search_occupation_bloc.dart';

@freezed


class SearchOccupationState with _$SearchOccupationState {
  factory SearchOccupationState.initial() {
    return SearchOccupationState(
      isLoading: false,
      isError: false,
      occupation: SearchOccupation(),
      successorFailure: const None(),
    );
  }
  const factory SearchOccupationState({
    required bool isLoading,
    required bool isError,
    required SearchOccupation occupation,
    required Option<Either<MainFailure, SearchOccupation>> successorFailure,
  }) = _SearchOccupationState;
}
