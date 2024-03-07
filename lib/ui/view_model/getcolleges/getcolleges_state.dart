part of 'getcolleges_bloc.dart';

@freezed
class GetcollegesState with _$GetcollegesState {
  factory GetcollegesState.initial() {
    return const GetcollegesState(
      isLoading: false,
      isError: false,
      college: [],
      successorFailure: None(),
    );
  }
  const factory GetcollegesState({
    required bool isLoading,
    required bool isError,
    required List<College> college,
    required Option<Either<MainFailure, List<College>>> successorFailure,
  }) = _GetcollegesState;
}
