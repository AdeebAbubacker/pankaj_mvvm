part of 'house_roof_bloc.dart';

@freezed
class HouseRoofEvent with _$HouseRoofEvent {
  const factory HouseRoofEvent.started() = _Started;
    const factory HouseRoofEvent.gethouseroof() = Gethouseroof;
}