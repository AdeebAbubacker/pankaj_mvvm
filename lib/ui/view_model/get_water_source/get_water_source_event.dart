part of 'get_water_source_bloc.dart';

@freezed
class GetWaterSourceEvent with _$GetWaterSourceEvent {
  const factory GetWaterSourceEvent.started() = _Started;
   const factory GetWaterSourceEvent.getWaterSource() = GetWaterSource;
}