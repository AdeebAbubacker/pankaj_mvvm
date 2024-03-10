part of 'get_rental_house_bloc.dart';

@freezed


class GetRentalHouseState with _$GetRentalHouseState {
  factory GetRentalHouseState.initial() {
    return const GetRentalHouseState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory GetRentalHouseState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _GetRentalHouseState;
}