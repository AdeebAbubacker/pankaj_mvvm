part of 'parents_education_bloc.dart';

@freezed
class ParentsEducationEvent with _$ParentsEducationEvent {
  const factory ParentsEducationEvent.started() = _Started;
  const factory ParentsEducationEvent.getparentseducation() = Getparentseducation;
}