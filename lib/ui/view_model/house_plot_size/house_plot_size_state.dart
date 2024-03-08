part of 'house_plot_size_bloc.dart';

@freezed


class HousePlotSizeState with _$HousePlotSizeState {
  factory HousePlotSizeState.initial() {
    return const HousePlotSizeState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory HousePlotSizeState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _HousePlotSizeState;
}