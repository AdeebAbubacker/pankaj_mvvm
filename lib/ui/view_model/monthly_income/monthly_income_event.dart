part of 'monthly_income_bloc.dart';

@freezed
class MonthlyIncomeEvent with _$MonthlyIncomeEvent {
  const factory MonthlyIncomeEvent.started() = _Started;
   const factory MonthlyIncomeEvent.getmonthlyincome() = Getmonthlyincome;
}