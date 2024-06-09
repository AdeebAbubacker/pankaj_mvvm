import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'house_plastering_event.dart';
part 'house_plastering_state.dart';
part 'house_plastering_bloc.freezed.dart';




class HousePlasteringBloc extends Bloc<HousePlasteringEvent, HousePlasteringState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  HousePlasteringBloc(this.getAllFieldVerficationService)
      : super(HousePlasteringState.initial()) {
    on<Gethouseplastering>((event, emit) async {
      emit(
        const HousePlasteringState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.housePlastering();
     emit(HousePlasteringState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
  } catch (e) {
   emit(HousePlasteringState(
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

