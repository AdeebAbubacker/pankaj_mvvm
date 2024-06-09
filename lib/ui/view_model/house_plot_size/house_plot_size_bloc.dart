import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'house_plot_size_event.dart';
part 'house_plot_size_state.dart';
part 'house_plot_size_bloc.freezed.dart';




class HousePlotSizeBloc extends Bloc<HousePlotSizeEvent, HousePlotSizeState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  HousePlotSizeBloc(this.getAllFieldVerficationService)
      : super(HousePlotSizeState.initial()) {
    on<Gethouseplotsize>((event, emit) async {
      emit(
        const HousePlotSizeState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.plotsize();
    emit(HousePlotSizeState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
 } catch (e) {
   emit(HousePlotSizeState(
          isLoading: false,
          isError: true,
          lifestatus: [],
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
  }
    });
  }
}

