part of 'get_rental_house_bloc.dart';

@freezed
class GetRentalHouseEvent with _$GetRentalHouseEvent {
  const factory GetRentalHouseEvent.started() = _Started;
   const factory GetRentalHouseEvent.gethouseRental() = GethouseRental;
}