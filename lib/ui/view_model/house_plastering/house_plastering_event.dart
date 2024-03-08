part of 'house_plastering_bloc.dart';

@freezed
class HousePlasteringEvent with _$HousePlasteringEvent {
  const factory HousePlasteringEvent.started() = _Started;
  const factory HousePlasteringEvent.gethouseplastering() = Gethouseplastering;
}