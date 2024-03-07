part of 'getschool_bloc.dart';

@freezed


class GetschoolState with _$GetschoolState {
  factory GetschoolState.initial() {
    return const GetschoolState(
      isLoading: false,
      isError: false,
      school: [],
      successorFailure: None(),
    );
  }
  const factory GetschoolState({
    required bool isLoading,
    required bool isError,
    required List<School> school,
    required Option<Either<MainFailure,List< School>>> successorFailure,
  }) = _GetschoolState;
}
