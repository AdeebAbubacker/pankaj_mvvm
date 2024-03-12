part of 'alive_ordisabled_fieldadmin_bloc.dart';

@freezed
class AliveOrdisabledFieldadminEvent with _$AliveOrdisabledFieldadminEvent {
    const factory AliveOrdisabledFieldadminEvent.started() = _Started;
  const factory AliveOrdisabledFieldadminEvent.togglealive() = _ToggleAlive;
  const factory AliveOrdisabledFieldadminEvent.togglenotalive() = _ToggleNotAlive;

}