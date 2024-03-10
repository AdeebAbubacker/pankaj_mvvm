part of 'get_water_source_bloc.dart';

@freezed


class GetWaterSourceState with _$GetWaterSourceState {
  factory GetWaterSourceState.initial() {
    return const GetWaterSourceState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory GetWaterSourceState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _GetWaterSourceState;
}