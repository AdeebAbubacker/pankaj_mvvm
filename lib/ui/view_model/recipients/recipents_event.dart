part of 'recipents_bloc.dart';

@freezed
class RecipentsEvent with _$RecipentsEvent {
  const factory RecipentsEvent.started() = _Started;
  const factory RecipentsEvent.getallRecipients() = GetallRecipients;
}