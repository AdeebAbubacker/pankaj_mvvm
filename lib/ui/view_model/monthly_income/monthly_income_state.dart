part of 'monthly_income_bloc.dart';

@freezed
class MonthlyIncomeState with _$MonthlyIncomeState {
  factory MonthlyIncomeState.initial() {
    return const MonthlyIncomeState(
      isLoading: false,
      isError: false,
      lifestatus: [],
      successorFailure: None(),
    );
  }
  const factory MonthlyIncomeState({
    required bool isLoading,
    required bool isError,
    required List<FieldVerificationModel> lifestatus,
    required Option<Either<MainFailure, List<FieldVerificationModel>>> successorFailure,
  }) = _MonthlyIncomeState;
}