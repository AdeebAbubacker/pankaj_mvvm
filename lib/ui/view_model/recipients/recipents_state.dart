part of 'recipents_bloc.dart';

@freezed

class RecipentsState with _$RecipentsState {
  factory RecipentsState.initial() {
    return const RecipentsState(
      isLoading: false,
      isError: false,
      recipients: [],
      successorFailure: None(),
    );
  }
  const factory RecipentsState({
    required bool isLoading,
    required bool isError,
    required List<Recipient> recipients,
    required Option<Either<MainFailure, List<Recipient>>> successorFailure,
  }) = _RecipentsState;
}