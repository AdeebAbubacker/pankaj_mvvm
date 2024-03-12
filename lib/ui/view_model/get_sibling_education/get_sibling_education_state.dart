part of 'get_sibling_education_bloc.dart';

@freezed


class GetSiblingEducationState with _$GetSiblingEducationState {
  factory GetSiblingEducationState.initial() {
    return const GetSiblingEducationState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory GetSiblingEducationState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _GetSiblingEducationState;
}