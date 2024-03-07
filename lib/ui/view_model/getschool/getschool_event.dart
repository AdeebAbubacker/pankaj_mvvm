part of 'getschool_bloc.dart';

@freezed
class GetschoolEvent with _$GetschoolEvent {
  const factory GetschoolEvent.started() = _Started;
  const factory GetschoolEvent.getschool() = Getschool;

  const factory GetschoolEvent.editName(
      {required int schoolId, required String newName}) = _EditName;
  const factory GetschoolEvent.deleteschool({required int schoolId}) =
      _Deleteschool;
  const factory GetschoolEvent.addschool({required String schoolname}) =
      _Addschool;
}
