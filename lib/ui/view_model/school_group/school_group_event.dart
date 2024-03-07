part of 'school_group_bloc.dart';

@freezed
class SchoolGroupEvent with _$SchoolGroupEvent {
  const factory SchoolGroupEvent.started() = _Started;
   const factory SchoolGroupEvent.getschoolgroup() = Getschoolgroup;
     
}