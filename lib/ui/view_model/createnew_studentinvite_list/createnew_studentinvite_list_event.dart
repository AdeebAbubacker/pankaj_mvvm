part of 'createnew_studentinvite_list_bloc.dart';

@freezed
class CreatenewStudentinviteListEvent with _$CreatenewStudentinviteListEvent {
  const factory CreatenewStudentinviteListEvent.started() = _Started;
  const factory CreatenewStudentinviteListEvent.createnewinvitedStudentsList({
    required String name,
    required String phoneNo,
     required String schoolId,
      required String email,
    
  }) = CreatenewinvitedStudentsList;
}
