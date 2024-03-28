part of 'academic_bloc.dart';

@freezed
class AcademicEvent with _$AcademicEvent {
  const factory AcademicEvent.started() = _Started;
  const factory AcademicEvent.postAcademicInfo({
    required final String school,
    required final String reg_no,
    required final String sslc,
    required final String plus_one,
    required final String plus_two,
    required final String course_pref,
    List? achievmentsdatafromHive,
   
  }) = postAcademicInfo;

}
