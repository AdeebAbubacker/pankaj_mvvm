part of 'house_roof_bloc.dart';

@freezed



class HouseRoofState with _$HouseRoofState {
  factory HouseRoofState.initial() {
    return const HouseRoofState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory HouseRoofState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _HouseRoofState;
}