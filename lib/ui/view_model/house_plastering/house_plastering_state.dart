part of 'house_plastering_bloc.dart';

@freezed
class HousePlasteringState with _$HousePlasteringState {
  factory HousePlasteringState.initial() {
    return const HousePlasteringState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory HousePlasteringState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _HousePlasteringState;
}