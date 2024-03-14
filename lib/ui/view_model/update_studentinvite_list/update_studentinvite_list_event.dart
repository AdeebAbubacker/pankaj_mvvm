part of 'update_studentinvite_list_bloc.dart';

@freezed
class UpdateStudentinviteListEvent with _$UpdateStudentinviteListEvent {
  const factory UpdateStudentinviteListEvent.started() = _Started;
  const factory UpdateStudentinviteListEvent.updateinvitedStudentsList({
    required String studentId,
    required String name,
    required String phoneNo,
    required String schoolId,
    required String email,
  }) = _UpdateStudentinviteListEvent;
}
