part of 'getcolleges_bloc.dart';

@freezed
class GetcollegesEvent with _$GetcollegesEvent {
  const factory GetcollegesEvent.started() = _Started;
  const factory GetcollegesEvent.getcolllges() = Getcolleges;
  const factory GetcollegesEvent.editName({required int collegeId,required String newName}) = _EditName;
  const factory GetcollegesEvent.deletecollege({required int collegeId}) = _Deletecollege;
  const factory GetcollegesEvent.addcollege({required String collegename}) =
      _Addcollege;
}