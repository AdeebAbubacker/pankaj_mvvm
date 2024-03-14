part of 'students_invite_list_bloc.dart';

@freezed
class StudentsInviteListEvent with _$StudentsInviteListEvent {
  const factory StudentsInviteListEvent.started() = _Started;
   const factory StudentsInviteListEvent.getinvitedStudentsList() = GetinvitedStudentsList;
}