part of 'life_status_bloc.dart';

@freezed
// class LifeStatusState with _$LifeStatusState {
//   const factory LifeStatusState.initial() = _Initial;
// }


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
    required List<LifeStatus> lifestatus,
    required Option<Either<MainFailure, List<LifeStatus>>> successorFailure,
  }) = _LifeStatusState;
}