part of 'alive_ordisabled_fieldadmin_bloc.dart';

@freezed


class AliveOrdisabledFieldadminState with _$AliveOrdisabledFieldadminState {
   factory AliveOrdisabledFieldadminState.initial({
    required bool alivetrue,
    required bool notalivefalse,

  }) = AliveOrdisabledFieldadminStateInitial;
}