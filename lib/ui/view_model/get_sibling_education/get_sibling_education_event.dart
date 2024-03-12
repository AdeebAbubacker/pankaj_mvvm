part of 'get_sibling_education_bloc.dart';

@freezed
class GetSiblingEducationEvent with _$GetSiblingEducationEvent {
  const factory GetSiblingEducationEvent.started() = _Started;
   const factory GetSiblingEducationEvent.getSiblingEducation() = GetSiblingEducation;
}