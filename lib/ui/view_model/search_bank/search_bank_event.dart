part of 'search_bank_bloc.dart';

@freezed
class SearchBankEvent with _$SearchBankEvent {
  const factory SearchBankEvent.started() = _Started;
  const factory SearchBankEvent.search({required String bank}) = _Search;
}