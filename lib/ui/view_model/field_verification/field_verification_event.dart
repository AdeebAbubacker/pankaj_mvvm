part of 'field_verification_bloc.dart';

@freezed
class FieldVerificationEvent with _$FieldVerificationEvent {
  const factory FieldVerificationEvent.started() = _Started;
  const factory FieldVerificationEvent.postfieldverification({
    required int f_life_status,
     required int m_life_status,
  }) = Postfieldverification;
}