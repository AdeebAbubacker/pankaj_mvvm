part of 'applicants_bloc.dart';

@freezed
class ApplicantsEvent with _$ApplicantsEvent {
  const factory ApplicantsEvent.started() = _Started;
  const factory ApplicantsEvent.getallApplicants() = GetallApplicants;
  const factory ApplicantsEvent.getcompletedApplicants() = GetcompletedApplicants;
  const factory ApplicantsEvent.getincompletedApplicants() = GetincompletedApplicants;
}