part of 'delete_student_invitelist_bloc.dart';

@freezed
class DeleteStudentInvitelistEvent with _$DeleteStudentInvitelistEvent {
  const factory DeleteStudentInvitelistEvent.started() = _Started;
  const factory DeleteStudentInvitelistEvent.deleteStudent({required String studentId}) = _DeleteStudent;
}
