part of 'field_verification_bloc.dart';

@freezed

class FieldVerificationState with _$FieldVerificationState {

  factory FieldVerificationState.initial() {
    return FieldVerificationState(
      isLoading: false,
      isError: false,
      residentialData: ResidentialData(),
      successorFailure: const None(),
    );
  }
    const factory FieldVerificationState({
    required bool isLoading,
    required bool isError,
    required ResidentialData residentialData,
    required Option<Either<MainFailure, ResidentialData>> successorFailure,
  }) = _FieldVerificationState;
}
