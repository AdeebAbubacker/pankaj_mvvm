import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';

part 'get_water_source_event.dart';
part 'get_water_source_state.dart';
part 'get_water_source_bloc.freezed.dart';



class GetWaterSourceBloc extends Bloc<GetWaterSourceEvent, GetWaterSourceState> {
  final GetAllFieldVerficationService getAllFieldVerficationService;
  GetWaterSourceBloc(this.getAllFieldVerficationService)
      : super(GetWaterSourceState.initial()) {
    on<GetWaterSource>((event, emit) async {
      emit(
        const GetWaterSourceState(
            isLoading: true,
            isError: false,
            lifestatus: [],
            successorFailure: None()),
      );
      try {
        final List<FieldVerificationModel> response =
            await getAllFieldVerficationService.getwaterSource();
     emit(GetWaterSourceState(
          isLoading: false,
          isError: false,
          lifestatus: response,
          successorFailure: optionOf(right(response)),
        ));
    } catch (e) {
    emit(GetWaterSourceState(
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


