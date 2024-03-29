part of 'personal_info_bloc.dart';

@freezed
class PersonalInfoState with _$PersonalInfoState {
  factory PersonalInfoState.initial() {
    return PersonalInfoState(
      isLoading: false,
      isError: false,
      personalInfo: PersonalInfoData(),
      successorFailure: const None(),
    );
  }

  const factory PersonalInfoState({
    required bool isLoading,
    required bool isError,
    required PersonalInfoData personalInfo,
    required Option<Either<MainFailure, PersonalInfoData>> successorFailure,
  }) = _AuthState;
}
