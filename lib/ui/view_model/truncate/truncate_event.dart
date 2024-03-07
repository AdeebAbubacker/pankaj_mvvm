part of 'truncate_bloc.dart';

@freezed
class TruncateEvent with _$TruncateEvent {
  const factory TruncateEvent.started() = _Started;
   const factory TruncateEvent.deleteTable() = DeleteTable;
}