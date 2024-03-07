part of 'search_bank_bloc.dart';

@freezed
class SearchBankState with _$SearchBankState {
  factory SearchBankState.initial() {
    return  SearchBankState(
      isLoading: false,
      isError: false,
      searchBank: BankData(), // Assuming you have a default constructor for EventGallery
      successorFailure: None(),
    );
  }

  factory SearchBankState({
    required bool isLoading,
    required bool isError,
    required BankData searchBank,
    required Option<Either<MainFailure, BankData>> successorFailure,
  }) = _SearchBankState;
}



