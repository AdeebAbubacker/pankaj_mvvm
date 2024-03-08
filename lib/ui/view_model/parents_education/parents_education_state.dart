part of 'parents_education_bloc.dart';

@freezed

class ParentsEducationState with _$ParentsEducationState {
  factory ParentsEducationState.initial() {
    return const ParentsEducationState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory ParentsEducationState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _ParentsEducationState;
}