part of 'academic_bloc.dart';

@freezed
class AcademicState with _$AcademicState {
  
    factory AcademicState.initial() {
    return AcademicState(
      isLoading: false,
      isError: false,
      academicData: AcademicData(),
      successorFailure: const None(),
    );
  }

  const factory AcademicState({
    required bool isLoading,
    required bool isError,
    required AcademicData academicData,
    required Option<Either<MainFailure, AcademicData>> successorFailure,
  }) = _AcadenicState;
}
