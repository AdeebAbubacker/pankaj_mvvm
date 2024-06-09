import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'horizontal_radio_btn_event.dart';
part 'horizontal_radio_btn_state.dart';

class HorizontalRadioBtnBloc extends Bloc<SetGroupValueEvent, HorizontalRadioBtnState> {
  HorizontalRadioBtnBloc(int initialGroupValue)
      : super(HorizontalRadioBtnState(initialGroupValue)) {
    on<SetGroupValueEvent>((event, emit) {
      emit(HorizontalRadioBtnState(event.value));
    });
  }
}
