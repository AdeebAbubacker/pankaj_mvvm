import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alive_ordisabled_fieldadmin_event.dart';
part 'alive_ordisabled_fieldadmin_state.dart';
part 'alive_ordisabled_fieldadmin_bloc.freezed.dart';

class AliveOrdisabledFieldadminBloc extends Bloc<AliveOrdisabledFieldadminEvent,
    AliveOrdisabledFieldadminState> {
  AliveOrdisabledFieldadminBloc()
      : super(AliveOrdisabledFieldadminState.initial(
          notalivefalse: false,
          alivetrue: false,
        )) {
    on<_ToggleAlive>((event, emit) async {
      emit(state.copyWith(
        alivetrue: true,
        notalivefalse: false,
      ));
    });
    on<_ToggleNotAlive>((event, emit) async {
      emit(state.copyWith(
        alivetrue: false,
        notalivefalse: true,
      ));
    });
  }
}
