part of 'life_status_bloc.dart';

@freezed
class LifeStatusEvent with _$LifeStatusEvent {
  const factory LifeStatusEvent.started() = _Started;
  const factory LifeStatusEvent.getlifeStatus() = _GetlifeStatus;
}