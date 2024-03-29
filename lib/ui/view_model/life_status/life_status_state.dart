part of 'life_status_bloc.dart';

@freezed


class LifeStatusState with _$LifeStatusState {
  factory LifeStatusState.initial() {
    return const LifeStatusState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory LifeStatusState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _LifeStatusState;
}